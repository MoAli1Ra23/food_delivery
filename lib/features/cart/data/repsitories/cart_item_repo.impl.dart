import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';

import 'package:food_delivery/shared/error/failuer.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/cart_item_repo.dart';
@LazySingleton(as:CartItemRepo,env: ['prod', 'debug'])
 class CartItemRepoImpl extends CartItemRepo{
  @override
  Future<Either<Failure, String>> addCartItem(CartItem cartItem) {
     throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> deletCartItem(CartItem cartItem, String ordrid) {
     throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CartItem>>> fetchOrderList(String ordrtID) {
     throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> updateCartItem(CartItem cartItem, String ordrid) {
     throw UnimplementedError();
  }

}