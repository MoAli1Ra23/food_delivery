 
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire;

import '../../../../shared/error/failuer.dart';
import '../entites/user.dart';

abstract class IAuthFacade {
 Future<Either<Failure, User>>  registerWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
  Future<Either<Failure, User>>  signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  });
   Future<Either<Failure, Unit>>  signInWithGoogle();
   Future<Either<Failure, Unit>>  singOut();
  Future<Either<Failure, Unit>>  signInWithPhoneNumber(String phoneNumber);

   Future<Either<Failure, User?>> checkAuthState() ;
   Future<Option<Failure>> updateUserProfile(User user);
  
}