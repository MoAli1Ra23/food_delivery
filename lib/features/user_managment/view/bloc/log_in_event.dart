part of 'log_in_bloc.dart';

sealed class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class LogInCommand extends LogInEvent {}
class EmailChange extends LogInEvent{
  final String value;

  const EmailChange(this.value);
}
class PassWordChange extends LogInEvent{
  final String value;

  const PassWordChange(this.value);
}