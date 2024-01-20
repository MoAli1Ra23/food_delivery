part of 'order_mangement_bloc.dart';

sealed class OrderMangementState extends Equatable {
  const OrderMangementState();

  @override
  List<Object> get props => [];
}

class OrdersLoading extends OrderMangementState {}

class OrdersLoadingFailure extends OrderMangementState {
  final Failure failure;

  const OrdersLoadingFailure(this.failure);
}

final class OrderMangementInitial extends OrderMangementState {
  final List<Order> orders;
  const OrderMangementInitial({
    required this.orders,
  });

  OrderMangementInitial copyWith({
    List<Order>? orders,
  }) {
    return OrderMangementInitial(
      orders: orders ?? this.orders,
    );
  }
}
