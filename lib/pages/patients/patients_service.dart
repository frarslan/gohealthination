import 'dart:convert';

import 'package:gohealthination/pages/patients/models/patientsdetailmodel.dart';
import 'package:gohealthination/pages/patients/models/patientsmodel.dart';
import 'package:http/http.dart' as http;
import '../auth/auth_progress.dart';
import 'models/patientsusermodel.dart';


class PatientsService{
  final String url = 'https://backend.gohealthination.com/orders/?get_all=true';
  final String urldetail = 'https://backend.gohealthination.com/orders/';
  final String urlusers = 'https://backend.gohealthination.com/users/';

  Future<List<Result>?> bringPatients() async {
    var token = await AuthProcess().getToken;
    if (token == null) {
      throw Exception("Token not found not");
    }
    var response = await http.get(Uri.parse(url),
        headers: {
      'Accept-Charset': 'utf-8',
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Token $token'
    });

      if(response.statusCode==200){
      var responseBody = response.body;
      var encodedBody = utf8.decode(responseBody.runes.toList());
       //dynamic decodedBody = jsonDecode(encodedBody);
      var jsonBody = resultModelFromJson(encodedBody);

      return jsonBody;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    return null;
  }

    Future<PatientsDetailModel?> bringPatientsDetail(int id) async {
      var token = await AuthProcess().getToken;
      if (token == null) {
        throw Exception("Token not found not");
      }
      var response = await http.get(Uri.parse(urldetail+id.toString()), headers: {
        'Accept-Charset': 'utf-8',
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Token $token'
      });

      if(response.statusCode==200){
        var responseBody = response.body;
        var encodedBody = utf8.decode(responseBody.runes.toList());
        var jsonBody = PatientsDetailModel.fromJson(jsonDecode(encodedBody));
        return jsonBody;
      } else {
        print("istek olumsuz =>${response.statusCode}");
      }
      return null;

    }

  Future<PatientsUsermodel?> bringPatientsUsersDetail(int id) async {
    var token = await AuthProcess().getToken;
    if (token == null) {
      throw Exception("Token not found not");
    }
    var response = await http.get(Uri.parse(urlusers+id.toString()),
        headers: {
          'Accept-Charset': 'utf-8',
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Token $token'
        });
   // print(response.body);
    if(response.statusCode==200){
      var responseBody = response.body;
      var encodedBody = utf8.decode(responseBody.runes.toList());
      var jsonBody = PatientsUsermodel.fromJson(jsonDecode(encodedBody));

      return jsonBody;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    return null;
  }

}