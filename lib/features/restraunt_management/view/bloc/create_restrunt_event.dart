part of 'create_restrunt_bloc.dart';

sealed class CreateRestruntEvent extends Equatable {
  const CreateRestruntEvent();

  @override
  List<Object> get props => [];
}

class CreateRestruntNameChanaged extends CreateRestruntEvent {
  final String value;

  const CreateRestruntNameChanaged(this.value);
}


class CreateRestruntUserIDChanaged extends CreateRestruntEvent {
  final String value;

  const CreateRestruntUserIDChanaged(this.value);
}

class CreateRestruntSave extends CreateRestruntEvent {}
