part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class CheckUserEvent extends LogInEvent {
  String usernameOrEmail;
  String password;
  CheckUserEvent({@required this.usernameOrEmail, @required this.password});
}
