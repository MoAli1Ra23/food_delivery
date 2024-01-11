part of 'select_food_bloc.dart';

sealed class SelectFoodEvent extends Equatable {
  const SelectFoodEvent();

  @override
  List<Object> get props => [];
}

class LoadMenu extends SelectFoodEvent {}

class SelcteingFood extends SelectFoodEvent {
  final int index;

  const SelcteingFood(this.index);
}
