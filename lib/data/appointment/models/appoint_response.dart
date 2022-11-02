// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppointResponse {
  final int id;
  final String hour;
  final String date;
  final String description;
  final String validation;
  final int doctor;
  final String create;
  AppointResponse({
    required this.id,
    required this.hour,
    required this.date,
    required this.description,
    required this.validation,
    required this.doctor,
    required this.create,
  });

  AppointResponse copyWith({
    int? id,
    String? hour,
    String? date,
    String? description,
    String? validation,
    int? doctor,
    String? create,
  }) {
    return AppointResponse(
      id: id ?? this.id,
      hour: hour ?? this.hour,
      date: date ?? this.date,
      description: description ?? this.description,
      validation: validation ?? this.validation,
      doctor: doctor ?? this.doctor,
      create: create ?? this.create,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "date_appoint": date,
      "hour_appoint": hour,
      "description": description,
      "validation": validation,
      "doctor_id": doctor,
      "create_at": create
    };
  }

  factory AppointResponse.fromMap(Map<String, dynamic> map) {
    return AppointResponse(
      id: map['id'] as int,
      hour: map["hour_appoint"] as String,
      date: map["date_appoint"] as String,
      description: map["description"] as String,
      validation: map['validation'] as String,
      doctor: map["doctor_id"] as int,
      create: map["create_at"] as String,
    );
  }

  factory AppointResponse.fromJson(String source) =>
      AppointResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppointResponse(id: $id, hour: $hour, date: $date, description: $description, validation: $validation, doctor: $doctor, create: $create)';
  }

  @override
  bool operator ==(covariant AppointResponse other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.hour == hour &&
        other.date == date &&
        other.description == description &&
        other.validation == validation &&
        other.doctor == doctor &&
        other.create == create;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        hour.hashCode ^
        date.hashCode ^
        description.hashCode ^
        validation.hashCode ^
        doctor.hashCode ^
        create.hashCode;
  }
}
