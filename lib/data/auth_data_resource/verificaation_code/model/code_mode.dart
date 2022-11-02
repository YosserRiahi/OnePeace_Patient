// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CodeModel {
  final int code;
  CodeModel({
    required this.code,
  });

  CodeModel copyWith({
    int? code,
  }) {
    return CodeModel(
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CodeModel(code: $code)';

  @override
  bool operator ==(covariant CodeModel other) {
    if (identical(this, other)) return true;

    return other.code == code;
  }

  @override
  int get hashCode => code.hashCode;
}
