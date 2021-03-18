part of 'log_in_bloc.dart';

class LogInState extends Equatable {
  LogInState();

  @override
  List<Object> get props => [];
}

class LogInInitial extends LogInState {}

class UserNotFoundErrorState extends LogInState {}

class SuccessfullyLoggedIn extends LogInState {}