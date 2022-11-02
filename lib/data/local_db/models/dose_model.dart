// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:intl/intl.dart';

class Dose {
  final int? id;
  final double dose;
  final String time;
  Dose({
    this.id,
    required this.dose,
    required this.time,
  });

  static String convert() {
    DateTime temps = DateTime.now();
    return DateFormat.yMd().format(temps);
  }

  Dose copyWith({
    int? id,
    double? dose,
    String? time,
  }) {
    return Dose(
      id: id ?? this.id,
      dose: dose ?? this.dose,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dose': dose,
      'date': convert(),
    };
  }

  factory Dose.fromMap(Map<String, dynamic> map) {
    return Dose(
      id: map['id'] != null ? map['id'] as int : null,
      dose: map['dose'] as double,
      time: map['date'] as String,
    );
  }
}
