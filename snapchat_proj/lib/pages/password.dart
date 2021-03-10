import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/email.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class Password extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _isValid = widget._controller1.text.isNotEmpty;
    });
  }

  String validatePassword(String value) {
    if (value.length < 8) {
      return "Your password must be at least 8 characters.";
    } else
      return null;
  }

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
                  'Set a password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Your password should be at least 8 characters.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: CustomTextField(
                    labelName: 'password'.toString(),
                    customTextFieldController: widget._controller1,
                    hideInputedText: true,
                    flatButtonShow: true,
                    isVisible: false,
                    validator: validatePassword,
                    onTextFieldChange: () => _toggle(),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: RoundedButton(
                title: 'Continue',
                onButtonClick: () async {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Email()));
                  }
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
