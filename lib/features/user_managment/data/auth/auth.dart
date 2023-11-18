import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/error/auth_failure.dart';
import '../../../../shared/error/failuer.dart';
import '../../domain/repository/i_auth_facad.dart';

@prod
@Singleton(as: IAuthFacade)
class Auth extends IAuthFacade {
  final FirebaseAuth auth;

  Auth(this.auth);

  @override
  Future<Either<Failure, Unit>> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      return await auth
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => right(unit));
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
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signInWithPhoneNumber(String phoneNumber) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> registerWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      return await auth
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((value) => right(unit));
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(EmailAlreadyInUse(" "));
      } else {
        return left(AuthFailure(" "));
      }
    }
  }
}
