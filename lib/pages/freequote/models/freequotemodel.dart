// To parse this JSON data, do
//
//     final freequotemodel = freequotemodelFromJson(jsonString);

import 'dart:convert';

Freequotemodel freequotemodelFromJson(String str) => Freequotemodel.fromJson(json.decode(str));

String freequotemodelToJson(Freequotemodel data) => json.encode(data.toJson());

class Freequotemodel {
  Freequotemodel({
    this.count,
    this.next,
    this.previous,
    this.results=const [],
  });

  int? count;
  String? next;
  String? previous;
  List<Result> results;

  factory Freequotemodel.fromJson(Map<String, dynamic> json) => Freequotemodel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.fullName,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.message,
    this.isOnlineMeeting,
    this.confirmed,
    this.source,
    this.createdAt,
     this.treatment,
    this.subTreatment,
    this.owner,
    this.relatedPerson,
  });

  int? id;
  String? fullName;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? message;
  String? isOnlineMeeting;
  bool? confirmed;
  String? source;
  String? createdAt;
  int? treatment;
  int? subTreatment;
  int? owner;
  int? relatedPerson;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    fullName: json["full_name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    message: json["message"],
    isOnlineMeeting: json["isOnlineMeeting"],
    confirmed: json["confirmed"],
    source: json["source"],
    createdAt: json["created_at"],
    treatment: json["treatment"],
    subTreatment: json["subTreatment"],
    owner: json["owner"],
    relatedPerson: json["relatedPerson"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "message": message,
    "isOnlineMeeting": isOnlineMeeting,
    "confirmed": confirmed,
    "source": source,
    "created_at": createdAt,
    "treatment": treatment,
    "subTreatment": subTreatment,
    "owner": owner,
    "relatedPerson": relatedPerson,
  };
}
