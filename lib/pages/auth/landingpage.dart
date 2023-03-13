import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/shared/custom_button.dart';
import '../../shared/landing.dart';
import '../../shared/logo.dart';
import '../pages_manager.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
                Container(width:double.infinity,
                    child: const Landing()),
                Container(
                    margin: const EdgeInsets.only(top: 97).r,
                    width: double.infinity,
                    child: CustomButton(
                      type: ButtonType.darkTheme,
                      text: 'Next',
                      function: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  PagesManager()));
                      },
                    )),
                SizedBox(
                    width:120.w,
                    child: const Logo()),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
