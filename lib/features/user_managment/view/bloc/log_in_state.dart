// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

 import 'package:dartz/dartz.dart';
 import 'package:food_delivery/features/user_managment/validation/value_objects/pass_word.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../../validation/value_objects/email_address.dart';

sealed class LogInState extends Equatable {
  const LogInState(
      {required this.passWord,
      required this.emailAddress,
      required this.result});
  final PassWord? passWord;
  final EmailAddress? emailAddress;
  final Either<Failure, Unit>? result;
  @override
  List<Object?> get props => [passWord, emailAddress, result];

  LogInState copyWith({
    PassWord? passWord,
    EmailAddress? emailAddress,
    Either<Failure, Unit>? result,
  }) ;
}

 final class LogInInitial extends LogInState {
  const LogInInitial(
      {required super.passWord,
      required super.emailAddress,
      required super.result});
      
        @override
        LogInState copyWith({PassWord? passWord, EmailAddress? emailAddress, Either<Failure, Unit>? result}) {
         
    return LogInInitial(
      passWord: passWord ?? this.passWord,
      emailAddress: emailAddress ?? this.emailAddress,
      result: result ?? this.result,
    );
  }
        }

