import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';
import 'package:food_delivery/injection.dart';

import 'package:food_delivery/shared/error/failuer.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/cart_item_repo.dart';

@LazySingleton(as: CartItemRepo, env: ['prod', 'debug'])
class CartItemRepoImpl extends CartItemRepo {
  @override
  Future<Either<Failure, String>> deletCartItem(
      CartItem cartItem, String ordrid) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CartItem>>> fetchOrderList(String ordrtID) async {
    if (true) {
      return right(fake);
    }
  }

  @override
  Future<Either<Failure, String>> updateCartItem(
      CartItem cartItem, String ordrid) {
    throw UnimplementedError();
  }

  List<CartItem> fake = [
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
    const CartItem(
        itemName: "aaa",
        menuItemId: "menuItemId",
        imgUrl: "",
        price: 25,
        totalprice: 150,
        count: 6),
  ];

  @override
  Future<Either<Failure, String>> addCartItem(
      CartItem cartItem, String ordrid) async {
    var firestore = getIt.get<FirebaseFirestore>();
    try {
      var r = await firestore
          .collection("orders")
          .doc(ordrid)
          .collection("cart")
          .add(cartItem.toMap())
          .then((value) => value.id);
      return right(r);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
