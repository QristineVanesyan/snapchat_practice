import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:snapchat_proj/pages/birthday.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'What\'s your name?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                CustomTextField(
                  labelName: "FIRST NAME",
                ),
                CustomTextField(
                  labelName: "LAST NAME",
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),

                  child: new RichText(
                    text: new TextSpan(
                      children: [
                        new TextSpan(
                          text: 'By tapping ',
                          style: new TextStyle(color: Colors.black),
                        ),
                        new TextSpan(
                          text: 'Sign Up & Accept',
                          style: new TextStyle(color: Colors.blue),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              print("object");
                            },
                        ),
                        new TextSpan(
                          text: ', you acknowledge that you have read the ',
                          style: new TextStyle(color: Colors.black),
                          recognizer: new TapGestureRecognizer()..onTap = () {},
                        ),
                        new TextSpan(
                          text: ' and agree to the ',
                          style: new TextStyle(color: Colors.black),
                          recognizer: new TapGestureRecognizer()..onTap = () {},
                        ),
                        new TextSpan(
                          text: ' Terms of Service.',
                          style: new TextStyle(color: Colors.blue),
                          recognizer: new TapGestureRecognizer()..onTap = () {},
                        ),
                        new TextSpan(
                          text: '.',
                          style: new TextStyle(color: Colors.black),
                          recognizer: new TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  //  Text(
                  //   'By tapping Sign Up & Accept, you acknowledge that you have read the Privacy Policy and agree to the.',
                  //   style: TextStyle(
                  //     fontSize: 11,
                  //     letterSpacing: 0.5
                  //   ),
                  //   ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: RoundedButton(
                title: 'Sign Up & Accept',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
