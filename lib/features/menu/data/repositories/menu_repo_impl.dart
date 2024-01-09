import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/menu/doamain/entiteis/menu.dart';

import 'package:food_delivery/shared/error/failuer.dart';

import '../../doamain/repositories/menu_repo.dart';
// TODO: MUST DEPRECATE IT//////

class MenuRepoImpl extends MenuRepo {
  @override
  Future<Either<Failure, int>> delete(menu) {
     throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> insert(menu) {
     throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Menu>>> menus() {
     throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> update(menu) {
     throw UnimplementedError();
  }
}
