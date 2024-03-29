import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/user_managment/domain/repository/i_auth_facad.dart';
import 'package:food_delivery/features/user_managment/domain/repository/i_prof_managemant.dart';
import 'package:food_delivery/features/user_managment/validation/value_objects/email_address.dart';
import 'package:food_delivery/features/user_managment/validation/value_objects/name.dart';
import 'package:food_delivery/features/user_managment/validation/value_objects/pass_word.dart';
import 'package:food_delivery/injection.dart';

import '../../../../shared/error/failuer.dart';
import '../../domain/entites/user.dart';

part 'sing_up_event.dart';
part 'sing_up_state.dart';

class SingUpBloc extends Bloc<SingUpEvent, SingUpState> {
  SingUpBloc()
      : super(SingUpInitial(
            passWord: PassWord(""),
            emailAddress: EmailAddress(""),
            result: null,
            firstName: Name(""),
            lastName: Name(""),
            image: null,
            uri: null)) {
    on<SingUpEvent>((event, emit) {});
    on<EmailAddressChange>((event, emit) =>
        emit(state.copyWith(emailAddress: EmailAddress(event.value))));
    on<PassWordChange>(
        (event, emit) => emit(state.copyWith(passWord: PassWord(event.value))));
    on<FirstNameChange>(
        (event, emit) => emit(state.copyWith(firstName: Name(event.value))));
    on<LastNameChange>(
        (event, emit) => emit(state.copyWith(lastName: Name(event.value))));
    on<SubmittSingup>((event, emit) async {
      Either<Failure, User>? re;
      if (state.emailAddress!.isValid && state.passWord!.isValid) {
        await getIt
            .get<IAuthFacade>()
            .registerWithEmailAndPassword(
                emailAddress: state.emailAddress!.right!,
                password: state.passWord!.right!)
            .then(
              (value) => re = value,
            );
        String fbID = " ";
        re!.fold((l) => null, (r) => fbID = r.uid!);
        User u = User(
            name: state.firstName.right!,
            mail: state.emailAddress!.right!,
            uid: fbID,
            image: state.uri);

        /// add  it to auth
        await getIt<IAuthFacade>().updateUserProfile(u);
        // add to User Data in FireStor;
        await getIt<IProfManagement>().addUser(u);
        emit(state.copyWith(result: re));
      }
    });
    on<SubmittImage>((event, emit) async {
      await getIt<IProfManagement>()
          .setProfileImage(
        img: event.file,
      )
          .then((value) {
        emit(state.copyWith(uri: value));
      });
    });
  }
}
