import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/restraunt_management/domain/entities/restraunt.dart';
import 'package:food_delivery/features/restraunt_management/domain/repositoies/restraunt_repo.dart';
import 'package:food_delivery/injection.dart';

import '../../../../shared/error/failuer.dart';
import '../../validation/value_objects/restrunt_name.dart';

part 'create_restrunt_event.dart';
part 'create_restrunt_state.dart';

class CreateRestruntBloc
    extends Bloc<CreateRestruntEvent, CreateRestruntState> {
  CreateRestruntBloc()
      : super(CreateRestruntInitial(name: RestrauntName(""), userID: "")) {
    on<CreateRestruntEvent>((event, emit) {});
    on<CreateRestruntNameChanaged>((event, emit) {
      if (state is CreateRestruntInitial) {
        emit((state as CreateRestruntInitial)
            .copyWith(name: RestrauntName(event.value)));
      }
    });
    on<CreateRestruntUserIDChanaged>((event, emit) {
      if (state is CreateRestruntInitial) {
        emit((state as CreateRestruntInitial).copyWith(userID: event.value));
      }
    });
    on<CreateRestruntSave>((event, emit) async {
      var s = (state as CreateRestruntInitial);
      if(!s.name.isValid) return;
      var repo = getIt.get<RestrauntRepo>();
      Restraunt r =
          Restraunt(id: 0, name: s.name.right!, rate: 0, userID: s.userID);
      var result = await repo.insert(r);
      emit(CreateRestruntSaving());

      Failure? f;
      result.fold((l) => f = l, (r) => null);
      if (f != null) {
        emit(CreateRestruntSavingerror(failure: f!));
      } else {
        emit(CreateRestruntSaved());
      }
    });
  }
}
