import 'package:flutter/material.dart';

abstract class PageGeneral {
  late String title;
  late IconData icon;
}

class HomePage extends PageGeneral {
  @override
  String get title => 'Ana Sayfa';
  @override
  IconData get icon => Icons.home;
}

class FormsPage extends PageGeneral {
  @override
  String get title => 'Formlar';
  @override
  IconData get icon => Icons.file_copy;
}

class PatientsPage extends PageGeneral {
  @override
  String get title => 'Hastalar';
  @override
  IconData get icon => Icons.person;
}

class MeetingsPage extends PageGeneral {
  @override
  String get title => 'Meetings';
  @override
  IconData get icon => Icons.meeting_room;
}

class TasksPage extends PageGeneral {
  @override
  String get title => 'Görevler';
  @override
  IconData get icon => Icons.task;
}
