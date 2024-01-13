// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'cart_item.dart';

/// class to go as Order in the cloud or cart holder in the customer ui
///
///

class Order extends Equatable {
  final String userId;
  final List<CartItem> carts;
  final DateTime dateTime;
  final double totalprice;
  /// state to hold order state 
  /// [Ordering,confirm , inprograse , out to delavr,check, goback]
  /// as String in firt version
  final String state;
  const Order({
    required this.userId,
    required this.carts,
    required this.dateTime,
    required this.totalprice,
      this.state="ordring",
  });

  @override
  List<Object> get props {
    return [
      userId,
      carts,
      dateTime,
      totalprice,
      state,
    ];
  }

  Order copyWith({
    String? userId,
    List<CartItem>? carts,
    DateTime? dateTime,
    double? totalprice,
    String? state,
  }) {
    return Order(
      userId: userId ?? this.userId,
      carts: carts ?? this.carts,
      dateTime: dateTime ?? this.dateTime,
      totalprice: totalprice ?? this.totalprice,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'carts': carts.map((x) => x.toMap()).toList(),
      'dateTime': dateTime.millisecondsSinceEpoch,
      'totalprice': totalprice,
      'state': state,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      userId: map['userId'] as String,
      carts: List<CartItem>.from((map['carts'] as List<int>).map<CartItem>((x) => CartItem.fromMap(x as Map<String,dynamic>),),),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      totalprice: map['totalprice'] as double,
      state: map['state'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  
}
