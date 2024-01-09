part of 'create_menu_bloc.dart';

sealed class CreateMenuEvent extends Equatable {
  const CreateMenuEvent();

  @override
  List<Object> get props => [];
}

class CreateMenuRestruntIdSelected extends CreateMenuEvent {
  final String restruntId;

  const CreateMenuRestruntIdSelected(this.restruntId);
}

class CreateMenuFoodNameChange extends CreateMenuEvent {
  final String value;

  const CreateMenuFoodNameChange(this.value);
}

class CreateMenuPriceChange extends CreateMenuEvent {
  final String value;

  const CreateMenuPriceChange(this.value);
}

class CreateMenuImageChange extends CreateMenuEvent {
  final String value;

  const CreateMenuImageChange(this.value);
}
class CreateMenuDiscraptionChange extends CreateMenuEvent {
  final String value;

  const CreateMenuDiscraptionChange(this.value);
}

class CreateMenuItemDelete extends CreateMenuEvent {
  final int index;

  const CreateMenuItemDelete(this.index);
}

class CreateMenuSave extends CreateMenuEvent {}

class CreateMenuAddItem extends CreateMenuEvent {}
