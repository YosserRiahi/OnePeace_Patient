// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseLogin {
  final bool session;
  final String access;
  final String refresh;
  final String expire;
  ResponseLogin({
    required this.session,
    required this.access,
    required this.refresh,
    required this.expire,
  });

  ResponseLogin copyWith({
    bool? session,
    String? access,
    String? refresh,
    String? expire,
  }) {
    return ResponseLogin(
      session: session ?? this.session,
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
      expire: expire ?? this.expire,
    );
  }

  factory ResponseLogin.fromMap(Map<String, dynamic> map) {
    return ResponseLogin(
      session: map['session'] as bool,
      access: map["access_token"] as String,
      refresh: map['refresh_token'] as String,
      expire: map['expire_in'] as String,
    );
  }

  factory ResponseLogin.fromJson(String source) =>
      ResponseLogin.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ResponseLogin(session: $session, access: $access, refresh: $refresh, expire: $expire)';
  }

  @override
  bool operator ==(covariant ResponseLogin other) {
    if (identical(this, other)) return true;

    return other.session == session &&
        other.access == access &&
        other.refresh == refresh &&
        other.expire == expire;
  }

  @override
  int get hashCode {
    return session.hashCode ^
        access.hashCode ^
        refresh.hashCode ^
        expire.hashCode;
  }
}
