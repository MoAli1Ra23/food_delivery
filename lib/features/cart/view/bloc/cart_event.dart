part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddCartItemEvent extends CartEvent {
  final MenuItem menuItem;

  const AddCartItemEvent(this.menuItem);
}

final class IncraesCountEvent extends CartEvent {
  final CartItem item;
  final int index;

  const IncraesCountEvent(this.item, this.index);

}

final class DecraesCountEvent extends CartEvent {
  final CartItem item;
    final int index;


  const DecraesCountEvent(this.item, this.index);
}

final class DeleteItemEvent extends CartEvent {
  final int index;

  const DeleteItemEvent(this.index);
}

final class SubmmitOrderEvent extends CartEvent {}

final class UserIDSelected extends CartEvent {
  final String userID;

  const UserIDSelected(this.userID);
}
