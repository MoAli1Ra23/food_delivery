// ignore_for_file: public_member_api_docs, sort_constructors_first
 
 
 
part of 'select_food_bloc.dart';

sealed class SelectFoodState extends Equatable {
  const SelectFoodState();
  
  @override
  List<Object> get props => [];
}

final class SelectFoodloading extends SelectFoodState {}
class SelectFoodInitial extends SelectFoodState {
  final List<MenuItem> items;
  const SelectFoodInitial({
    required this.items,
  });
  

  SelectFoodInitial copyWith({
    List<MenuItem>? items,
  }) {
    return SelectFoodInitial(
      items: items ?? this.items,
    );
  }
  @override
   List<Object> get props => [items];
 
}
final class SelectFoodloadingerror extends SelectFoodState {
  final Failure failure;

  const SelectFoodloadingerror({
 required   this.failure,
});


  SelectFoodloadingerror copyWith({
    Failure? failure,
  }) {
    return SelectFoodloadingerror(
     failure:failure ?? this.failure,
    );
  }
  @override
   List<Object> get props => [failure];
 }
