import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gohealthination/pages/home/home.dart';
import 'package:gohealthination/pages/meetings/meetings.dart';
import 'package:gohealthination/pages/pages_route_cubit.dart';
import 'package:gohealthination/core/custom_appbar.dart';
import 'package:gohealthination/core/custom_bottombar.dart';
import 'package:gohealthination/core/menu_items.dart';
import 'package:gohealthination/pages/patients/patients.dart';
import 'package:gohealthination/pages/patients/tasks.dart';

import 'freequote/quote.dart';

class PagesManager extends StatelessWidget {
  const PagesManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  CustomAppbar(),
        // drawer: const CustomDrawer(),
        body: BlocBuilder<PagesRoute, PageGeneral>(
          builder: (context, state) {
            return Container(
                padding: const EdgeInsets.all(0), child: selectionPage(state));
          },
        ),
        bottomNavigationBar: CustomBottomBar());
  }

  Widget selectionPage(PageGeneral page) {
    if (page is HomePage) {
      return const Home();
    } else if (page is FormsPage) {
      return const Quote();
    } else if (page is PatientsPage) {
      return const Patients();
    } else if (page is MeetingsPage) {
      return const Meetings();
    } else {
      return const Tasks();
    }
  }
}
