import 'dart:convert';

HomePatientsmodel homepatientsmodelFromJson(String str) => HomePatientsmodel.fromJson(json.decode(str));
List<Results> resultModelFromJson(dynamic str) => List<Results>.from(json.decode(str).map((x) => Results.fromJson(x)));

String homepatientsmodelToJson(HomePatientsmodel data) => json.encode(data.toJson());

class HomePatientsmodel {
  HomePatientsmodel({
    this.count,
    this.next,
    this.previous,
    this.results = const [],
  });

  int? count;
  String? next;
  String? previous;
  List<Results> results;

  factory HomePatientsmodel.fromJson(Map<String, dynamic> json) => HomePatientsmodel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Results {
  Results({
    this.id,
    this.profile,
     this.statusPatient= const [],
     this.billingAddress= const [],
    this.joinedDateTr,
    this.joinedDateEn,
    this.fullname,
    this.patientComments,
    this.lastLogin,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isActive,
    this.dateJoined,
  });

  int? id;
  Profile? profile;
  List<StatusPatient> statusPatient;
  List<BillingAddress> billingAddress;
  String? joinedDateTr;
  String? joinedDateEn;
  String? fullname;
  PatientComments? patientComments;
  String? lastLogin;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isActive;
  String? dateJoined;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    id: json["id"],
    profile: Profile.fromJson(json["profile"]),
    statusPatient: List<StatusPatient>.from(json["status_patient"].map((x) => StatusPatient.fromJson(x))),
    billingAddress: List<BillingAddress>.from(json["billing_address"].map((x) => BillingAddress.fromJson(x))),
    joinedDateTr: json["joined_date_tr"],
    joinedDateEn: json["joined_date_en"],
    fullname: json["fullname"],
    patientComments: PatientComments.fromJson(json["patient_comments"]),
    lastLogin: json["last_login"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    isActive: json["is_active"],
    dateJoined: json["date_joined"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile": profile?.toJson(),
    "status_patient": List<dynamic>.from(statusPatient.map((x) => x.toJson())),
    "billing_address": List<dynamic>.from(billingAddress.map((x) => x.toJson())),
    "joined_date_tr": joinedDateTr,
    "joined_date_en": joinedDateEn,
    "fullname": fullname,
    "patient_comments": patientComments?.toJson(),
    "last_login": lastLogin,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "is_active": isActive,
    "date_joined": dateJoined,
  };
}

class BillingAddress {
  BillingAddress({
    this.id,
    this.city,
    this.state,
    this.country,
    this.cityId,
    this.stateId,
    this.countryId,
    this.openAddress,
    this.addressHeader,
    this.addedDate,
    this.idNumber,
    this.taxId,
    this.taxOffice,
    this.user,
  });

  int? id;
  String? city;
  String? state;
  String? country;
  int? cityId;
  int? stateId;
  int? countryId;
  String? openAddress;
  String? addressHeader;
  String? addedDate;
  String? idNumber;
  String? taxId;
  String? taxOffice;
  int? user;

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
    id: json["id"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    cityId: json["city_id"],
    stateId: json["state_id"],
    countryId: json["country_id"],
    openAddress: json["openAddress"],
    addressHeader: json["addressHeader"],
    addedDate: json["added_date"],
    idNumber: json["idNumber"],
    taxId: json["taxId"],
    taxOffice: json["taxOffice"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city": city,
    "state": state,
    "country": country,
    "city_id": cityId,
    "state_id": stateId,
    "country_id": countryId,
    "openAddress": openAddress,
    "addressHeader": addressHeader,
    "added_date": addedDate,
    "idNumber": idNumber,
    "taxId": taxId,
    "taxOffice": taxOffice,
    "user": user,
  };
}

class PatientComments {
  PatientComments({
    this.id,
     this.patientPhotos= const [],
    this.comment,
    this.rating,
    this.doctorFeedback,
    this.doctorRating,
    this.hospitalFeedback,
    this.hospitalRating,
    this.hotelFeedback,
    this.hotelRating,
    this.travelAgentFeedback,
    this.travelAgentRating,
    this.videoLink,
    this.date,
    this.before,
    this.after,
    this.publishConfirm,
    this.patient,
    this.treatment,
    this.order,
  });

  int? id;
  List<PatientPhoto?> patientPhotos;
  String? comment;
  int? rating;
  String? doctorFeedback;
  int? doctorRating;
  String? hospitalFeedback;
  int? hospitalRating;
  String? hotelFeedback;
  int? hotelRating;
  String? travelAgentFeedback;
  int? travelAgentRating;
  String? videoLink;
  String? date;
  String? before;
  String? after;
  bool? publishConfirm;
  int? patient;
  int? treatment;
  int? order;

  factory PatientComments.fromJson(Map<String, dynamic> json) => PatientComments(
    id: json["id"],
    patientPhotos: json["patient_photos"] != null ? List<PatientPhoto>.from(json["patient_photos"]?.map((x) => PatientPhoto.fromJson(x))) : [],
    comment: json["comment"],
    rating: json["rating"],
    doctorFeedback: json["doctorFeedback"],
    doctorRating: json["doctorRating"],
    hospitalFeedback: json["hospitalFeedback"],
    hospitalRating: json["hospitalRating"],
    hotelFeedback: json["hotelFeedback"],
    hotelRating: json["hotelRating"],
    travelAgentFeedback: json["travelAgentFeedback"],
    travelAgentRating: json["travelAgentRating"],
    videoLink: json["videoLink"],
    date: json["date"],
    before: json["before"],
    after: json["after"],
    publishConfirm: json["publishConfirm"],
    patient: json["patient"],
    treatment: json["treatment"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
   // "patient_photos": List<dynamic>.from(patientPhotos.map((x) => x?.toJson())),
    "comment": comment,
    "rating": rating,
    "doctorFeedback": doctorFeedback,
    "doctorRating": doctorRating,
    "hospitalFeedback": hospitalFeedback,
    "hospitalRating": hospitalRating,
    "hotelFeedback": hotelFeedback,
    "hotelRating": hotelRating,
    "travelAgentFeedback": travelAgentFeedback,
    "travelAgentRating": travelAgentRating,
    "videoLink": videoLink,
    "date": date,
    "before": before,
    "after": after,
    "publishConfirm": publishConfirm,
    "patient": patient,
    "treatment": treatment,
    "order": order,
  };
}

class PatientPhoto {
  PatientPhoto({
    this.id,
    this.photo,
    this.patientComment,
  });

  int? id;
  String? photo;
  int? patientComment;

  factory PatientPhoto.fromJson(Map<String, dynamic> json) => PatientPhoto(
    id: json["id"],
    photo: json["photo"],
    patientComment: json["patientComment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo": photo,
    "patientComment": patientComment,
  };
}

class Profile {
  Profile({
    this.id,
    this.age,
    this.role,
    this.smsPermission,
    this.emailPermission,
    this.idNumber,
    this.birthday,
    this.gender,
    this.phoneNumber,
    this.userPhoto,
    this.openAddress,
    this.bankAccountName,
    this.iBanNumber,
    this.adminNotes,
    this.user,
    this.country,
    this.state,
    this.city,
  });

  int? id;
  int? age;
  String? role;
  bool? smsPermission;
  bool? emailPermission;
  int? idNumber;
  DateTime? birthday;
  String? gender;
  String? phoneNumber;
  String? userPhoto;
  String? openAddress;
  String? bankAccountName;
  String? iBanNumber;
  String? adminNotes;
  int? user;
  int? country;
  int? state;
  int? city;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    age: json["age"],
    role: json["role"],
    smsPermission: json["smsPermission"],
    emailPermission: json["emailPermission"],
    idNumber: json["idNumber"],
    birthday: json["birthday"]!= null ?DateTime.parse(json["birthday"]):null,
    gender: json["gender"],
    phoneNumber: json["phoneNumber"],
    userPhoto: json["userPhoto"],
    openAddress: json["openAddress"],
    bankAccountName: json["bankAccountName"],
    iBanNumber: json["iBANNumber"],
    adminNotes: json["adminNotes"],
    user: json["user"],
    country: json["country"],
    state: json["state"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "age": age,
    "role": role,
    "smsPermission": smsPermission,
    "emailPermission": emailPermission,
    "idNumber": idNumber,
    "birthday": "${birthday?.year.toString().padLeft(4, '0')}-${birthday?.month.toString().padLeft(2, '0')}-${birthday?.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "phoneNumber": phoneNumber,
    "userPhoto": userPhoto,
    "openAddress": openAddress,
    "bankAccountName": bankAccountName,
    "iBANNumber": iBanNumber,
    "adminNotes": adminNotes,
    "user": user,
    "country": country,
    "state": state,
    "city": city,
  };
}

class StatusPatient {
  StatusPatient({
    this.id,
    this.name,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.patient,
    this.createdBy,
    this.updatedBy,
  });

  int? id;
  String? name;
  String? notes;
  String? createdAt;
  String? updatedAt;
  int? patient;
  int? createdBy;
  int? updatedBy;

  factory StatusPatient.fromJson(Map<String, dynamic> json) => StatusPatient(
    id: json["id"],
    name: json["name"],
    notes: json["notes"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    patient: json["patient"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "notes": notes,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "patient": patient,
    "created_by": createdBy,
    "updated_by": updatedBy,
  };
}
