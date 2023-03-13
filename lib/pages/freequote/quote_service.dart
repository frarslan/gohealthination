import 'dart:convert';

import 'package:gohealthination/pages/freequote/models/detailmodel.dart';
import 'package:gohealthination/pages/freequote/models/treatmentwidemodel.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../../shared/service/service_interceptor.dart';
import '../auth/auth_progress.dart';
import 'models/freequotemodel.dart';

class QuoteService{
  final DioClient _dioClient = DioClient();
  final String url = 'https://backend.gohealthination.com/additions/freequote/';
  final String urltre = 'https://backend.gohealthination.com/orders/treatment_wide/';

  Future<Freequotemodel?> bringQuotes() async {

    var response = await http.get(Uri.parse(url), headers: {
      'Accept-Charset': 'utf-8',
      'Content-Type': 'application/json; charset=utf-8',

    });
    if(response.statusCode==200){
      var responseBody = response.body;
      var encodedBody = utf8.decode(responseBody.runes.toList());
      var jsonBody = Freequotemodel.fromJson(jsonDecode(encodedBody));
      return jsonBody;
    } else {
      print("istek olumsuz =>${response.statusCode}");
    }
    return null;
  }

  Future<TreatmentWideModel> bringtreatmentt() async {
    Response response = await _dioClient.dio.get('/orders/treatment_wide/');
    return treatmentWideModelFromJson(response.data);
  }


  Future<TreatmentWideModel?> bringtreatment() async {

    var response = await http.get(Uri.parse(urltre), headers: {
      'Accept-Charset': 'utf-8',
      'Content-Type': 'application/json; charset=utf-8',
    });
    if(response.statusCode==200){
      var responseBody = response.body;
      var encodedBody = utf8.decode(responseBody.runes.toList());
      var jsonBody = TreatmentWideModel.fromJson(jsonDecode(encodedBody));
      return jsonBody;
    } else {
      print("istek olumsuz =>${response.statusCode}");
    }
    return null;
  }
  Future<Detailmodel?> bringQuotesDetail(int id) async {
    var response = await http.get(Uri.parse(url+id.toString()), headers: {
      'Accept-Charset': 'utf-8',
      'Content-Type': 'application/json; charset=utf-8',
    });
    if(response.statusCode==200){
      var responseBody = response.body;
      var encodedBody = utf8.decode(responseBody.runes.toList());
      var jsonBody = Detailmodel.fromJson(jsonDecode(encodedBody));
      return jsonBody;
    } else {
      print("istek olumsuz =>${response.statusCode}");
    }
    return null;

  }

  Future<Detailmodel?> updateDetaill(int id) async {
    var token = await AuthProcess().getToken;
    if (token == null) {
      throw Exception("Token not found");
    }
    var response = await http.patch(
      Uri.parse('$url$id'),
      headers: {
        'Accept-Charset': 'utf-8',
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Token $token'
      },
      body: jsonEncode({
        'confirmed': true,
      }),
    );
    if (response.statusCode == 204) {
      print('Quote is confirmed!');
      var responseBody = response.body;
      var encodedBody = utf8.decode(responseBody.runes.toList());
      var jsonBody = Detailmodel.fromJson(jsonDecode(encodedBody));
      return jsonBody;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null;
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
      print("Quote is confirmed!");
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }
  Future<void> deleteQuote(int id) async {
    final response = await http.delete(Uri.parse(url+id.toString()));

    if (response.statusCode == 204) {
      print('Kayıt silindi.');
    } else {
      throw Exception('Kayıt silinemedi.');
    }
  }
}