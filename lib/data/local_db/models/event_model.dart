// ignore_for_file: public_member_api_docs, sort_constructors_first

class Event {
  final int? id;
  final String notfication;
  final DateTime datecreated;
  Event({
    this.id,
    required this.notfication,
    required this.datecreated,
  });

  Event copyWith({
    int? id,
    String? notfication,
    DateTime? datecreated,
  }) {
    return Event(
      id: id ?? this.id,
      notfication: notfication ?? this.notfication,
      datecreated: datecreated ?? this.datecreated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'notfication': notfication,
      'datecreated': datecreated.millisecondsSinceEpoch,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] != null ? map['id'] as int : null,
      notfication: map['notfication'] as String,
      datecreated:
          DateTime.fromMillisecondsSinceEpoch(map['datecreated'] as int),
    );
  }
}
