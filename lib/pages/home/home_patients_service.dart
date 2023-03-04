import 'dart:convert';

import 'package:http/http.dart' as http;

import '../auth/auth_progress.dart';
import 'models/homepatientsmodel.dart';


class HomePatientsService{
  final String url = 'https://backend.gohealthination.com/users/?get_all=true&is_active=true&role=Pt';   // ?role=Pt';
  final String urla = 'https://backend.gohealthination.com/users/?get_all=true&is_active=true&status=AP';   // ?role=Pt';
  final String urlc = 'https://backend.gohealthination.com/users/?get_all=true&is_active=true&status=CP';   // ?role=Pt';

  Future<List<Results>?> bringPatients() async {
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
    print('Tüm Hastalar listendi.');
    print(token);

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
  Future<List<Results>?> bringActivePatients() async {
    var token = await AuthProcess().getToken;
    if (token == null) {
      throw Exception("Token not found not");
    }
    var response = await http.get(Uri.parse(urla),
        headers: {
          'Accept-Charset': 'utf-8',
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Token $token'
        });
    print('Aktif  Hastalar Listelendi');
    print(token);

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
  Future<List<Results>?> bringCandidatePatients() async {
    var token = await AuthProcess().getToken;
    if (token == null) {
      throw Exception("Token not found not");
    }
    var response = await http.get(Uri.parse(urlc),
        headers: {
          'Accept-Charset': 'utf-8',
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Token $token'
        });
    print('Aday  Hastalar Listelendi');
    print(token);

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
}