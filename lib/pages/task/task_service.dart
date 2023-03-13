
import 'dart:convert';

import '../auth/auth_progress.dart';
import 'package:http/http.dart' as http;

import 'models/tasksmodel.dart';
import 'models/collaboratorsmodel.dart' as colla;

class TasksService {

  final String url = 'https://backend.gohealthination.com/actions/task';
  final String urlcol = 'http://backend.gohealthination.com/users/user_list/?is_staff=True';

  Future<List<Result>?> bringTasks() async {
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
      var jsonBody = resultModelFromJson(encodedBody);

      return jsonBody;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    return null;
  }

  Future<List<colla.Result>?> bringCollaborators() async {
    var token = await AuthProcess().getToken;
    if (token == null) {
      throw Exception("Token not found not");
    }
    var response = await http.get(Uri.parse(urlcol),
        headers: {
          'Accept-Charset': 'utf-8',
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Token $token'
        });

    if(response.statusCode==200){
      var responseBody = response.body;
      var encodedBody = utf8.decode(responseBody.runes.toList());
      var jsonBody = colla.resultModelFromJson(encodedBody);

      return jsonBody;
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    return null;
  }

}