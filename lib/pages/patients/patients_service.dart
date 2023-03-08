import 'dart:convert';

import 'package:gohealthination/pages/patients/models/patientsdetailmodel.dart';
import 'package:gohealthination/pages/patients/models/patientsmodel.dart';
import 'package:http/http.dart' as http;

import '../auth/auth_progress.dart';


class PatientsService{
  final String url = 'https://backend.gohealthination.com/orders/?get_all=true';   // ?role=Pt';
  final String urlde = 'https://backend.gohealthination.com/orders/';   // ?role=Pt';

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
    var response = await http.get(Uri.parse(urlde+id.toString()), headers: {
      'Accept-Charset': 'utf-8',
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Token $token'
    });
    print(response.body);
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


}