import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/auth/auth_bloc.dart';
import 'package:gohealthination/pages/freequote/home.dart';

import '../../shared/custom_text.dart';
import 'package:gohealthination/shared/custom_button.dart';
import 'package:gohealthination/shared/logo.dart';

import 'auth_progress.dart';
import 'auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    await AuthService.login(email, password).then((value) {
      if(value!=null){
        context.read<AuthCubit>().setToken=value;
        Navigator.pop(context);
      }
      else{
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Hata'),
            content: Text('Giriş yapılamadı. Lütfen tekrar deneyin.'),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Tamam'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const CustomText(
          text: 'Giriş Yap',
          fontSize: 18,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 17, right: 17).r,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                Container(
                  margin: const EdgeInsets.only(top: 69, bottom: 7).r,
                  alignment: Alignment.centerLeft,
                  child: const CustomText(
                    text: 'E-Posta',
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  width: double.infinity,
                  child:  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: "exam@gohealthination.com",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 31, bottom: 7).r,
                  alignment: Alignment.centerLeft,
                  child: const CustomText(
                    text: 'Şifre',
                    fontSize: 16,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  width: double.infinity,
                  child:  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 11).r,
                  alignment: Alignment.centerRight,
                  child: const CustomText(
                    text: 'Şifreni mi Unuttun?',
                    fontSize: 13,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 71).r,
                    width: double.infinity,
                    child: CustomButton(
                      type: ButtonType.darkTheme,
                      text: 'Giriş Yap',
                      function: () {

                        _login();
                      },
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
