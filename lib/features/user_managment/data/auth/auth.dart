// ignore_for_file: dead_code

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/injection.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/error/auth_failure.dart';
import '../../../../shared/error/connection_failure.dart';
import '../../../../shared/error/failuer.dart';
import '../../../../shared/overapp/connection_cheacker.dart';
import '../../domain/repository/i_auth_facad.dart';

@prod
@Singleton(as: IAuthFacade, env: ['prod', 'debug'])
class Auth extends IAuthFacade {
  late FirebaseAuth auth;

  Auth() {
    auth = getIt.get<FirebaseAuth>();
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    var con = await checkConnection();
    if (con.isLeft()) {
      return left(con.fold((l) => l, (r) {
        return ConnectionsFailure("");
      }));
    }

    try {
      Failure? f;
      UserCredential? u;
      Either r = await auth
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => right(value))
          .timeout(const Duration(seconds: 5));
      r.fold((l) {
        print("============");
        print("lllllllllllllllllllllllllllllll");
        print(l);
      }, (r) => u);
      if (r.isLeft()) {
        return left(AuthFailure(""));
      } else {
        return right(u!);
      }
    } on FirebaseAuthException catch (e) {
      return left(selectFailure(e.code));
    } on PlatformException catch (e) {
      return left(selectFailure(e.message!));
    } catch (_) {
      return left(AuthFailure(""));
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
      return left(selectFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, User?>> checkAuthState() async {
    var con = await checkConnection();
    if (con.isLeft()) {
      return left(con.fold((l) => l, (r) {
        return ConnectionsFailure("");
      }));
    }
    auth = getIt.get<FirebaseAuth>();
    try {
      User? s = auth.currentUser;

      return right(s);
    } on PlatformException catch (e) {
      return left(selectFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, Unit>> singOut() async {
    try {
      await auth.signOut().then((value) {
        return right(unit);
      }).onError((error, stackTrace) {
        return left(selectFailure(error.toString()));
      });
      return left(Failure(""));
    } on PlatformException catch (e) {
      return left(selectFailure(e.code));
    } on Exception catch (e) {
      return left(selectFailure(e.toString()));
    }
  }
}

AuthFailure selectFailure(String errorCode) {
  if (errorCode == "ERROR_EMAIL_ALREADY_IN_USE" ||
      errorCode == "account-exists-with-different-credential" ||
      errorCode == "email-already-in-use") {
    return EmailAlreadyInUse("Email already used. Go to login page.");
  } else if (errorCode == "ERROR_WRONG_PASSWORD" ||
      errorCode == "wrong-password") {
    return WrongPassWord("Wrong email/password combination.");
  } else if (errorCode == "ERROR_USER_NOT_FOUND" ||
      errorCode == "user-not-found") {
    return UserNotFound("No user found with this email.");
  } else if (errorCode == "ERROR_USER_DISABLED" ||
      errorCode == "user-disabled") {
    return UserDisabled("User disabled.");
  } else if (errorCode == "ERROR_INVALID_CREDENTIAL" ||
      errorCode == "invalid-credential") {
    return InValideEmailPassWordCombnie("Email address is invalid.");
  } else {
    return AuthFailure("Login failed. Please try again.");
  }
  // switch (errorCode) {
  //   case "ERROR_USER_DISABLED":
  //     return UserDisabled("User disabled.");
  //     break;
  //   case "user-disabled":
  //     return UserDisabled("User disabled.");
  //     break;
  //   case "ERROR_TOO_MANY_REQUESTS":
  //     return TooManyRequests("Too many requests to log into this account.");
  //     break;
  //   case "operation-not-allowed":
  //     return TooManyRequests("Too many requests to log into this account.");
  //     break;
  //   case "ERROR_OPERATION_NOT_ALLOWED":
  //     return OperationNotAllowed("Server error, please try again later.");
  //     break;

  //   case "operation-not-allowed":
  //     return OperationNotAllowed("Server error, please try again later.");
  //     break;

  //   case "ERROR_INVALID_CREDENTIAL":
  //     return InValideEmailPassWordCombnie("Email address is invalid.");
  //     break;
  //   case "ERROR_INVALID_EMAIL":
  //     return InValideEmailPassWordCombnie("Email address is invalid.");
  //     break;

  //   case "invalid-email":
  //     return InValideEmailPassWordCombnie("Email address is invalid.");
  //     break;
  //   default:
  //     return AuthFailure("Login failed. Please try again.");
  // break;
  // }
}
