// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterResponse {
  final String message;
  RegisterResponse({
    required this.message,
  });

  RegisterResponse copyWith({
    String? message,
  }) {
    return RegisterResponse(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterResponse(message: $message)';

  @override
  bool operator ==(covariant RegisterResponse other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
