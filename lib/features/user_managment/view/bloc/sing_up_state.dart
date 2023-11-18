// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sing_up_bloc.dart';

sealed class SingUpState extends Equatable {
  const SingUpState(
      {required this.result,
      required this.passWord,
      required this.emailAddress});
  final PassWord? passWord;
  final EmailAddress? emailAddress;
  final Either<Failure, Unit>? result;

  @override
  List<Object?> get props => [passWord, emailAddress];

  SingUpState copyWith({
    PassWord? passWord,
    EmailAddress? emailAddress,
    Either<Failure, Unit>? result,
  });
}

final class SingUpInitial extends SingUpState {
  const SingUpInitial(
      {required super.result,
      required super.passWord,
      required super.emailAddress});
  @override
  SingUpState copyWith(
      {PassWord? passWord,
      EmailAddress? emailAddress,
      Either<Failure, Unit>? result}) {
    return SingUpInitial(
        passWord: passWord ?? this.passWord,
        emailAddress: emailAddress ?? this.emailAddress,
        result: result ?? this.result);
  }
}

final class SignUpResult extends SingUpState {
  const SignUpResult(
      {required super.result,
      required super.passWord,
      required super.emailAddress});

  @override
  SingUpState copyWith(
      {PassWord? passWord,
      EmailAddress? emailAddress,
      Either<Failure, Unit>? result}) {
    return SingUpInitial(
        passWord: passWord ?? this.passWord,
        emailAddress: emailAddress ?? this.emailAddress,
        result: result ?? this.result);
  }
}
