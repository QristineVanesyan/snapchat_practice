import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:snapchat_proj/models/user_provider.dart';
import 'package:snapchat_proj/pages/log_in.dart';
import 'package:snapchat_proj/pages/sign_up.dart';
import 'package:snapchat_proj/widgets/button.dart';
import 'package:snapchat_proj/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  UserObj user = UserObj();
  List<UserObj> users = [];
  //User user = User(name: "username");
  Color get _themeColor => const Color(0xFFFFFC00);
  Widget get _themeIcon => Image.asset(
        'assets/images/logo.png',
        width: 120,
        height: 120,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: _themeColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 120),
              child: _themeIcon,
            ),
            Column(
              children: [
                Button(
                  title: 'users',
                  color: const Color(0xFFd83c3c),
                  toPage: UserList(),
                ),
                Button(
                  title: 'log in',
                  color: const Color(0xFFd83c3c),
                  toPage: LogIN(),
                ),
                Button(
                  title: 'sign up',
                  color: const Color(0xFF03a9f4),
                  toPage: ChangeNotifierProvider<UserObj>(
                      create: (context) => user, child: SignUp()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
