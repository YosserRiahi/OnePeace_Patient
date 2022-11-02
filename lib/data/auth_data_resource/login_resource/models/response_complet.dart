// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseComplet {
  final String message;
  ResponseComplet({
    required this.message,
  });

  ResponseComplet copyWith({
    String? message,
  }) {
    return ResponseComplet(
      message: message ?? this.message,
    );
  }

  factory ResponseComplet.fromMap(Map<String, dynamic> map) {
    return ResponseComplet(
      message: map['message'] as String,
    );
  }

  factory ResponseComplet.fromJson(String source) =>
      ResponseComplet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResponseComplet(message: $message)';

  @override
  bool operator ==(covariant ResponseComplet other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
