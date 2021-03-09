import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/log-in.dart';
import 'package:snapchat_proj/pages/sign-up.dart';
import 'package:snapchat_proj/widgets/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // icon: IconData(color: Colors.blue),
      home: MyHomePage(), //SignUp(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Color(0xFFFFFC00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 120),
              child: Image.asset(
                'assets/images/logo.png',
                width: 120,
                height: 120,
              ),
            ),
            Column(
              children: [
                Button(
                  title: 'log in',
                  color: const Color(0xFFd83c3c),
                  onTapToButton: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogIN()));
                  },
                ),
                Button(
                  title: 'sign up',
                  color: const Color(0xFF03a9f4),
                  onTapToButton: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp())),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
