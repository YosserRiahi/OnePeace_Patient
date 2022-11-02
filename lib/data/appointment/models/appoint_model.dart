// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppointmentModel {
  final String date;
  final String heur;
  final String description;
  final int doctor;
  AppointmentModel({
    required this.date,
    required this.heur,
    required this.description,
    required this.doctor,
  });

  AppointmentModel copyWith({
    String? date,
    String? heur,
    String? description,
    int? doctor,
  }) {
    return AppointmentModel(
      date: date ?? this.date,
      heur: heur ?? this.heur,
      description: description ?? this.description,
      doctor: doctor ?? this.doctor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "date_appoint": date,
      "hour_appoint": heur,
      "description": description,
      "doctor_id": doctor,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AppointmentModel(date: $date, heur: $heur, description: $description, doctor: $doctor)';
  }

  @override
  bool operator ==(covariant AppointmentModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.heur == heur &&
        other.description == description &&
        other.doctor == doctor;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        heur.hashCode ^
        description.hashCode ^
        doctor.hashCode;
  }
}
