part of 'auth_master_bloc.dart';

sealed class AuthMasterState extends Equatable {
  const AuthMasterState();
  
  @override
  List<Object> get props => [];
}

final class AuthMasterInitial extends AuthMasterState {
  final Failure? failure;

  const AuthMasterInitial({this.failure});

}
final class AuthMasterISAuth extends AuthMasterState{
  final User user;

  const AuthMasterISAuth(this.user);

}
