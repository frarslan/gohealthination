import 'package:shared_preferences/shared_preferences.dart';

class AuthProcess {
  AuthProcess() {
    init();
  }

  SharedPreferences? _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get getToken async {
    if(_prefs!=null){
      return _prefs?.getString('token');
    }else{
      _prefs = await SharedPreferences.getInstance();
      return _prefs?.getString('token');
    }
  }

  set setToken(String token) {
    _prefs?.setString('token', token);
  }
}
