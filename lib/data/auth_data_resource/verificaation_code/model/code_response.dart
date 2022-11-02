// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CodeResponse {
  final String message;
  CodeResponse({
    required this.message,
  });

  CodeResponse copyWith({
    String? message,
  }) {
    return CodeResponse(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory CodeResponse.fromMap(Map<String, dynamic> map) {
    return CodeResponse(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CodeResponse.fromJson(String source) =>
      CodeResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CodeResponse(message: $message)';

  @override
  bool operator ==(covariant CodeResponse other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
