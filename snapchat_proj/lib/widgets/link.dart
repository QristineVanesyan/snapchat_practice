import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/forgotPassword.dart';

class Link extends StatelessWidget {
  final String title;
  Link({this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Text(title,
            style: TextStyle(
              fontSize: 11,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            )),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
        });
  }
}
