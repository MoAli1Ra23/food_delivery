 
import 'package:dartz/dartz.dart';

import '../../../../shared/error/failuer.dart';

abstract class IAuthFacade {
 Future<Either<Failure, Unit>>  registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<Either<Failure, Unit>>  signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
   Future<Either<Failure, Unit>>  signInWithGoogle();
  Future<Either<Failure, Unit>>  signInWithPhoneNumber(String phoneNumber);
}