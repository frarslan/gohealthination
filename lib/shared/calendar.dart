import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

import '../pages/home/calendar_service.dart';
import '../pages/home/models/calendarmodel.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
   CalendarDetailModel _events = CalendarDetailModel();
  final CalendarService _calendarService = CalendarService();
  @override
  void initState() {
    super.initState();
    _getEvents();
  }

  Future<void> _getEvents() async {
    final events = await _calendarService.getEvents();
    setState(() {
       _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      dataSource: _getCalendarDataSource(),
    );
  }

  CalendarDataSource _getCalendarDataSource() {
    List<Appointment> appointments = [];

    _events.flights.forEach((event) {
      appointments.add(Appointment(
        id: event.id,
        startTime: DateTime.parse(event.flightArrival!),
        endTime: DateTime.parse(event.flightDate!),
        subject: 'Flight',
        color: Colors.black,
      ));
    });
    _events.hospitalRegisters.forEach((event) {
      appointments.add(Appointment(
        id: event.id,
        startTime: event.entryDate!,
        endTime: event.exitDate!,
        subject: 'Hospital',
        color: Colors.orange,
      ));
    });
    _events.hotelRegisters.forEach((event) {
      appointments.add(Appointment(
        id: event.id,
        startTime: event.entryDate!,
        endTime: event.exitDate!,
        subject: 'Hotel',
        color: Colors.green,
      ));
    });
    _events.onlineMeetings.forEach((event) {
      appointments.add(Appointment(
        id: event.id,
        startTime: DateTime.parse(event.meetingDateTime!),
        endTime: DateTime.parse(event.meetingDateTime!),
        subject: 'Meeting',
        color: Colors.red,
      ));
    });
    return AppointmentDataSource(appointments);
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].startTime!;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].endTime!;
  }

  @override
  String getSubject(int index) {
    return appointments![index].subject;
  }

  @override
  Color getColor(int index) {
    return appointments![index].color;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}