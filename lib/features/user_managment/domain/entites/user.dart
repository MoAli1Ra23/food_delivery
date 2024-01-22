// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? mail;
  final String? phoneNumber;
  final String? image;
  final String? uid;
  final UserType type;
  const User({
    required this.name,
    required this.mail,
    this.phoneNumber,
    this.image,
    required this.uid,
    this.type = UserType.customer,
  });

  @override
  List<Object?> get props {
    return [
      name,
      mail,
      image,
       uid,
      type,
    ];
  }

  User copyWith({
    String? name,
    String? mail,
    String? image,
    String? passWord,
    String? uid,
    UserType? type,
  }) {
    return User(
      name: name ?? this.name,
      mail: mail ?? this.mail,
      image: image ?? this.image,
       uid: uid ?? this.uid,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mail': mail,
      'image': image,
      'fbID': uid,
      'type':  type.name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        name: map['name'] as String,
        mail: map['mail'] as String,
        image: map['image'] != null ? map['image'] as String : null,
         uid: map['fbID'] != null ? map['fbID'] as String : null,
        type: map['type'] != null
            ? toUserType(map['type'] as String)
            : UserType.customer);
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

String formUserType(UserType t){
  return t.name;
}
UserType toUserType(String s){
  for (var c in UserType.values) {
    if(c.name==s){
      return c;
    }
    
  }
  return UserType.customer;

}
