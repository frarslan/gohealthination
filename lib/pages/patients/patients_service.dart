import 'dart:convert';

import 'package:gohealthination/pages/patients/models/patientsmodel.dart';
import 'package:http/http.dart' as http;

import '../auth/auth_progress.dart';


class PatientsService{
  final String url = 'https://backend.gohealthination.com/users/?get_all=true&is_active=true&role=Pt';   // ?role=Pt';

  Future<List<Result>?> bringPatients() async {
    var token = await AuthProcess().getToken;
    if (token == null) {
      throw Exception("Token not found");
    }
    var response = await http.get(Uri.parse(url),
        headers: {
      'Accept-Charset': 'utf-8',
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Token $token'
    });
    print(response.body);
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

  Future<Patientsmodel?> bringPatientssDetail(int id) async {
    var response = await http.get(Uri.parse(url+id.toString()), headers: {
      'Accept-Charset': 'utf-8',
      'Content-Type': 'application/json; charset=utf-8',
    });
    if(response.statusCode==200){
      var responseBody = response.body;
      var encodedBody = utf8.decode(responseBody.runes.toList());
      var jsonBody = Patientsmodel.fromJson(jsonDecode(encodedBody));
      return jsonBody;
    } else {
      print("istek olumsuz =>${response.statusCode}");
    }
    return null;

  }
  Future<void> updateDetaill(int id) async {
    var response = await http.patch(
      Uri.parse('$url$id/'),
      headers: {
        'Accept-Charset': 'utf-8',
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode({
        'confirmed': true,
      }),
    );

    if (response.statusCode == 200) {
      print('Patients is confirmed!');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  Future<void> updateDetail(int id) async {
    var response = await http.put(Uri.parse(url+id.toString()), headers: {
      'Accept-Charset': 'utf-8',
      'Content-Type': 'application/json; charset=utf-8',
    }, body: jsonEncode({
      'confirmed': true,
    }));
    if(response.statusCode==200){
      print("Patients is confirmed!");
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }
  Future<void> deletePatients(int id) async {
    final response = await http.delete(Uri.parse(url+id.toString()));
    if (response.statusCode == 204) {
      print('Kayıt silindi.');
    } else {
      throw Exception('Kayıt silinemedi.');
    }
  }
}