// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetResponse {
  final String message;
  ResetResponse({
    required this.message,
  });

  ResetResponse copyWith({
    String? message,
  }) {
    return ResetResponse(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory ResetResponse.fromMap(Map<String, dynamic> map) {
    return ResetResponse(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetResponse.fromJson(String source) =>
      ResetResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ResetResponse(message: $message)';

  @override
  bool operator ==(covariant ResetResponse other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
