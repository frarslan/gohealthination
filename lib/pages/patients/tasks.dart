import 'package:flutter/material.dart';
import 'package:gohealthination/shared/custom_text.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return const CustomText(text: 'Tasks',);
  }
}
