part of 'profile_bloc_bloc.dart';

sealed class ProfileBlocEvent extends Equatable {
  const ProfileBlocEvent();

  @override
  List<Object> get props => [];
}
class ProfileBlocRequsit extends ProfileBlocEvent
{
  final String fbId;

  const ProfileBlocRequsit(this.fbId);
}