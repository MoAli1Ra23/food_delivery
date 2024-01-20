part of 'order_mangement_bloc.dart';

sealed class OrderMangementEvent extends Equatable {
  const OrderMangementEvent();

  @override
  List<Object> get props => [];
}

class RequistOrders extends OrderMangementEvent {
  final String? userID;
  final String? state;

  const RequistOrders({this.userID, this.state});
}
