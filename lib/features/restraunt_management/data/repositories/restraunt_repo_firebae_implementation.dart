import 'package:dartz/dartz.dart';

import 'package:food_delivery/features/restraunt_management/domain/entities/restraunt.dart';

import 'package:food_delivery/shared/error/failuer.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositoies/restraunt_repo.dart';
@LazySingleton( as:RestrauntRepo )

class RestrauntRepoFirebaseImplementation extends RestrauntRepo {
  @override
  Future<Either<Failure, List<Restraunt>>> allRestruants() {
    // TODO: implement allRestruants
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> delete(Restraunt r) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> insert(Restraunt r) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> update(Restraunt r) {
    // TODO: implement update
    throw UnimplementedError();
  }
  
}