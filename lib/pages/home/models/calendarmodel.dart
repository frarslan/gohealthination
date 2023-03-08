// To parse this JSON data, do
//
//     final calendarDetailModel = calendarDetailModelFromJson(jsonString);

import 'dart:convert';

CalendarDetailModel calendarDetailModelFromJson(dynamic str) => CalendarDetailModel.fromJson(str);

String calendarDetailModelToJson(CalendarDetailModel data) => json.encode(data.toJson());

class CalendarDetailModel {
  CalendarDetailModel({
    this.calendarNotes=const [],
    this.flights=const [],
    this.onlineMeetings=const [],
    this.hotelRegisters=const [],
    this.hospitalRegisters=const [],
  });

  List<dynamic>? calendarNotes;
  List<Flight> flights;
  List<OnlineMeeting> onlineMeetings;
  List<HotelRegister> hotelRegisters;
  List<HospitalRegister> hospitalRegisters;

  factory CalendarDetailModel.fromJson(Map<String, dynamic> json) => CalendarDetailModel(
    calendarNotes: List<dynamic>.from(json["calendar_notes"]?.map((x) => x)),
    flights: List<Flight>.from(json["flights"].map((x) => Flight.fromJson(x))),
    onlineMeetings: List<OnlineMeeting>.from(json["onlineMeetings"].map((x) => OnlineMeeting.fromJson(x))),
    hotelRegisters: List<HotelRegister>.from(json["hotelRegisters"].map((x) => HotelRegister.fromJson(x))),
    hospitalRegisters: List<HospitalRegister>.from(json["hospitalRegisters"].map((x) => HospitalRegister.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "calendar_notes": List<dynamic>.from(calendarNotes!.map((x) => x)),
    "flights": List<dynamic>.from(flights.map((x) => x.toJson())),
    "onlineMeetings": List<dynamic>.from(onlineMeetings.map((x) => x.toJson())),
    "hotelRegisters": List<dynamic>.from(hotelRegisters.map((x) => x.toJson())),
    "hospitalRegisters": List<dynamic>.from(hospitalRegisters.map((x) => x.toJson())),
  };
}

class Flight {
  Flight({
    this.id,
    this.toAirport,
    this.flightDate,
    this.flightArrival,
    this.airway,
    this.flightNumber,
    this.flightAgent,
    this.price,
    this.currency,
    this.fileUpload,
    this.patient,
    this.order,
    this.fromCountry,
    this.fromState,
    this.fromCity,
  });

  int? id;
  ToAirport? toAirport;
  String? flightDate;
  String? flightArrival;
  String? airway;
  String? flightNumber;
  String? flightAgent;
  String? price;
  String? currency;
  dynamic fileUpload;
  int? patient;
  int? order;
  int? fromCountry;
  int? fromState;
  int? fromCity;

  factory Flight.fromJson(Map<String, dynamic> json) => Flight(
    id: json["id"],
    toAirport: ToAirport.fromJson(json["toAirport"]),
    flightDate: json["flightDate"],
    flightArrival: json["flightArrival"],
    airway: json["airway"],
    flightNumber: json["flightNumber"],
    flightAgent: json["flightAgent"],
    price: json["price"],
    currency: json["currency"],
    fileUpload: json["fileUpload"],
    patient: json["patient"],
    order: json["order"],
    fromCountry: json["fromCountry"],
    fromState: json["fromState"],
    fromCity: json["fromCity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "toAirport": toAirport?.toJson(),
    "flightDate": flightDate,
    "flightArrival": flightArrival,
    "airway": airway,
    "flightNumber": flightNumber,
    "flightAgent": flightAgent,
    "price": price,
    "currency": currency,
    "fileUpload": fileUpload,
    "patient": patient,
    "order": order,
    "fromCountry": fromCountry,
    "fromState": fromState,
    "fromCity": fromCity,
  };
}

class ToAirport {
  ToAirport({
    this.id,
    this.country,
    this.state,
    this.city,
    this.airportName,
    this.airportCode,
  });

  int? id;
  String? country;
  String? state;
  String? city;
  String? airportName;
  String? airportCode;

  factory ToAirport.fromJson(Map<String, dynamic> json) => ToAirport(
    id: json["id"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
    airportName: json["airportName"],
    airportCode: json["airportCode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country": country,
    "state": state,
    "city": city,
    "airportName": airportName,
    "airportCode": airportCode,
  };
}

class HospitalRegister {
  HospitalRegister({
    this.id,
    this.operationDate,
    this.entryDate,
    this.exitDate,
    this.price,
    this.currency,
    this.fileUpload,
    this.relatedPerson,
    this.relatedPersonPhone,
    this.patient,
    this.order,
    this.doctor,
    this.hospital,
  });

  int? id;
  DateTime? operationDate;
  DateTime? entryDate;
  DateTime? exitDate;
  int? price;
  String? currency;
  dynamic fileUpload;
  String? relatedPerson;
  String? relatedPersonPhone;
  int? patient;
  int? order;
  int? doctor;
  int? hospital;

  factory HospitalRegister.fromJson(Map<String, dynamic> json) => HospitalRegister(
    id: json["id"],
    operationDate: DateTime.parse(json["operationDate"]),
    entryDate: DateTime.parse(json["entryDate"]),
    exitDate: DateTime.parse(json["exitDate"]),
    price: json["price"],
    currency: json["currency"],
    fileUpload: json["fileUpload"],
    relatedPerson: json["relatedPerson"],
    relatedPersonPhone: json["relatedPersonPhone"],
    patient: json["patient"],
    order: json["order"],
    doctor: json["doctor"],
    hospital: json["hospital"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "operationDate": "${operationDate?.year.toString().padLeft(4, '0')}-${operationDate?.month.toString().padLeft(2, '0')}-${operationDate?.day.toString().padLeft(2, '0')}",
    "entryDate": "${entryDate?.year.toString().padLeft(4, '0')}-${entryDate?.month.toString().padLeft(2, '0')}-${entryDate?.day.toString().padLeft(2, '0')}",
    "exitDate": "${exitDate?.year.toString().padLeft(4, '0')}-${exitDate?.month.toString().padLeft(2, '0')}-${exitDate?.day.toString().padLeft(2, '0')}",
    "price": price,
    "currency": currency,
    "fileUpload": fileUpload,
    "relatedPerson": relatedPerson,
    "relatedPersonPhone": relatedPersonPhone,
    "patient": patient,
    "order": order,
    "doctor": doctor,
    "hospital": hospital,
  };
}

class HotelRegister {
  HotelRegister({
    this.id,
    this.bookingDate,
    this.entryDate,
    this.exitDate,
    this.price,
    this.fileUpload,
    this.relatedPerson,
    this.relatedPersonPhone,
    this.patient,
    this.order,
    this.hotel,
  });

  int? id;
  DateTime? bookingDate;
  DateTime? entryDate;
  DateTime? exitDate;
  int? price;
  dynamic fileUpload;
  String? relatedPerson;
  String? relatedPersonPhone;
  int? patient;
  int? order;
  int? hotel;

  factory HotelRegister.fromJson(Map<String, dynamic> json) => HotelRegister(
    id: json["id"],
    bookingDate: DateTime.parse(json["bookingDate"]),
    entryDate: DateTime.parse(json["entryDate"]),
    exitDate: DateTime.parse(json["exitDate"]),
    price: json["price"],
    fileUpload: json["fileUpload"],
    relatedPerson: json["relatedPerson"],
    relatedPersonPhone: json["relatedPersonPhone"],
    patient: json["patient"],
    order: json["order"],
    hotel: json["hotel"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bookingDate": "${bookingDate?.year.toString().padLeft(4, '0')}-${bookingDate?.month.toString().padLeft(2, '0')}-${bookingDate?.day.toString().padLeft(2, '0')}",
    "entryDate": "${entryDate?.year.toString().padLeft(4, '0')}-${entryDate?.month.toString().padLeft(2, '0')}-${entryDate?.day.toString().padLeft(2, '0')}",
    "exitDate": "${exitDate?.year.toString().padLeft(4, '0')}-${exitDate?.month.toString().padLeft(2, '0')}-${exitDate?.day.toString().padLeft(2, '0')}",
    "price": price,
    "fileUpload": fileUpload,
    "relatedPerson": relatedPerson,
    "relatedPersonPhone": relatedPersonPhone,
    "patient": patient,
    "order": order,
    "hotel": hotel,
  };
}

class OnlineMeeting {
  OnlineMeeting({
    this.id,
    this.participants=const [],
    this.meetingDateTime,
    this.notes,
    this.patient,
    this.order,
    this.outcome,
  });

  int? id;
  List<int> participants;
  String? meetingDateTime;
  String? notes;
  int? patient;
  int? order;
  dynamic outcome;

  factory OnlineMeeting.fromJson(Map<String, dynamic> json) => OnlineMeeting(
    id: json["id"],
    participants: List<int>.from(json["participants"].map((x) => x)),
    meetingDateTime: json["meetingDateTime"],
    notes: json["notes"],
    patient: json["patient"],
    order: json["order"],
    outcome: json["outcome"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "participants": List<dynamic>.from(participants.map((x) => x)),
    "meetingDateTime": meetingDateTime,
    "notes": notes,
    "patient": patient,
    "order": order,
    "outcome": outcome,
  };
}
