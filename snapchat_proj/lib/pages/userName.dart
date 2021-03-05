import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class Username extends StatelessWidget {
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
                  'Peek a username',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Text(
                    'Your username is how friends add you on Snapchat.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                CustomTextField(
                  labelName: 'USERNAME',
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: RoundedButton(
                title: 'Continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}