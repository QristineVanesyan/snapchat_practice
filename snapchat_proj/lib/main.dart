import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/log_in.dart';
import 'package:snapchat_proj/pages/sign_up.dart';
import 'package:snapchat_proj/widgets/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snapchat',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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
                  title: 'log in',
                  color: const Color(0xFFd83c3c),
                  toPage: LogIN(),
                ),
                Button(
                  title: 'sign up',
                  color: const Color(0xFF03a9f4),
                  toPage: SignUp(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
