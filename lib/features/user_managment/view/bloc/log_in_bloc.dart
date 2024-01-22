import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/user_managment/validation/value_objects/email_address.dart';
import 'package:food_delivery/features/user_managment/validation/value_objects/pass_word.dart';

import '../../../../injection.dart';
import '../../../../shared/error/failuer.dart';
import '../../domain/entites/user.dart';
import '../../domain/repository/i_auth_facad.dart';
import 'log_in_state.dart';

part 'log_in_event.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc()
      : super(const LogInInitial(
            emailAddress: null, passWord: null, result: null)) {
    on<LogInEvent>((event, emit) {});
    on<LogInCommand>((event, emit) async {
      if (state.emailAddress == null || state.emailAddress == null) {
      } else {
        Either<Failure, User>? result;
        User? u;
     

       await getIt
            .get<IAuthFacade>()
            .signInWithEmailAndPassword(
                emailAddress: state.emailAddress!.right!,
                password: state.passWord!.right!)
            .then((value) {
        emit(state.copyWith(result: value ));
             });
      }
    });
    on<EmailChange>((event, emit) =>
        emit(state.copyWith(emailAddress: EmailAddress(event.value))));
    on<PassWordChange>(
        (event, emit) => emit(state.copyWith(passWord: PassWord(event.value))));
  }
}
