 
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/user_managment/domain/entites/user.dart';
import 'package:food_delivery/features/user_managment/domain/repository/i_prof_managemant.dart';
import 'package:food_delivery/injection.dart';

part 'profile_bloc_event.dart';
part 'profile_bloc_state.dart';

class ProfileBlocBloc extends Bloc<ProfileBlocEvent, ProfileBlocState> {
  ProfileBlocBloc() : super(const ProfileBlocInitial(mail: null,name:null,image: null,fbID: null)) {
    on<ProfileBlocEvent>((event, emit) {
     });
     on<ProfileBlocRequsit>((event, emit) async {
      User? uu =await  getIt.get<IProfManagement>().getusrtbyfbId(event.fbId);
       emit(  ProfileBlocLoading(name:   null,mail: null,image: null,fbID: event.fbId));
       if(uu!=null)
       {
        emit(ProfileBlocLaoded(mail: uu.mail,name: uu.name,image: null,fbID:  event.fbId));
       }
     });
     on<ProfileBlocUpdateImage>((event, emit) {
      emit(state.copyWith(image: event.path.path));
      getIt.get<IProfManagement>().setProfileImage(state.fbID!, event.path);

     });
  }
}
