// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sing_up_bloc.dart';

sealed class SingUpState extends Equatable {
  const SingUpState(
      {required this.firstName,
      required this.lastName,
      required this.result,
      required this.passWord,
      required this.emailAddress,
      required this.image,
      this.uri});
  final PassWord? passWord;
  final EmailAddress? emailAddress;
  final Either<Failure, User>? result;
  final Name firstName;
  final Name lastName;
  final File? image;
  final String? uri;

  @override
  List<Object?> get props =>
      [firstName, lastName, result, passWord, emailAddress, image, uri];

  SingUpState copyWith(
      {PassWord? passWord,
      EmailAddress? emailAddress,
      Either<Failure, User>? result,
      Name? firstName,
      Name? lastName,
      File? image,
      String? uri});
}

final class SingUpInitial extends SingUpState {
  const SingUpInitial(
      {required super.result,
      required super.passWord,
      required super.emailAddress,
      required super.firstName,
      required super.lastName,
      required super.image,
      super.uri});
  @override
  SingUpState copyWith(
      {PassWord? passWord,
      EmailAddress? emailAddress,
      Either<Failure, User>? result,
      Name? firstName,
      Name? lastName,
      File? image,
      String? uri}) {
    return SingUpInitial(
      passWord: passWord ?? this.passWord,
      emailAddress: emailAddress ?? this.emailAddress,
      result: result ?? this.result,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      uri: uri ?? this.uri,
    );
  }
}

final class SignUpResult extends SingUpState {
  const SignUpResult(
      {required super.result,
      required super.passWord,
      required super.emailAddress,
      required super.firstName,
      required super.lastName,
      required super.image,
      super.uri});

  @override
  SingUpState copyWith(
      {PassWord? passWord,
      EmailAddress? emailAddress,
      Either<Failure, User>? result,
      Name? firstName,
      Name? lastName,
      File? image,
      String? uri}) {
    return SingUpInitial(
      passWord: passWord ?? this.passWord,
      emailAddress: emailAddress ?? this.emailAddress,
      result: result ?? this.result,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      uri: uri ?? this.uri,
    );
  }
}
