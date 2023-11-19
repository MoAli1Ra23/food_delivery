import 'package:dartz/dartz.dart';
import 'package:food_delivery/features/menu/doamain/entiteis/menu.dart';
import 'package:food_delivery/shared/error/failuer.dart';

abstract class MenuRepo  {
  Future<Either<Failure,List<Menu>>> menus();
  Future<Either<Failure,int>> insert(menu);
  Future<Either<Failure,int>> delete(menu);
  Future<Either<Failure,int>> update(menu);
  
}