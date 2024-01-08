import 'package:dartz/dartz.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../entities/restraunt.dart';

abstract class  RestrauntRepo {
  Future<Either<Failure,List<Restraunt>>> allRestruants();
  Future<Either<Failure, Restraunt>> getRestruntbyUserID(String userid);

  Future<Either<Failure,int>> insert(Restraunt r);
  Future<Either<Failure,int>> delete(Restraunt r);
  Future<Either<Failure,int>> update(Restraunt r);
 }