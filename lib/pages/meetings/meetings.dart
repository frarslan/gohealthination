import 'package:flutter/material.dart';
import 'package:gohealthination/shared/custom_text.dart';

class Meetings extends StatefulWidget {
  const Meetings({Key? key}) : super(key: key);

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  @override
  Widget build(BuildContext context) {
    return const CustomText(text: 'Meetings',);
  }
}
