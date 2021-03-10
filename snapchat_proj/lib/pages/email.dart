import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/link.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  TextEditingController _emailTextFieldController = TextEditingController();

  bool _isValid = false;

  void _toggle() {
    setState(() {
      _isValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_emailTextFieldController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'What\'s your email address?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Link(
                      title: 'Sign up with phone number instead',
                    ),
                  ),
                ),
                CustomTextField(
                  labelName: 'email'.toUpperCase(),
                  onTextFieldChange: () => _toggle(),
                  customTextFieldController: _emailTextFieldController,
                  // validator: validateEmail,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: RoundedButton(
                title: 'Continue',
                onButtonClick: () async {
                  // Phone Number Page
                },
                color: (_isValid)
                    ? const Color(0xFF02a9f4)
                    : const Color(0xFFbcbcbc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
