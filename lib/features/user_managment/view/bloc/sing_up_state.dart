// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sing_up_bloc.dart';

sealed class SingUpState extends Equatable {
  const SingUpState(
      {required this.firstName,
      required this.lastName,
      required this.result,
      required this.passWord,
      required this.emailAddress});
  final PassWord? passWord;
  final EmailAddress? emailAddress;
  final Either<Failure, UserCredential>? result;
  final Name firstName;
  final Name lastName;

  @override
  List<Object?> get props => [firstName,lastName,result,passWord, emailAddress];

  SingUpState copyWith({
    PassWord? passWord,
    EmailAddress? emailAddress,
    Either<Failure, UserCredential>? result,
    Name? firstName,
    Name? lastName,
  }) ;
}

final class SingUpInitial extends SingUpState {
  const SingUpInitial(
      {required super.result,
      required super.passWord,
      required super.emailAddress,
      required super.firstName,
      required super.lastName});
  @override
  SingUpState copyWith(
      {PassWord? passWord,
      EmailAddress? emailAddress,
      Either<Failure, UserCredential>? result,
      Name? firstName,
      Name? lastName}) {
    return SingUpInitial(
        passWord: passWord ?? this.passWord,
        emailAddress: emailAddress ?? this.emailAddress,
        result: result ?? this.result,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }
}

final class SignUpResult extends SingUpState {
  const SignUpResult(
      {required super.result,
      required super.passWord,
      required super.emailAddress, required super.firstName, required super.lastName,});

  @override
  SingUpState copyWith(
      {PassWord? passWord,
      EmailAddress? emailAddress,
      Either<Failure, UserCredential>? result,
      Name? firstName,
      Name? lastName}) {
    return SingUpInitial(
        passWord: passWord ?? this.passWord,
        emailAddress: emailAddress ?? this.emailAddress,
        result: result ?? this.result,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }
}
