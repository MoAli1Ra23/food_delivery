// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String type;
  final String? pic;

  const User({
    required this.id,
    required this.name,
    required this.type,
    required this.pic,
  });

  @override
  List<Object?> get props => [id, name, type, pic];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'pic': pic,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      type: map['type'] as String,
      pic: map['pic'] != null ? map['pic'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    int? id,
    String? name,
    String? type,
    String? pic,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      pic: pic ?? this.pic,
    );
  }
}
