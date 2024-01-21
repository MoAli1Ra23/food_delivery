part of 'odre_details_bloc.dart';

sealed class OrderDetailsEvent extends Equatable {
  const OrderDetailsEvent();

  @override
  List<Object> get props => [];
}
final class OrderDetailsRequest extends OrderDetailsEvent{
  final String orderId;

  const OrderDetailsRequest(this.orderId);

}

