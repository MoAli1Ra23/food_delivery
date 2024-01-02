 
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../shared/error/failuer.dart';

abstract class IAuthFacade {
 Future<Either<Failure, UserCredential>>  registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<Either<Failure, UserCredential>>  signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
   Future<Either<Failure, Unit>>  signInWithGoogle();
  Future<Either<Failure, Unit>>  signInWithPhoneNumber(String phoneNumber);
}