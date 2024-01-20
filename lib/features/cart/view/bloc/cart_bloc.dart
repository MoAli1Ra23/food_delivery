import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/menu/doamain/entiteis/menu_itames.dart';

import '../../domain/entities/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc()
      : super(const CartInitial(
          totalprice: 0,
          cartitems: [],
          userID: '000',
        )) {
    on<UserIDSelected>((event, emit) =>
        emit((state as CartInitial).copyWith(userID: event.userID)));
    on<AddCartItemEvent>((event, emit) {
      var s = (state as CartInitial);
      List<CartItem> l = List.from(s.cartitems);
      l.add(CartItem(
          itemName: event.menuItem.dissName,
          menuItemId: "",
          price: event.menuItem.price,
          totalprice: event.menuItem.price,
          count: 1,
          imgUrl: event.menuItem.imgUrl!));
      var t = countPric(l);
      emit(s.copyWith(cartitems: l, totalprice: t));
    });
    on<IncraesCountEvent>((event, emit) {
      var s = state as CartInitial;

      List<CartItem> x = editList(event, s);
      var ns = s.copyWith(cartitems: x);

      emit(ns);

      var p = countPric(s.cartitems);
      emit(ns.copyWith(totalprice: p));
    });
    on<DecraesCountEvent>((event, emit) {
      var s = state as CartInitial;

      List<CartItem> x = editList(event, s);
      var ns = s.copyWith(cartitems: x);

      emit(ns);

      var p = countPric(s.cartitems);
      emit(ns.copyWith(totalprice: p));
    });

    //  on<UserIDSelected>((event, emit) => emit((state as CartInitial).copyWith(userID: event.userID)));
    on<DeleteItemEvent>((event, emit) {
      var s = (state as CartInitial);
      var items = s.cartitems;
      items.removeAt(event.index);
      emit((state as CartInitial).copyWith(cartitems: items));
            var tp = countPric((state as CartInitial).cartitems);
        emit((state as CartInitial).copyWith(totalprice: tp));

    });
  }
}

double countPric(List<CartItem> items) {
  double p = 0;
  for (var i in items) {
    p += (i.count * i.price);
  }
  return p;
}

List<CartItem> editList(CartEvent event, CartInitial s) {
  if (event is IncraesCountEvent) {
    double tp = (event.item.count + 1) * event.item.price;

    CartItem c =
        event.item.copyWith(count: (event.item.count + 1), totalprice: tp);

    List<CartItem> x = List.from(s.cartitems, growable: true);
    x.removeAt(event.index);

    x.insertAll(event.index, [c]);
    return x;
  } else {
    event = (event as DecraesCountEvent);
    double tp = (event.item.count - 1) * event.item.price;

    CartItem c =
        event.item.copyWith(count: (event.item.count - 1), totalprice: tp);

    List<CartItem> x = List.from(s.cartitems, growable: true);
    x.removeAt(event.index);
    if (c.count > 0) {
      x.insertAll(event.index, [c]);
    }
    return x;
  }
}
