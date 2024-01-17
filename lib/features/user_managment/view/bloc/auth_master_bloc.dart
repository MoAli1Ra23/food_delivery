import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:food_delivery/features/user_managment/domain/repository/i_auth_facad.dart';
import 'package:food_delivery/injection.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../../domain/entites/user.dart';
import '../../domain/repository/i_prof_managemant.dart';

part 'auth_master_event.dart';
part 'auth_master_state.dart';

class AuthMasterBloc extends Bloc<AuthMasterEvent, AuthMasterState> {
  AuthMasterBloc() : super(const AuthMasterInitial()) {
    on<AuthMasterUserChanged>((event, emit) async {
      User user = await getIt
          .get<IProfManagement>()
          .getusrtbyfbId(event.userCredential.user!.uid);

      emit(AuthMasterISAuth(user));
    });
    on<AuthMasterCheckAuthState>(
      (event, emit) async {
        Either<Failure, auth.User?> x =
            await getIt.get<IAuthFacade>().checkAuthState();
        auth.User? u;
        x.fold((l) => null, (r) => u = r);
        if (u == null) {
          emit(const AuthMasterInitial());
        } else {
          await getIt
              .get<IProfManagement>()
              .getusrtbyfbId(u!.uid)
              .then((value) {
            if (value != null) {
              print("is auth");

              emit(AuthMasterISAuth(value));
            }
            print("null");
          }).onError((error, stackTrace) async {
             print("error");
            emit(AuthMasterInitial(failure: Failure(" ")));
          }).timeout(const Duration(seconds: 5), onTimeout: ()async {
            print("time out");

            emit(const AuthMasterInitial());
          });

          print("aaaa");
        }
      },
    );
    on<AuthMasterSingOut>(

      (event, emit) async {
        await getIt.get<IAuthFacade>().singOut();
        emit(const AuthMasterInitial());
      },
    );
  }
}
