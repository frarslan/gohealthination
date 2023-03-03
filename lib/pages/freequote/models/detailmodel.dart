// To parse this JSON data, do
//
//     final detailmodel = detailmodelFromJson(jsonString);

import 'dart:convert';

Detailmodel detailmodelFromJson(String str) => Detailmodel.fromJson(json.decode(str));

String detailmodelToJson(Detailmodel data) => json.encode(data.toJson());

class Detailmodel {
  Detailmodel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.confirmed,
    this.message,
    this.source,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  bool? confirmed;
  String? message;
  String? source;

  factory Detailmodel.fromJson(Map<String, dynamic> json) => Detailmodel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    confirmed: json["confirmed"],
    message: json["message"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "confirmed": confirmed,
    "message": message,
    "source": source,
  };
}
