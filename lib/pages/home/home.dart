import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gohealthination/shared/custom_text.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../shared/calendar.dart';
import 'home_patients_service.dart';
import 'models/homepatientsmodel.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color color1 = const Color(0xff3e2093);
  Color color2 = const Color(0xff37b2cb);
  Color color3 = const Color(0xfffef5e4);

  final HomePatientsService _service = HomePatientsService();
  List<Results> _patients = [];
  List<Results> _patientsActive = [];
  List<Results> _patientsCandidate = [];
  bool? isLoading;


  @override
  void initState() {
    super.initState();
    _service.bringPatients().then((value) {
      if (_service != null && value != null) {
        setState(() {
          _patients = value;
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
    _service.bringActivePatients().then((value) {
      if (_service != null && value != null) {
        setState(() {
          _patientsActive = value;
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
    _service.bringCandidatePatients().then((value) {
      if (_service != null && value != null) {
        setState(() {
          _patientsCandidate = value;
          isLoading = true;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                elevation: 3,
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  //  side: BorderSide(color: color1, width: ScreenUtil().setWidth(2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(height: 140.h,
                  width: 100.w,
                  padding: const EdgeInsets.all(10).r,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(12).r,
                          decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color3),
                          child:
                          Icon(Icons.people, color: color1)),
                      CustomText(text: "${_patients.length}", fontSize: 26.sp),
                      CustomText(text: "Patients", fontSize: 24.sp),
                    ],
                  ),

                ),
              ),
              Card(
                elevation: 3,
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  //  side: BorderSide(color: color1, width: ScreenUtil().setWidth(2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(height: 140.h,
                  width: 100.w,
                  padding: const EdgeInsets.all(10).r,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(12).r,
                          decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color3),
                          child:
                          const Icon(
                              Icons.monitor_heart_outlined, color: Colors.red)),
                      CustomText(
                          text: "${_patientsActive.length}", fontSize: 26.sp),
                      CustomText(text: "A. Patients", fontSize: 20.sp),
                    ],
                  ),

                ),
              ),
              Card(
                elevation: 3,
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  //  side: BorderSide(color: color1, width: ScreenUtil().setWidth(2)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(height: 140.h,
                  width: 100.w,
                  padding: const EdgeInsets.all(10).r,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(12).r,
                          decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color3),
                          child:
                          Icon(Icons.monitor_heart_outlined, color: color1)),
                      CustomText(text: "${_patientsCandidate.length}",
                          fontSize: 26.sp),
                      CustomText(text: "C. Patients", fontSize: 20.sp),
                    ],
                  ),

                ),
              ),
            ],
          ),
          Card(
            elevation: 3,
            color: Colors.white70,
            shape: RoundedRectangleBorder(
              //  side: BorderSide(color: color1, width: ScreenUtil().setWidth(2)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: const EdgeInsets.all(10).r,
              alignment: Alignment.center,
              child: CalendarWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
 /* List<Appointment> getAppointments() {
    List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
    DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

    meetings.add(Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: 'Board Meeting',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;COUNT=6',
        isAllDay: false));

    meetings.add(Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: 'Board Meeting',
        color: Colors.yellow,
        recurrenceRule: 'FREQ=DAILY;COUNT=2',
        isAllDay: false));

    return meetings;
  }

  class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
  appointments = source;
  }
  }*/


