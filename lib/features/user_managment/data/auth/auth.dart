// ignore_for_file: dead_code

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fire;
import 'package:flutter/services.dart';
import 'package:food_delivery/injection.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/error/auth_failure.dart';
import '../../../../shared/error/connection_failure.dart';
import '../../../../shared/error/failuer.dart';
import '../../../../shared/overapp/connection_cheacker.dart';
import '../../domain/entites/user.dart';
import '../../domain/repository/i_auth_facad.dart';
import '../mapper/user_mapper.dart';

@prod
@Singleton(as: IAuthFacade, env: ['prod', 'debug'])
class Auth extends IAuthFacade {
  late fire.FirebaseAuth auth;

  Auth() {
    auth = getIt.get<fire.FirebaseAuth>();
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    var con = await checkConnection();
    if (con.isLeft()) {
      return left(con.fold((l) => l, (r) {
        return ConnectionsFailure("");
      }));
    }

    try {
      User? u;
      Either r = await auth
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) => right(value))
          .timeout(const Duration(seconds: 5));
      r.fold((l) {}, (r) => u);
      if (r.isLeft()) {
        return left(AuthFailure(""));
      } else {
        return right(u!);
      }
    } on fire.FirebaseAuthException catch (e) {
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
  Future<Either<Failure, User>> registerWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      return await auth
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password)
          .then((value) =>
              right(UserMapper.getUserFromFireBaseUserCredential(value)));
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
    auth = getIt.get<fire.FirebaseAuth>();
    try {
      User? s = auth.currentUser != null
          ? UserMapper.getUserFromFireBaseUser(auth.currentUser!)
          : null;

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

  @override
  Future<Option<Failure>> updateUserProfile(User user) async {
    try {
      await auth.currentUser!.updatePhotoURL(user.image);
      await auth.currentUser!.updateDisplayName(user.name);
      return none();
    } catch (e) {
      return some(Failure(""));
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
