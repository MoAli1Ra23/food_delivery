// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Restraunt extends Equatable {
  final int id;
  final String name;
  final int rate;

  const Restraunt({
   required this.id,
   required this.name,
   required this.rate,
});

  @override
  List<Object> get props => [id, name, rate];

  

  Restraunt copyWith({
    int? id,
    String? name,
    int? rate,
  }) {
    return Restraunt(
      id: id ?? this.id,
      name: name ?? this.name,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rate': rate,
    };
  }

  factory Restraunt.fromMap(Map<String, dynamic> map) {
    return Restraunt(
      id: map['id'] as int,
      name: map['name'] as String,
      rate: map['rate'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restraunt.fromJson(String source) => Restraunt.fromMap(json.decode(source) as Map<String, dynamic>);
}
