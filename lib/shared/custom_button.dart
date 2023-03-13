import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/shared/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.function,
      required this.text,
      required this.type});

  final Function() function;
  final String text;
  final ButtonType type;

  final _colorPurple = const Color(0xff7367f0);
  final _colorGrey = const Color(0xfff0f0f0);
  final _colorRed =  Colors.red;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            maximumSize: MaterialStateProperty.all(Size(381.w, 52.h)),
            minimumSize: MaterialStateProperty.all(Size(381.w, 52.h)),
            backgroundColor: MaterialStateProperty.all(buttonColor())),
        child: CustomText(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textColor(),
        ));
  }

  buttonColor() {
    switch (type) {
      case ButtonType.darkTheme:
        return _colorPurple;
      case ButtonType.lightTheme:
        return _colorGrey;
      case ButtonType.redTheme:
        return _colorRed;
    }
  }

  textColor() {
    switch (type) {
      case ButtonType.darkTheme:
        return Colors.white;
      case ButtonType.lightTheme:
        return Colors.black;
      case ButtonType.redTheme:
        return Colors.white;
    }
  }
}

enum ButtonType { darkTheme, lightTheme, redTheme }
