part of 'create_restrunt_bloc.dart';

sealed class CreateRestruntState extends Equatable {
  const CreateRestruntState();

  @override
  List<Object> get props => [];
}

final class CreateRestruntInitial extends CreateRestruntState {
  final RestrauntName name;
  final String userID;

  const CreateRestruntInitial({required this.userID, required this.name});
  @override
  List<Object> get props => [name,userID];

  CreateRestruntInitial copyWith({RestrauntName? name,String? userID}) {
    return CreateRestruntInitial(
      name: name ?? this.name,
      userID: userID ?? this.userID,
      );
  }
}

class CreateRestruntSaving extends CreateRestruntState {}

class CreateRestruntSavingerror extends CreateRestruntState {
  final Failure failure;

  const CreateRestruntSavingerror({required this.failure});
  @override
  List<Object> get props => [failure];

  CreateRestruntSavingerror copyWith(Failure? failure) {
    return CreateRestruntSavingerror(failure: failure ?? this.failure);
  }
}

class CreateRestruntSaved extends CreateRestruntState {}
