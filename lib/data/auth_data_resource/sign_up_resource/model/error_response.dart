// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ErrorResponse {
  final String error;

  ErrorResponse(
    this.error,
  );

  ErrorResponse copyWith({
    String? error,
  }) {
    return ErrorResponse(
      error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
    };
  }

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
      map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorResponse.fromJson(String source) =>
      ErrorResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ErrorResponse(error: $error)';

  @override
  bool operator ==(covariant ErrorResponse other) {
    if (identical(this, other)) return true;

    return other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
