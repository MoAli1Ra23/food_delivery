import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/injection.dart';
import 'package:food_delivery/shared/error/failuer.dart';

import '../../doamain/entiteis/menu_itames.dart';
import '../../doamain/repositories/menu_items_repo.dart';

part 'select_food_event.dart';
part 'select_food_state.dart';

class SelectFoodBloc extends Bloc<SelectFoodEvent, SelectFoodState> {
  SelectFoodBloc() : super(SelectFoodloading()) {
    on<SelectFoodEvent>((event, emit) {});
    on<LoadMenu>((event, emit) async {
      emit(SelectFoodloading());
      var rpo = getIt.get<MenuitemsRepo>();
      var er = await rpo.fetchItems();
      Failure? f;
      List<MenuItem>? l;
      er.fold((l) => f = l, ((r) => l = r));
      if (l != null) {
        emit(SelectFoodInitial(items: l!));
      } else {
        emit(SelectFoodloadingerror(failure: f!));
      }
    });
  }
}
