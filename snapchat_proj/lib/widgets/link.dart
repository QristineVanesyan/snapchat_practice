import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final String title;
  const Link({this.title});
  @override
  Widget build(BuildContext context) {
    Text(
      title,
      style: const TextStyle(
        fontSize: 11,
        color: Colors.blue,
        fontWeight: FontWeight.w500,
      ),
    );
    return GestureDetector(onTap: () {
      //TODO "forget password" page
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
    });
  }
}
