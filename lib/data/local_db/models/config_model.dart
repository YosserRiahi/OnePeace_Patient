// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ConfigModel {
  final int? id;
  final double objective;
  final double height;
  final double weight;
  final String sex;
  final int age;
  ConfigModel({
    this.id,
    required this.objective,
    required this.height,
    required this.weight,
    required this.sex,
    required this.age,
  });

  ConfigModel copyWith({
    int? id,
    double? objective,
    double? height,
    double? weight,
    String? sex,
    int? age,
  }) {
    return ConfigModel(
      id: id ?? this.id,
      objective: objective ?? this.objective,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      sex: sex ?? this.sex,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'objectif': objective,
      'height': height,
      'weight': weight,
      'sex': sex,
      'age': age,
    };
  }

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      id: map['id'] != null ? map['id'] as int : null,
      objective: map['objectif'] as double,
      height: map['height'] as double,
      weight: map['weight'] as double,
      sex: map['sex'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigModel.fromJson(String source) =>
      ConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ConfigModel(id: $id, objective: $objective, height: $height, weight: $weight, sex: $sex, age: $age)';
  }

  @override
  bool operator ==(covariant ConfigModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.objective == objective &&
        other.height == height &&
        other.weight == weight &&
        other.sex == sex &&
        other.age == age;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        objective.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        sex.hashCode ^
        age.hashCode;
  }
}
