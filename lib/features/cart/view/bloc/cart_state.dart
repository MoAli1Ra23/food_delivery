 
part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {
  final String userID;
  final List<CartItem> cartitems;
  final double totalprice;
  const CartInitial({
    required this.userID,
    required this.cartitems,
    required this.totalprice,
  });

  CartInitial copyWith({
    String? userID,
    List<CartItem>? cartitems,
    double? totalprice,
  }) {
    return CartInitial(
      userID: userID ?? this.userID,
      cartitems: cartitems ?? this.cartitems,
      totalprice: totalprice ?? this.totalprice,
    );
  }

  @override
  List<Object> get props => [userID, totalprice, cartitems];
}
