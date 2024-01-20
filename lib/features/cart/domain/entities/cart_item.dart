// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
//  CartItem to get cart item data
///  to save it to cart list and has
/// menuitem id  to us it in orderlist
///

class CartItem extends Equatable {
  final String itemName;
  final String menuItemId;
  final String imgUrl;

  final double price;
  final double totalprice;
  final int count;
  const CartItem({
    required this.itemName,
    required this.menuItemId,
    required this.imgUrl,
    required this.price,
    required this.totalprice,
    required this.count,
  });

  @override
  List<Object> get props {
    return [
      itemName,
      menuItemId,
      imgUrl,
      price,
      totalprice,
      count,
    ];
  }

  CartItem copyWith({
    String? itemName,
    String? menuItemId,
    String? imgUrl,
    double? price,
    double? totalprice,
    int? count,
  }) {
    return CartItem(
      itemName: itemName ?? this.itemName,
      menuItemId: menuItemId ?? this.menuItemId,
      imgUrl: imgUrl ?? this.imgUrl,
      price: price ?? this.price,
      totalprice: totalprice ?? this.totalprice,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
      'menuItemId': menuItemId,
      'imgUrl': imgUrl,
      'price': price,
      'totalprice': totalprice,
      'count': count,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      itemName: map['itemName'] as String,
      menuItemId: map['menuItemId'] as String,
      imgUrl: map['imgUrl'] as String,
      price: map['price'] as double,
      totalprice: map['totalprice'] as double,
      count: map['count'] as int,
    );
  }
}
