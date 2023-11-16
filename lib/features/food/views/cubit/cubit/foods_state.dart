// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/food/domain/entities/food.dart';

 
class FoodsState extends Equatable {
  const FoodsState({
    required this.foods,
  });
  final List<Food> foods;
  @override
  List<Object> get props => [foods];

  FoodsState copyWith({
    List<Food>? foods,
  }) {
    return FoodsState(
      foods: foods ?? this.foods,
    );
  }
}
