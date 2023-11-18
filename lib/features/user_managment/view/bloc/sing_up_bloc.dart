import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/user_managment/domain/repository/i_auth_facad.dart';
import 'package:food_delivery/features/user_managment/validation/value_objects/email_address.dart';
import 'package:food_delivery/features/user_managment/validation/value_objects/pass_word.dart';
import 'package:food_delivery/injection.dart';

import '../../../../shared/error/failuer.dart';

part 'sing_up_event.dart';
part 'sing_up_state.dart';

class SingUpBloc extends Bloc<SingUpEvent, SingUpState> {
  SingUpBloc()
      : super(const SingUpInitial(
            passWord: null, emailAddress: null, result: null)) {
    on<SingUpEvent>((event, emit) {});
    on<EmailAddressChange>((event, emit) =>
        emit(state.copyWith(emailAddress: EmailAddress(event.value))));
    on<PassWordChange>(
        (event, emit) => emit(state.copyWith(passWord: PassWord(event.value))));
    on<SubmittSingup>((event, emit) async {
      Either<Failure, Unit>? r;
      if (state.emailAddress!.isValid && state.passWord!.isValid) {
     await   getIt
            .get<IAuthFacade>()
            .registerWithEmailAndPassword(
                emailAddress: state.emailAddress!.right!,
                password: state.passWord!.right!)
            .then(
              (value) => r = value,
            );
        emit(state.copyWith(result: r));
      }
    });
  }
}
