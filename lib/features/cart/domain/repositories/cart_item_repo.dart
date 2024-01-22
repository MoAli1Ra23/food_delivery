import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../entities/cart_item.dart';

abstract class CartItemRepo{
  
  Future<Either<Failure, String>>addCartItem(CartItem cartItem,String ordrid );
  Future<Either<Failure, String>>updateCartItem(CartItem cartItem, String ordrid);
  /// delete cart  in path collection(order).doc(ordrid).collction(items).wehre(CartItem.id==cartitem.id)
  /// 
  Future<Either<Failure, String>>deletCartItem(CartItem cartItem, String ordrid);
  /// get all item form [Collection(orders).Collection("items")] [orderds.items]
  /// exceptions  firebase expcption
  /// Failure custom failure for exception 
  Future<Either<Failure, List<CartItem>>>fetchOrderList( String ordrtID);



}