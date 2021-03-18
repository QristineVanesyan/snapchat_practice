import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:snapchat_proj/models/user_provider.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  List<UserObj> usersList = [];

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is AddUserEvent) {
      usersList.add(event.user);
      yield UserState();
    }
  }
}
