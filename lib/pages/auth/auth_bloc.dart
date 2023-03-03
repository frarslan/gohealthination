import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gohealthination/pages/auth/auth_progress.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.loading);

  final AuthProcess _authProcess = AuthProcess();

  get getToken async {
    emit(AuthState.loading);
    await _authProcess.getToken.then((value) {
      if(value!=null){
        emit(AuthState.online);
      }
      else emit(AuthState.offline);
    });
  }

  set setToken(String token) {
    _authProcess.setToken = token;
    getToken;
  }

}

enum AuthState { loading, online, offline }
