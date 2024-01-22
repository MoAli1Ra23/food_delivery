import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/cart/domain/entities/cart_item.dart';
import 'package:food_delivery/features/cart/domain/repositories/cart_item_repo.dart';
import 'package:food_delivery/injection.dart';
import 'package:food_delivery/shared/error/failuer.dart';

part 'odre_details_event.dart';
part 'odre_details_state.dart';
/// to manage  order Items 
/// 
class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc() : super(OrderDetailsLoaded(items: const [])) {
    on<OrderDetailsRequest>((event, emit) async {
      List<CartItem>? items;
      Failure? f; 
      var  repo =getIt.get<CartItemRepo>();
      var resul= await repo.fetchOrderList(event.orderId);
      resul.fold((l) => f=l, (r) => items=r);
      if (items!=null) {
        emit(OrderDetailsLoaded(items: items!));
        
      }else{
        emit(OrderDetailsFailure());
      }

    });
    
  }
  
}
