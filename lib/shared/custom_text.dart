import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final int? maxLines;
  final double? fontSize;
  final double? minFontSize;
  final double? maxFontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextOverflow? textOverFlow;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  const CustomText(
      {super.key,
      this.text,
      this.maxLines,
      this.fontSize,
      this.minFontSize,
      this.maxFontSize,
      this.textOverFlow,
      this.color,
      this.textAlign,
      this.fontWeight,
      this.letterSpacing,
      this.wordSpacing});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
          fontFamily: 'montserrat',
          fontSize: fontSize?.sp ?? 26.sp,
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          letterSpacing: letterSpacing?.sp ?? 0.1.sp,
          wordSpacing: wordSpacing?.sp ?? 5.sp),
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 1,
      overflow: textOverFlow ?? TextOverflow.ellipsis,
    );
  }
}
