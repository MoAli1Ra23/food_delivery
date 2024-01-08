import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../entiteis/menu_itames.dart';

abstract class MenuitemsRepo {
  Future<Either<Failure, MenuItem>> fetchItemsByMenuId(String menuId);
  Future<Either<Failure, Unit>> insertItems(List<MenuItem> items);
  Future<Either<Failure, Unit>> updateItem(MenuItem item);
  Future<Either<Failure, Unit>> deleteItem(MenuItem item);
}
