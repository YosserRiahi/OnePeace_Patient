class Doctor {
  int? id;
  String? email;
  String? urlimage;
  int? numberPhone;
  String? firstName;
  String? lastName;
  String? about;
  bool? isDisponible;
  int? rating;
  double? price;
  List<Cabinets>? cabinets;
  List<Experiences>? experiences;

  Doctor(
      {this.id,
      this.email,
      this.urlimage,
      this.numberPhone,
      this.firstName,
      this.lastName,
      this.about,
      this.isDisponible,
      this.rating,
      this.price,
      this.cabinets,
      this.experiences});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    urlimage = json['urlimage'];
    numberPhone = json['number_phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    about = json['about'];
    isDisponible = json['is_disponible'];
    rating = json['rating'];
    price = json['price'];
    if (json['cabinets'] != null) {
      cabinets = <Cabinets>[];
      json['cabinets'].forEach((v) {
        cabinets!.add(Cabinets.fromJson(v));
      });
    }
    if (json['experiences'] != null) {
      experiences = <Experiences>[];
      json['experiences'].forEach((v) {
        experiences!.add(Experiences.fromJson(v));
      });
    }
  }
}

class Cabinets {
  int? id;
  String? cabinetAddress;
  String? cabinetContact;
  String? timeOpenning;
  String? timeClosed;

  Cabinets(
      {this.id,
      this.cabinetAddress,
      this.cabinetContact,
      this.timeOpenning,
      this.timeClosed});

  Cabinets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cabinetAddress = json['cabinet_address'];
    cabinetContact = json['cabinet_contact'];
    timeOpenning = json['time_openning'];
    timeClosed = json['time_closed'];
  }
}

class Experiences {
  int? id;
  String? jobOccuped;
  String? description;
  bool? isOccuped;
  String? society;
  String? dateStarted;
  String? dateFinished;

  Experiences(
      {this.id,
      this.jobOccuped,
      this.description,
      this.isOccuped,
      this.society,
      this.dateStarted,
      this.dateFinished});

  Experiences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobOccuped = json['job_occuped'];
    description = json['description'];
    isOccuped = json['is_occuped'];
    society = json['society'];
    dateStarted = json['date_started'];
    dateFinished = json['date_finished'];
  }
}
