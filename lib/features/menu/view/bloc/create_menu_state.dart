// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'create_menu_bloc.dart';

sealed class CreateMenuState extends Equatable {
  const CreateMenuState();

  @override
  List<Object?> get props => [];
}

class CreateMenuInitial extends CreateMenuState {
  @override
  List<Object?> get props => [image, price, name, discraption, items,restruntId];

  final Price price;
  final String? image;
  final String? restruntId;
  final FoodName name;
  final Discraption discraption;
  final List<MenuItem>? items;
  const CreateMenuInitial({
    this.image,
    required this.price,
    required this.name,
    required this.discraption,
    this.items,
    this.restruntId,
  });

  CreateMenuInitial copyWith(
      {
        String? image,
        String? restruntId,
      Price? price,
      FoodName? name,
      Discraption? discraption,
      List<MenuItem>? items}) {
    return CreateMenuInitial(
      image: image ?? this.image,
      restruntId: restruntId ?? this.restruntId,
      price: price ?? this.price,
      name: name ?? this.name,
      discraption: discraption ?? this.discraption,
      items: items ?? this.items,
    );
  }
}

class CreateMenuSubmiting extends CreateMenuState {}

class CreateMenuSubmited extends CreateMenuState {}

class CreateMenuSubmiterror extends CreateMenuState {
  final Failure failure;
  CreateMenuSubmiterror({
    required this.failure,
  });

  CreateMenuSubmiterror copyWith({
    Failure? failure,
  }) {
    return CreateMenuSubmiterror(
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [failure];
}
