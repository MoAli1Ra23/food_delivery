// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String mail;
  final String? image;
  final String passWord;
  final String? fbID;
  final UserType type;
  const User({
    required this.id,
    required this.name,
    required this.mail,
    this.image,
    required this.passWord,
    required this.fbID,
    this.type = UserType.customer,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      mail,
      image,
      passWord,
      fbID,
      type,
    ];
  }

  User copyWith({
    int? id,
    String? name,
    String? mail,
    String? image,
    String? passWord,
    String? fbID,
    UserType? type,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      mail: mail ?? this.mail,
      image: image ?? this.image,
      passWord: passWord ?? this.passWord,
      fbID: fbID ?? this.fbID,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'mail': mail,
      'image': image,
      'passWord': passWord,
      'fbID': fbID,
      'type': type.toString()
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      mail: map['mail'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      passWord: map['passWord'] as String,
      fbID: map['fbID'] != null ? map['fbID'] as String : null,
      type: map['type'] !=null
          ? UserType.values
              .where(
                ((element) => (map['type'] as String) == element.toString()),
              )
              .first
          : UserType.customer,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

enum UserType {
  admain,
  delivery,
  manager,
  customer,
}
