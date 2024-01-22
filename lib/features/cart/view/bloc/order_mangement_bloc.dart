import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/cart/domain/entities/order.dart';
import 'package:food_delivery/features/cart/domain/repositories/order_repo.dart';
import 'package:food_delivery/injection.dart';
import 'package:food_delivery/shared/error/failuer.dart';

part 'order_mangement_event.dart';
part 'order_mangement_state.dart';

class OrderMangementBloc
    extends Bloc<OrderMangementEvent, OrderMangementState> {
  OrderMangementBloc() : super(const OrderMangementInitial(orders: [])) {
    on<RequistOrders>((event, emit) async {
      var orderRepo = getIt.get<OrderRepo>();
      List<Order>? orders;
      Failure? f;

      emit(OrdersLoading());
      if (event.state != null) {
        try {
          var x = await orderRepo
              .fechOrdrrByState(event.state!)
              .then((value) => value);

          x.fold((l) => f = l, (r) => orders = r);
          if (x.isRight()) {
            emit(OrderMangementInitial(orders: orders!));
          } else {
            emit(OrdersLoadingFailure(f!));
          }
        } catch (e) {
          emit(OrdersLoadingFailure(Failure("")));
        }
      } else if (event.userID != null) {
        try {
          var x = await orderRepo
              .fechOrdrrByUserID(event.userID!)
              .then((value) => value);

          x.fold((l) => f = l, (r) => orders = r);
          if (x.isRight()) {
            emit(OrderMangementInitial(orders: orders!));
          } else {
            emit(OrdersLoadingFailure(f!));
          }
        } catch (e) {
          emit(OrdersLoadingFailure(Failure("")));
        }
      }
    });
  }
}
