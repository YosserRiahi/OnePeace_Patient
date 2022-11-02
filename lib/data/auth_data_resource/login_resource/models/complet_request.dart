// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CompletModel {
  final String firstname;
  final String lastname;
  final int phone;
  final String cnam;
  CompletModel({
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.cnam,
  });

  CompletModel copyWith({
    String? firstname,
    String? lastname,
    int? phone,
    String? cnam,
  }) {
    return CompletModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      cnam: cnam ?? this.cnam,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "first_name": firstname,
      "last_name": lastname,
      "number_phone": phone,
      "cnam_code": cnam,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CompletModel(firstname: $firstname, lastname: $lastname, phone: $phone, cnam: $cnam)';
  }

  @override
  bool operator ==(covariant CompletModel other) {
    if (identical(this, other)) return true;

    return other.firstname == firstname &&
        other.lastname == lastname &&
        other.phone == phone &&
        other.cnam == cnam;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
        lastname.hashCode ^
        phone.hashCode ^
        cnam.hashCode;
  }
}
