part of 'sing_up_bloc.dart';

sealed class SingUpEvent extends Equatable {
  const SingUpEvent();

  @override
  List<Object> get props => [];
}

class EmailAddressChange extends SingUpEvent {
  final String value;

  const EmailAddressChange(this.value);
}

class PassWordChange extends SingUpEvent {
  final String value;

  const PassWordChange(this.value);
}

class SubmittSingup extends SingUpEvent {}
