import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/pages/auth/auth_bloc.dart';
import 'package:gohealthination/shared/custom_button.dart';
import 'package:gohealthination/shared/logo.dart';
import 'logi.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16).r,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                Container(
                    margin: const EdgeInsets.only(top: 97).r,
                    width: double.infinity,
                    child: CustomButton(
                      type: ButtonType.darkTheme,
                      text: 'Giriş Yap',
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                    )),
                /*  Container(
                    margin: const EdgeInsets.only(top: 26).r,
                    width: double.infinity,
                    child: CustomButton(
                      type: ButtonType.lightTheme,
                      text: 'Yeni Hesap Oluştur',
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewAccount()));
                      },
                    )),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
