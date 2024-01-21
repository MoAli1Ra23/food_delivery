part of 'odre_details_bloc.dart';

sealed class OrderDetailsState extends Equatable {
  const OrderDetailsState();

  @override
  List<Object> get props => [];
}

  class OdreDetailsLoading extends OrderDetailsState {}

  class OrderDetailsLoaded extends OrderDetailsState {
  final List <CartItem> items;
  @override
   List<Object> get props => [items];


  const OrderDetailsLoaded({required this.items});
  
OrderDetailsLoaded copyWith(List <CartItem>? items) {
  return OrderDetailsLoaded(items: items ?? this.items);
}

}

final class OrderDetailsFailure extends OrderDetailsState {}
