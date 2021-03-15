import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:snapchat_proj/cubit/user_cubit.dart';
import 'package:snapchat_proj/services/user_repository.dart';
import 'package:snapchat_proj/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Users List'),
          centerTitle: true,
        ),
        body: UserList(),
      ),
    );
  }
}
