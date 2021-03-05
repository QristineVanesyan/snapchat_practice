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
      body: SizedBox.expand(
        //or height: double.infinity
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.yellow,
            image: const DecorationImage(
              image: AssetImage('assets/images/bg-img.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                title: 'log in',
                color: const Color(0xFFd83c3c),
                toPage: () => LogIN(),
              ),
              Button(
                title: 'sign up',
                color: const Color(0xFF03a9f4),
                toPage: () => SignUp(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
