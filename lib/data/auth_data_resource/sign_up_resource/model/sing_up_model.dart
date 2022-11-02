// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisteModel {
  final String username;
  final String email;
  final String password;
  RegisteModel({
    required this.username,
    required this.email,
    required this.password,
  });

  RegisteModel copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    return RegisteModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'RegisteModel(username: $username, email: $email, password: $password)';

  @override
  bool operator ==(covariant RegisteModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ password.hashCode;
}
