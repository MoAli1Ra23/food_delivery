// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'menu_itames.dart';

class Menu extends Equatable {
  final int id;
  final int restrauntId;
  final DateTime dateTime;
  final List<MenuItem>? items;

  const Menu({
    required this.id,
    required this.restrauntId,
    required this.dateTime,
      this.items,
  });

  Menu copyWith({
    int? id,
    int? restrauntId,
    DateTime? dateTime,
    List<MenuItem>? items,
  }) {
    return Menu(
      id: id ?? this.id,
      restrauntId: restrauntId ?? this.restrauntId,
      dateTime: dateTime ?? this.dateTime,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [id, restrauntId, dateTime, items];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'restrauntId': restrauntId,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'items':items!=null? items!.map((x) => x.toMap()).toList():null,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['id'] as int,
      restrauntId: map['restrauntId'] as int,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      items: List<MenuItem>.from((map['items'] as List<int>).map<MenuItem>((x) => MenuItem.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
 }
