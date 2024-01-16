import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/injection.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/error/auth_failure.dart';
import '../../../../shared/error/failuer.dart';
import '../../domain/repository/i_auth_facad.dart';

@prod
@Singleton(as: IAuthFacade, env: ['prod','debug'])
 class Auth extends IAuthFacade {
  late FirebaseAuth auth;

  Auth(){

auth= getIt.get<FirebaseAuth>();
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      return await auth
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => right(value));
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(InValideEmailPassWordCombnie(" "));
      } else {
        return left(AuthFailure(" "));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() {
     throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signInWithPhoneNumber(String phoneNumber) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserCredential>> registerWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      return await auth
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((value) => right(value));
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(EmailAlreadyInUse(" "));
      } else {
        return left(AuthFailure(" "));
      }
    }
  }
  
  @override
  Future<Either<Failure, User?>> checkAuthState() async {
    auth= getIt.get<FirebaseAuth>();
    try {
      User? s= auth.currentUser;
      return right(s);

    } catch (e) {
      return left(Failure(" "));
      
    }
   }
}
