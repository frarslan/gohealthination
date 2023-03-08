// To parse this JSON data, do
//
//     final patientsDetailModel = patientsDetailModelFromJson(jsonString);

import 'dart:convert';

PatientsDetailModel patientsDetailModelFromJson(String str) => PatientsDetailModel.fromJson(json.decode(str));

String patientsDetailModelToJson(PatientsDetailModel data) => json.encode(data.toJson());

class PatientsDetailModel {
  PatientsDetailModel({
    this.id,
    this.orderStatus=const [],
    this.patient,
    this.treatment,
    this.subTreatment,
    this.coupon,
    this.treatmentId,
    this.subTreatmentId,
    this.couponId,
    this.patientId,
    this.messageContent,
    this.orderDate,
    this.openAddress,
    this.currency,
    this.offerPrice,
    this.totalPrice,
    this.discountedPrice,
    this.operationPrice,
    this.orderSource,
    this.isOnlineMeeting,
    this.patientNote,
    this.doctors=const [],
  });

  int? id;
  List<OrderStatus?> orderStatus;
  Patient? patient;
  String? treatment;
  String? subTreatment;
  String? coupon;
  int? treatmentId;
  int? subTreatmentId;
  int? couponId;
  int? patientId;
  String? messageContent;
  String? orderDate;
  String? openAddress;
  String? currency;
  String? offerPrice;
  String? totalPrice;
  String? discountedPrice;
  String? operationPrice;
  String? orderSource;
  String? isOnlineMeeting;
  String? patientNote;
  List<int?> doctors;

  factory PatientsDetailModel.fromJson(Map<String, dynamic> json) => PatientsDetailModel(
    id: json["id"],
    orderStatus: List<OrderStatus>.from(json["order_status"].map((x) => OrderStatus.fromJson(x))),
    patient: Patient.fromJson(json["patient"]),
    treatment: json["treatment"],
    subTreatment: json["subTreatment"],
    coupon: json["coupon"],
    treatmentId: json["treatment_id"],
    subTreatmentId: json["subTreatment_id"],
    couponId: json["coupon_id"],
    patientId: json["patient_id"],
    messageContent: json["messageContent"],
    orderDate: json["orderDate"],
    openAddress: json["openAddress"],
    currency: json["currency"],
    offerPrice: json["offerPrice"],
    totalPrice: json["totalPrice"],
    discountedPrice: json["discountedPrice"],
    operationPrice: json["operationPrice"],
    orderSource: json["orderSource"],
    isOnlineMeeting: json["isOnlineMeeting"],
    patientNote: json["patientNote"],
    doctors: List<int>.from(json["doctors"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_status": List<dynamic>.from(orderStatus.map((x) => x?.toJson())),
    "patient": patient?.toJson(),
    "treatment": treatment,
    "subTreatment": subTreatment,
    "coupon": coupon,
    "treatment_id": treatmentId,
    "subTreatment_id": subTreatmentId,
    "coupon_id": couponId,
    "patient_id": patientId,
    "messageContent": messageContent,
    "orderDate": orderDate,
    "openAddress": openAddress,
    "currency": currency,
    "offerPrice": offerPrice,
    "totalPrice": totalPrice,
    "discountedPrice": discountedPrice,
    "operationPrice": operationPrice,
    "orderSource": orderSource,
    "isOnlineMeeting": isOnlineMeeting,
    "patientNote": patientNote,
    "doctors": List<dynamic>.from(doctors.map((x) => x)),
  };
}

class OrderStatus {
  OrderStatus({
    this.id,
    this.createdBy,
    this.name,
    this.notes,
    this.statusCreatedAt,
    this.order,
  });

  int? id;
  String? createdBy;
  String? name;
  String? notes;
  String? statusCreatedAt;
  int? order;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    id: json["id"],
    createdBy: json["created_by"],
    name: json["name"],
    notes: json["notes"],
    statusCreatedAt: json["status_created_at"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_by": createdBy,
    "name": name,
    "notes": notes,
    "status_created_at": statusCreatedAt,
    "order": order,
  };
}

class Patient {
  Patient({
    this.id,
    this.email,
    this.fullname,
  });

  int? id;
  String? email;
  String? fullname;

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    email: json["email"],
    fullname: json["fullname"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "fullname": fullname,
  };
}
