class Usermodel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  int? numberPhone;
  String? cnamCode;
  bool? isActive;
  bool? isVerify;
  bool? isLogged;
  String? urlimage;
  bool? isBlocked;
  List<Images>? images;
  List<Appointments>? appointments;

  Usermodel(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.numberPhone,
      this.cnamCode,
      this.isActive,
      this.isVerify,
      this.isLogged,
      this.urlimage,
      this.isBlocked,
      this.images,
      this.appointments});

  Usermodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    numberPhone = json['number_phone'];
    cnamCode = json['cnam_code'];
    isActive = json['is_active'];
    isVerify = json['is_verify'];
    isLogged = json['is_logged'];
    urlimage = json['urlimage'];
    isBlocked = json['is_blocked'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['number_phone'] = this.numberPhone;
    data['cnam_code'] = this.cnamCode;
    data['is_active'] = this.isActive;
    data['is_verify'] = this.isVerify;
    data['is_logged'] = this.isLogged;
    data['urlimage'] = this.urlimage;
    data['is_blocked'] = this.isBlocked;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.appointments != null) {
      data['appointments'] = this.appointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? filename;
  String? createdAt;

  Images({this.id, this.filename, this.createdAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['filename'] = this.filename;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Appointments {
  int? id;
  String? duration;
  String? hourAppoint;
  String? dateAppoint;
  String? description;
  String? createAt;
  String? validation;
  int? doctorId;

  Appointments(
      {this.duration,
      this.id,
      this.hourAppoint,
      this.dateAppoint,
      this.description,
      this.createAt,
      this.validation,
      this.doctorId});

  Appointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duration = json['duration'];
    hourAppoint = json['hour_appoint'];
    dateAppoint = json['date_appoint'];
    description = json['description'];
    createAt = json['create_at'];
    validation = json['validation'];
    doctorId = json['doctor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['hour_appoint'] = this.hourAppoint;
    data['date_appoint'] = this.dateAppoint;
    data['description'] = this.description;
    data['create_at'] = this.createAt;
    data['validation'] = this.validation;
    data['doctor_id'] = this.doctorId;
    return data;
  }
}
