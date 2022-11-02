// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Practise {
  final int? id;
  final double duree;
  final DateTime date;
  Practise({
    this.id,
    required this.duree,
    required this.date,
  });

  Practise copyWith({
    int? id,
    double? duree,
    DateTime? date,
  }) {
    return Practise(
      id: id ?? this.id,
      duree: duree ?? this.duree,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'duree': duree,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Practise.fromMap(Map<String, dynamic> map) {
    return Practise(
      id: map['id'] != null ? map['id'] as int : null,
      duree: map['duree'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Practise.fromJson(String source) =>
      Practise.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Practise(id: $id, duree: $duree, date: $date)';

  @override
  bool operator ==(covariant Practise other) {
    if (identical(this, other)) return true;

    return other.id == id && other.duree == duree && other.date == date;
  }

  @override
  int get hashCode => id.hashCode ^ duree.hashCode ^ date.hashCode;
}
