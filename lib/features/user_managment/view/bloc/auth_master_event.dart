part of 'auth_master_bloc.dart';

sealed class AuthMasterEvent extends Equatable {
  const AuthMasterEvent();

  @override
  List<Object> get props => [];
}
///  fire in log in or registar  a new user
final class  AuthMasterUserChanged extends  AuthMasterEvent{
  final auth.UserCredential userCredential;

  const AuthMasterUserChanged(this.userCredential);
}
/// fire in user sing out
final class AuthMasterSingOut extends AuthMasterEvent{

}
/// fire when request to check auth state 
final class AuthMasterCheckAuthState extends AuthMasterEvent{

}


