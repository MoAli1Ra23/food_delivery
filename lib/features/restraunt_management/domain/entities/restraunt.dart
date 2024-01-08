// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Restraunt extends Equatable {
  final int id;
  final String name;
  final int rate;
  final String userID;

  const Restraunt({
   required this.id,
   required this.name,
   required this.rate,
   required this.userID,
});

  @override
  List<Object> get props => [id, name, rate,userID];

  


  Restraunt copyWith({
    int? id,
    String? name,
    int? rate,
    String? userID,
  }) {
    return Restraunt(
      id: id ?? this.id,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      userID: userID ?? this.userID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rate': rate,
      'userID': userID,
    };
  }

  factory Restraunt.fromMap(Map<String, dynamic> map) {
    return Restraunt(
      id: map['id'] as int,
      name: map['name'] as String,
      rate: map['rate'] as int,
      userID: map['userID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restraunt.fromJson(String source) => Restraunt.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
  }
