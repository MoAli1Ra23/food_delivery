import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/menu/data/repositories/menu_item_repo_impl.dart';
import 'package:food_delivery/features/menu/doamain/entiteis/menu.dart';
import 'package:food_delivery/injection.dart';

import 'package:food_delivery/shared/error/failuer.dart';

import '../../doamain/entiteis/menu_itames.dart';
import '../../doamain/repositories/menu_items_repo.dart';
import '../../validation/value_object/dicraption.dart';
import '../../validation/value_object/food_name.dart';
import '../../validation/value_object/price.dart';

part 'create_menu_event.dart';
part 'create_menu_state.dart';

class CreateMenuBloc extends Bloc<CreateMenuEvent, CreateMenuState> {
  CreateMenuBloc()
      : super(CreateMenuInitial(
            price: Price("0"),
            name: FoodName(" "),
            discraption: Discraption(""))) {
    // init  CreateMenuInitial fist time
    on<CreateMenuRestruntIdSelected>((event, emit) => emit(CreateMenuInitial(
        price: Price("0"),
        name: FoodName(""),
        discraption: Discraption(" "),
        restruntId: event.restruntId)));
    // food change
    on<CreateMenuFoodNameChange>((event, emit) => emit(
        (state as CreateMenuInitial).copyWith(name: FoodName(event.value))));
    on<CreateMenuPriceChange>((event, emit) =>
        emit((state as CreateMenuInitial).copyWith(price: Price(event.value))));
    on<CreateMenuDiscraptionChange>((event, emit) => emit(
        (state as CreateMenuInitial)
            .copyWith(discraption: Discraption(event.value))));
    on<CreateMenuImageChange>((event, emit) async {
      Either<Failure, String> res =
          await getIt.get<MenuitemsRepo>().uplodeImage(File(event.value));
      String? url;
      res.fold((l) => null, (r) => url = r);

      emit((state as CreateMenuInitial).copyWith(image: url));
    });
    on<CreateMenuItemDelete>((event, emit) {
      var s = (state as CreateMenuInitial);
      List<MenuItem> l = s.items!;
      List<MenuItem> newl = List.from(l, growable: true);
      newl.removeAt(event.index);

      emit((state as CreateMenuInitial).copyWith(items: newl));
    });
    on<CreateMenuAddItem>((event, emit) {
      var s = (state as CreateMenuInitial);
      if (s.discraption.isValid && s.name.isValid && s.price.isValid
          // &&            s.image != null
          ) {
        MenuItem mi = MenuItem(
            imgUrl: s.image,
            dissName: s.name.right!,
            discraption: s.discraption.right!,
            price: s.price.right!);

        List<MenuItem> l = s.items != null ? s.items! : [];
        List<MenuItem> newl = List.from(l, growable: true);
        newl.add(mi);

        emit((state as CreateMenuInitial).copyWith(items: newl));
      }
    });
    on<CreateMenuSave>((event, emit) {
      var s = (state as CreateMenuInitial);

      if (s.items != null && s.items!.isNotEmpty && s.restruntId != null) {
        Menu(id: 0, restrauntId: s.restruntId!, dateTime: DateTime.now());
        // TODO: add func to impl save menu to firebase
        // TODO: add Listof Menu items as as sub collection
      }
    });
  }
}
