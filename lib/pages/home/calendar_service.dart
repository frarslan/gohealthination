import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:gohealthination/shared/service/service_interceptor.dart';
import 'models/calendarmodel.dart';

class CalendarService {
  final DioClient _dioClient = DioClient();

  Future<CalendarDetailModel> getEvents() async {
    Response response = await _dioClient.dio.post('/additions/calendar_monthly/', data: {
      "label": [
        "flights",
        "onlineMeetings",
        "hospitalRegisters",
        "hotelRegisters",
        "calendar_notes"
      ],
      "next": -1
    });
    return calendarDetailModelFromJson(response.data);
  }


}