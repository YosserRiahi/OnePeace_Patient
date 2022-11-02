// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LogOutResponse {
  final bool session;
  final String message;
  LogOutResponse({
    required this.session,
    required this.message,
  });

  LogOutResponse copyWith({
    bool? session,
    String? message,
  }) {
    return LogOutResponse(
      session: session ?? this.session,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'session': session,
      'message': message,
    };
  }

  factory LogOutResponse.fromMap(Map<String, dynamic> map) {
    return LogOutResponse(
      session: map['session'] as bool,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogOutResponse.fromJson(String source) =>
      LogOutResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LogOutResponse(session: $session, message: $message)';

  @override
  bool operator ==(covariant LogOutResponse other) {
    if (identical(this, other)) return true;

    return other.session == session && other.message == message;
  }

  @override
  int get hashCode => session.hashCode ^ message.hashCode;
}
