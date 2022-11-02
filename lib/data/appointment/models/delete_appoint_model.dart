// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeleteAppResponse {
  final String message;
  DeleteAppResponse({
    required this.message,
  });

  DeleteAppResponse copyWith({
    String? message,
  }) {
    return DeleteAppResponse(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
    };
  }

  factory DeleteAppResponse.fromMap(Map<String, dynamic> map) {
    return DeleteAppResponse(
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeleteAppResponse.fromJson(String source) =>
      DeleteAppResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DeleteAppResponse(message: $message)';

  @override
  bool operator ==(covariant DeleteAppResponse other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
