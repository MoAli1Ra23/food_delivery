// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Menu extends Equatable {
  final int id;
  final int restrauntId;
  final DateTime dateTime;

  const Menu({
    required this.id,
    required this.restrauntId,
    required this.dateTime,
  });

  Menu copyWith({
    int? id,
    int? restrauntId,
    DateTime? dateTime,
  }) {
    return Menu(
      id: id ?? this.id,
      restrauntId: restrauntId ?? this.restrauntId,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  List<Object> get props => [id, restrauntId, dateTime];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'restrauntId': restrauntId,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'] as int,
      restrauntId: map['restrauntId'] as int,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source) as Map<String, dynamic>);
 }
