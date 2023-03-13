// To parse this JSON data, do
//
//     final treatmentWideModel = treatmentWideModelFromJson(jsonString);

import 'dart:convert';

TreatmentWideModel treatmentWideModelFromJson(String str) => TreatmentWideModel.fromJson(json.decode(str));

String treatmentWideModelToJson(TreatmentWideModel data) => json.encode(data.toJson());

class TreatmentWideModel {
  TreatmentWideModel({
    this.count,
    this.next,
    this.previous,
    this.results= const [],
  });

  int? count;
  String? next;
  String? previous;
  List<Result> results;

  factory TreatmentWideModel.fromJson(Map<String, dynamic> json) => TreatmentWideModel(
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
    this.subTreatment=const [],
    this.nameTr,
    this.nameEn,
    this.nameFr,
    this.nameDe,
    this.nameEs,
    this.nameRu,
    this.nameAr,
    this.notes,
    this.photoLink,
    this.isPopular,
  });

  int? id;
  List<SubTreatment> subTreatment;
  String? nameTr;
  String? nameEn;
  String? nameFr;
  String? nameDe;
  String? nameEs;
  String? nameRu;
  String? nameAr;
  String? notes;
  String? photoLink;
  bool? isPopular;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    subTreatment: List<SubTreatment>.from(json["sub_treatment"].map((x) => SubTreatment.fromJson(x))),
    nameTr: json["name_tr"],
    nameEn: json["name_en"],
    nameFr: json["name_fr"],
    nameDe: json["name_de"],
    nameEs: json["name_es"],
    nameRu: json["name_ru"],
    nameAr: json["name_ar"],
    notes: json["notes"],
    photoLink: json["photoLink"],
    isPopular: json["isPopular"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sub_treatment": List<dynamic>.from(subTreatment.map((x) => x.toJson())),
    "name_tr": nameTr,
    "name_en": nameEn,
    "name_fr": nameFr,
    "name_de": nameDe,
    "name_es": nameEs,
    "name_ru": nameRu,
    "name_ar": nameAr,
    "notes": notes,
    "photoLink": photoLink,
    "isPopular": isPopular,
  };
}

class SubTreatment {
  SubTreatment({
    this.id,
    this.treatment,
    this.treatmentId,
    this.nameTr,
    this.nameEn,
    this.nameFr,
    this.nameDe,
    this.nameEs,
    this.nameRu,
    this.nameAr,
    this.price,
    this.photoLink1,
    this.photoLink2,
    this.photoLink3,
    this.hotelAvLenOfStayTr,
    this.hotelAvLenOfStayEn,
    this.hotelAvLenOfStayFr,
    this.hotelAvLenOfStayDe,
    this.hotelAvLenOfStayEs,
    this.hotelAvLenOfStayRu,
    this.hotelAvLenOfStayAr,
    this.hospitalAvLenOfStayTr,
    this.hospitalAvLenOfStayEn,
    this.hospitalAvLenOfStayFr,
    this.hospitalAvLenOfStayDe,
    this.hospitalAvLenOfStayEs,
    this.hospitalAvLenOfStayRu,
    this.hospitalAvLenOfStayAr,
    this.operationTimeTr,
    this.operationTimeEn,
    this.operationTimeFr,
    this.operationTimeDe,
    this.operationTimeEs,
    this.operationTimeRu,
    this.operationTimeAr,
    this.anesthesiaTr,
    this.anesthesiaEn,
    this.anesthesiaFr,
    this.anesthesiaDe,
    this.anesthesiaEs,
    this.anesthesiaRu,
    this.anesthesiaAr,
    this.recoveryTimeTr,
    this.recoveryTimeEn,
    this.recoveryTimeFr,
    this.recoveryTimeDe,
    this.recoveryTimeEs,
    this.recoveryTimeRu,
    this.recoveryTimeAr,
    this.textContentTr,
    this.textContentEn,
    this.textContentFr,
    this.textContentDe,
    this.textContentEs,
    this.textContentRu,
    this.textContentAr,
  });

  int? id;
  String? treatment;
  int? treatmentId;
  String? nameTr;
  String? nameEn;
  String? nameFr;
  String? nameDe;
  String? nameEs;
  String? nameRu;
  String? nameAr;
  int? price;
  String? photoLink1;
  String? photoLink2;
  String? photoLink3;
  String? hotelAvLenOfStayTr;
  String? hotelAvLenOfStayEn;
  String? hotelAvLenOfStayFr;
  String? hotelAvLenOfStayDe;
  String? hotelAvLenOfStayEs;
  String? hotelAvLenOfStayRu;
  String? hotelAvLenOfStayAr;
  String? hospitalAvLenOfStayTr;
  String? hospitalAvLenOfStayEn;
  String? hospitalAvLenOfStayFr;
  String? hospitalAvLenOfStayDe;
  String? hospitalAvLenOfStayEs;
  String? hospitalAvLenOfStayRu;
  String? hospitalAvLenOfStayAr;
  String? operationTimeTr;
  String? operationTimeEn;
  String? operationTimeFr;
  String? operationTimeDe;
  String? operationTimeEs;
  String? operationTimeRu;
  String? operationTimeAr;
  String? anesthesiaTr;
  String? anesthesiaEn;
  String? anesthesiaFr;
  String? anesthesiaDe;
  String? anesthesiaEs;
  String? anesthesiaRu;
  String? anesthesiaAr;
  String? recoveryTimeTr;
  String? recoveryTimeEn;
  String? recoveryTimeFr;
  String? recoveryTimeDe;
  String? recoveryTimeEs;
  String? recoveryTimeRu;
  String? recoveryTimeAr;
  String? textContentTr;
  String? textContentEn;
  String? textContentFr;
  String? textContentDe;
  String? textContentEs;
  String? textContentRu;
  String? textContentAr;

  factory SubTreatment.fromJson(Map<String, dynamic> json) => SubTreatment(
    id: json["id"],
    treatment: json["treatment"],
    treatmentId: json["treatment_id"],
    nameTr: json["name_tr"],
    nameEn: json["name_en"],
    nameFr: json["name_fr"],
    nameDe: json["name_de"],
    nameEs: json["name_es"],
    nameRu: json["name_ru"],
    nameAr: json["name_ar"],
    price: json["price"],
    photoLink1: json["photoLink1"],
    photoLink2: json["photoLink2"],
    photoLink3: json["photoLink3"],
    hotelAvLenOfStayTr: json["hotelAvLenOfStay_tr"],
    hotelAvLenOfStayEn: json["hotelAvLenOfStay_en"],
    hotelAvLenOfStayFr: json["hotelAvLenOfStay_fr"],
    hotelAvLenOfStayDe: json["hotelAvLenOfStay_de"],
    hotelAvLenOfStayEs: json["hotelAvLenOfStay_es"],
    hotelAvLenOfStayRu: json["hotelAvLenOfStay_ru"],
    hotelAvLenOfStayAr: json["hotelAvLenOfStay_ar"],
    hospitalAvLenOfStayTr: json["hospitalAvLenOfStay_tr"],
    hospitalAvLenOfStayEn: json["hospitalAvLenOfStay_en"],
    hospitalAvLenOfStayFr: json["hospitalAvLenOfStay_fr"],
    hospitalAvLenOfStayDe: json["hospitalAvLenOfStay_de"],
    hospitalAvLenOfStayEs: json["hospitalAvLenOfStay_es"],
    hospitalAvLenOfStayRu: json["hospitalAvLenOfStay_ru"],
    hospitalAvLenOfStayAr: json["hospitalAvLenOfStay_ar"],
    operationTimeTr: json["operationTime_tr"],
    operationTimeEn: json["operationTime_en"],
    operationTimeFr: json["operationTime_fr"],
    operationTimeDe: json["operationTime_de"],
    operationTimeEs: json["operationTime_es"],
    operationTimeRu: json["operationTime_ru"],
    operationTimeAr: json["operationTime_ar"],
    anesthesiaTr: json["anesthesia_tr"],
    anesthesiaEn: json["anesthesia_en"],
    anesthesiaFr: json["anesthesia_fr"],
    anesthesiaDe: json["anesthesia_de"],
    anesthesiaEs: json["anesthesia_es"],
    anesthesiaRu: json["anesthesia_ru"],
    anesthesiaAr: json["anesthesia_ar"],
    recoveryTimeTr: json["recoveryTime_tr"],
    recoveryTimeEn: json["recoveryTime_en"],
    recoveryTimeFr: json["recoveryTime_fr"],
    recoveryTimeDe: json["recoveryTime_de"],
    recoveryTimeEs: json["recoveryTime_es"],
    recoveryTimeRu: json["recoveryTime_ru"],
    recoveryTimeAr: json["recoveryTime_ar"],
    textContentTr: json["textContent_tr"],
    textContentEn: json["textContent_en"],
    textContentFr: json["textContent_fr"],
    textContentDe: json["textContent_de"],
    textContentEs: json["textContent_es"],
    textContentRu: json["textContent_ru"],
    textContentAr: json["textContent_ar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "treatment": treatment,
    "treatment_id": treatmentId,
    "name_tr": nameTr,
    "name_en": nameEn,
    "name_fr": nameFr,
    "name_de": nameDe,
    "name_es": nameEs,
    "name_ru": nameRu,
    "name_ar": nameAr,
    "price": price,
    "photoLink1": photoLink1,
    "photoLink2": photoLink2,
    "photoLink3": photoLink3,
    "hotelAvLenOfStay_tr": hotelAvLenOfStayTr,
    "hotelAvLenOfStay_en": hotelAvLenOfStayEn,
    "hotelAvLenOfStay_fr": hotelAvLenOfStayFr,
    "hotelAvLenOfStay_de": hotelAvLenOfStayDe,
    "hotelAvLenOfStay_es": hotelAvLenOfStayEs,
    "hotelAvLenOfStay_ru": hotelAvLenOfStayRu,
    "hotelAvLenOfStay_ar": hotelAvLenOfStayAr,
    "hospitalAvLenOfStay_tr": hospitalAvLenOfStayTr,
    "hospitalAvLenOfStay_en": hospitalAvLenOfStayEn,
    "hospitalAvLenOfStay_fr": hospitalAvLenOfStayFr,
    "hospitalAvLenOfStay_de": hospitalAvLenOfStayDe,
    "hospitalAvLenOfStay_es": hospitalAvLenOfStayEs,
    "hospitalAvLenOfStay_ru": hospitalAvLenOfStayRu,
    "hospitalAvLenOfStay_ar": hospitalAvLenOfStayAr,
    "operationTime_tr": operationTimeTr,
    "operationTime_en": operationTimeEn,
    "operationTime_fr": operationTimeFr,
    "operationTime_de": operationTimeDe,
    "operationTime_es": operationTimeEs,
    "operationTime_ru": operationTimeRu,
    "operationTime_ar": operationTimeAr,
    "anesthesia_tr": anesthesiaTr,
    "anesthesia_en": anesthesiaEn,
    "anesthesia_fr": anesthesiaFr,
    "anesthesia_de": anesthesiaDe,
    "anesthesia_es": anesthesiaEs,
    "anesthesia_ru": anesthesiaRu,
    "anesthesia_ar": anesthesiaAr,
    "recoveryTime_tr": recoveryTimeTr,
    "recoveryTime_en": recoveryTimeEn,
    "recoveryTime_fr": recoveryTimeFr,
    "recoveryTime_de": recoveryTimeDe,
    "recoveryTime_es": recoveryTimeEs,
    "recoveryTime_ru": recoveryTimeRu,
    "recoveryTime_ar": recoveryTimeAr,
    "textContent_tr": textContentTr,
    "textContent_en": textContentEn,
    "textContent_fr": textContentFr,
    "textContent_de": textContentDe,
    "textContent_es": textContentEs,
    "textContent_ru": textContentRu,
    "textContent_ar": textContentAr,
  };
}
