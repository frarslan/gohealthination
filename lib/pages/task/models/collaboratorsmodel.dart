import 'dart:convert';

Collaboratorsmodel collaboratorsmodelFromJson(String str) => Collaboratorsmodel.fromJson(json.decode(str));
List<Result> resultModelFromJson(String str) =>  List<Result>.from(json.decode(str)['results'].map((x) => Result.fromJson(x)));
String collaboratorsmodelToJson(Collaboratorsmodel data) => json.encode(data.toJson());

class Collaboratorsmodel {
  Collaboratorsmodel({
    this.count,
    this.next,
    this.previous,
    this.results=const [],
  });

  int? count;
  String? next;
  String? previous;
  List<Result> results;

  factory Collaboratorsmodel.fromJson(Map<String, dynamic> json) => Collaboratorsmodel(
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
    this.userPhoto,
    this.email,
    this.role,
    this.username,
    this.isActive,
  });

  int? id;
  String? fullName;
  String? userPhoto;
  String? email;
  String? role;
  String? username;
  bool? isActive;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    fullName: json["full_name"],
    userPhoto: json["userPhoto"],
    email: json["email"],
    role: json["role"],
    username: json["username"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "userPhoto": userPhoto,
    "email": email,
    "role": role,
    "username": username,
    "is_active": isActive,
  };
}
