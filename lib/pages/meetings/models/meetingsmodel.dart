import 'dart:convert';

Meetingsmodel meetingsmodelFromJson(String str) => Meetingsmodel.fromJson(json.decode(str));

String meetingsmodelToJson(Meetingsmodel data) => json.encode(data.toJson());

class Meetingsmodel {
  Meetingsmodel({
    this.count,
    this.next,
    this.previous,
    this.results=const [],
  });

  int? count;
  String? next;
  String? previous;
  List<Result> results;

  factory Meetingsmodel.fromJson(Map<String, dynamic> json) => Meetingsmodel(
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
    this.participants=const[],
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
  int? outcome;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
