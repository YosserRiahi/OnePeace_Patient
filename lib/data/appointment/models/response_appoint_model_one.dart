// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppointmentOne {
  final int id;
  final String duration;
  final String hour;
  final String date;
  final String description;
  final String validation;
  final String doctorname;
  final String doctorlast;
  final int contact;
  final double price;
  AppointmentOne({
    required this.id,
    required this.duration,
    required this.hour,
    required this.date,
    required this.description,
    required this.validation,
    required this.doctorname,
    required this.doctorlast,
    required this.contact,
    required this.price,
  });

  AppointmentOne copyWith({
    int? id,
    String? duration,
    String? hour,
    String? date,
    String? description,
    String? validation,
    String? doctorname,
    String? doctorlast,
    int? contact,
    double? price,
  }) {
    return AppointmentOne(
      id: id ?? this.id,
      duration: duration ?? this.duration,
      hour: hour ?? this.hour,
      date: date ?? this.date,
      description: description ?? this.description,
      validation: validation ?? this.validation,
      doctorname: doctorname ?? this.doctorname,
      doctorlast: doctorlast ?? this.doctorlast,
      contact: contact ?? this.contact,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'duration': duration,
      'hour_appoint': hour,
      'date_appoint': date,
      'description': description,
      'validation': validation,
      'doctor_name': doctorname,
      'doctor_last_name': doctorlast,
      'doctor_phone': contact,
      'doctor_price': price,
    };
  }

  factory AppointmentOne.fromMap(Map<String, dynamic> map) {
    return AppointmentOne(
      id: map['id'] as int,
      duration: map['duration'] as String,
      hour: map['hour_appoint'] as String,
      date: map['date_appoint'] as String,
      description: map['description'] as String,
      validation: map['validation'] as String,
      doctorname: map['doctor_name'] as String,
      doctorlast: map['doctor_last_name'] as String,
      contact: map['doctor_phone'] as int,
      price: map['doctor_price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentOne.fromJson(String source) =>
      AppointmentOne.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppointmentOne(id: $id, duration: $duration, hour: $hour, date: $date, description: $description, validation: $validation, doctorname: $doctorname, doctorlast: $doctorlast, contact: $contact, price: $price)';
  }

  @override
  bool operator ==(covariant AppointmentOne other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.duration == duration &&
        other.hour == hour &&
        other.date == date &&
        other.description == description &&
        other.validation == validation &&
        other.doctorname == doctorname &&
        other.doctorlast == doctorlast &&
        other.contact == contact &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        duration.hashCode ^
        hour.hashCode ^
        date.hashCode ^
        description.hashCode ^
        validation.hashCode ^
        doctorname.hashCode ^
        doctorlast.hashCode ^
        contact.hashCode ^
        price.hashCode;
  }
}
