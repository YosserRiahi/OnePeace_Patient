// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetModel {
  final String email;
  ResetModel({
    required this.email,
  });

  ResetModel copyWith({
    String? email,
  }) {
    return ResetModel(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ResetModel(email: $email)';

  @override
  bool operator ==(covariant ResetModel other) {
    if (identical(this, other)) return true;

    return other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
