import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:snapchat_proj/models/user_provider.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial());
  List<UserObj> usersList = [];
  @override
  Stream<LogInState> mapEventToState(
    LogInEvent event,
  ) async* {
    print("hello from event");
    if (event is CheckUserEvent) {
      print("OK");
      for (var item in usersList) {
        if ((item.email == event.usernameOrEmail ||
                item.username == event.usernameOrEmail) &&
            (item.password == event.password)) {
          yield SuccessfullyLoggedIn();
        } else {
          print("NOK");
          yield UserNotFoundErrorState();
        }
      }
    }
  }
}
