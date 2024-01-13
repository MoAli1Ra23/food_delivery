// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
///  CartItem to get cart item data
///  to save it to cart list and has 
/// menuitem id  to us it in orderlist
/// 

class CartItem extends Equatable {
  final String itemName;
  final String menuItemId;

  final double price;
  final double totalprice;
  final int count;
  const CartItem({
    required this.itemName,
    required this.menuItemId,
    required this.price,
    required this.totalprice,
    required this.count,
  });

  @override
  List<Object> get props {
    return [
      itemName,
      menuItemId,
      price,
      totalprice,
      count,
    ];
  }

  CartItem copyWith({
    String? itemName,
    String? menuItemId,
    double? price,
    double? totalprice,
    int? count,
  }) {
    return CartItem(
      itemName: itemName ?? this.itemName,
      menuItemId: menuItemId ?? this.menuItemId,
      price: price ?? this.price,
      totalprice: totalprice ?? this.totalprice,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
      'menuItemId': menuItemId,
      'price': price,
      'totalprice': totalprice,
      'count': count,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      itemName: map['itemName'] as String,
      menuItemId: map['menuItemId'] as String,
      price: map['price'] as double,
      totalprice: map['totalprice'] as double,
      count: map['count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source) as Map<String, dynamic>);

 
 }
