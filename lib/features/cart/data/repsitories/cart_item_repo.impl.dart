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
    try {
      var store = getIt.get<FirebaseFirestore>();
      var x = await store
          .collection("orders")
          .doc(ordrtID)
          .collection("cart")
          .get()
          .then((value) => value);
      List<CartItem> h = [];
      for (var d in x.docs) {
        h.add(CartItem.fromMap(d.data()));
      }
      return right(h);
    } catch (e) {
      return left(Failure(""));
    }
  }

  @override
  Future<Either<Failure, String>> updateCartItem(
      CartItem cartItem, String ordrid) async {
    try {
      var store = getIt.get<FirebaseFirestore>();
      var sup = store.collection("orders").doc(ordrid).collection("cart");
      var x = await sup.where("itemName", isEqualTo: cartItem.itemName).get();
      if (x.docs.isNotEmpty) {
        return await sup
            .doc(x.docs.first.id)
            .update(cartItem.toMap())
            .then((value) => right(""));
      } else {
        return left(Failure(""));
      }
    } catch (e) {
      return left(Failure(""));
    }
  }

  // List<CartItem> fake = [
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  //   const CartItem(
  //       itemName: "aaa",
  //       menuItemId: "menuItemId",
  //       imgUrl: "",
  //       price: 25,
  //       totalprice: 150,
  //       count: 6),
  // ];

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
