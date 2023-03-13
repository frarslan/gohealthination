import 'dart:convert';

Tasksmodel tasksmodelFromJson(String str) => Tasksmodel.fromJson(json.decode(str));
List<Result> resultModelFromJson(String str) =>  List<Result>.from(json.decode(str)['results'].map((x) => Result.fromJson(x)));
String tasksmodelToJson(Tasksmodel data) => json.encode(data.toJson());

class Tasksmodel {
  Tasksmodel({
    this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int? count;
  String? next;
  String? previous;
  List<Result> results;

  factory Tasksmodel.fromJson(Map<String, dynamic> json) => Tasksmodel(
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
    this.title,
    this.description,
    this.isCompleted,
    this.dueDate,
    this.showCalendar,
    this.createdAt,
    this.updatedAt,
    this.taskType,
    this.outcome,
    this.order,
    this.owner,
    this.relatedPerson,
    this.collaborators=const [],
  });

  int? id;
  String? title;
  String? description;
  bool? isCompleted;
  String? dueDate;
  bool? showCalendar;
  String? createdAt;
  String? updatedAt;
  int? taskType;
  int? outcome;
  int? order;
  int? owner;
  int? relatedPerson;
  List<int> collaborators;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    isCompleted: json["isCompleted"],
    dueDate: json["dueDate"],
    showCalendar: json["showCalendar"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    taskType: json["taskType"],
    outcome: json["outcome"],
    order: json["order"],
    owner: json["owner"],
    relatedPerson: json["relatedPerson"],
    collaborators: List<int>.from(json["collaborators"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "isCompleted": isCompleted,
    "dueDate": dueDate,
    "showCalendar": showCalendar,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "taskType": taskType,
    "outcome": outcome,
    "order": order,
    "owner": owner,
    "relatedPerson": relatedPerson,
    "collaborators": List<dynamic>.from(collaborators.map((x) => x)),
  };
}
