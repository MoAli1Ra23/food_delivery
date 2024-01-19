import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/menu/doamain/entiteis/menu_itames.dart';

import '../../domain/entities/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitial(totalprice: 0,cartitems: [], userID: '000',)) {
     on<UserIDSelected>((event, emit) => emit((state as CartInitial).copyWith(userID: event.userID)));
     on<AddCartItemEvent>((event, emit) {
       var s=(state as CartInitial);
      List<CartItem> l= List.from( s.cartitems);
      l.add(CartItem(itemName: event.menuItem.dissName, menuItemId:"", price:event.menuItem.price, totalprice: event.menuItem.price, count: 1)) ;
      var t=countPric(l);
       emit(s.copyWith(cartitems: l ,totalprice: t));
     });
     on<UserIDSelected>((event, emit) => emit((state as CartInitial).copyWith(userID: event.userID)));
     on<UserIDSelected>((event, emit) => emit((state as CartInitial).copyWith(userID: event.userID)));
  }
}
double countPric( List<CartItem> items )
{
  double p=0;
  for (var i in items) {
    p+=(i.count*i.price);

    
  }
  return p;
}
