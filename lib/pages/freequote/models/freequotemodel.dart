import 'dart:convert';

Freequotemodel freequotemodelFromJson(String str) => Freequotemodel.fromJson(json.decode(str));

String freequotemodelToJson(Freequotemodel data) => json.encode(data.toJson());

class Freequotemodel {
  Freequotemodel({
    this.count,
    this.next,
    this.previous,
    required this.results,
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
