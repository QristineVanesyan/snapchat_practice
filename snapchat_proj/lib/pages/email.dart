import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/link.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class Email extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  bool _isValid = false;

  void _toggle() {
    setState(() {
      _isValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(widget._controller1.text);
    });
  }

  //String validateEmail(String value) {}

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
                  customTextFieldController: widget._controller1,
                  // validator: validateEmail,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: RoundedButton(
                title: 'Continue',
                onButtonClick: () async {
                  // if (_isValid) {
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => null()));
                  // }
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
