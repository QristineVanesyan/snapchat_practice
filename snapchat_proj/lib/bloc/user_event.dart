part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AddUserEvent extends UserEvent {
  UserObj user;
  AddUserEvent({@required this.user});
}

// class DecrementEvent extends UserEvent {}
