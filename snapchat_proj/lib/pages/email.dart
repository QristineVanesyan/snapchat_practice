import 'package:snapchat_proj/widgets/custom_textfield.dart';
import 'package:snapchat_proj/widgets/link.dart';
import 'package:snapchat_proj/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final TextEditingController _emailTextFieldController =
      TextEditingController();

  bool _isValid = false;
  String get _text => _emailTextFieldController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
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
            _renderEmailForm(),
            _renderContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _renderEmailForm() {
    return Column(
      children: [
        const Text(
          "What's your email address?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: const Link(
              title: 'Sign up with phone number instead',
            ),
          ),
        ),
        CustomTextField(
          labelName: 'email'.toUpperCase(),
          onTextFieldChange: () => _toggle(),
          customTextFieldController: _emailTextFieldController,
        ),
      ],
    );
  }

  Widget _renderContinueButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
        title: 'Continue',
        onButtonClick: () async {
          //TODO Phone Number Page
        },
        color: _changeColor(),
      ),
    );
  }

  Color _changeColor() {
    if (_isValid) {
      return const Color(0xFF02a9f4);
    } else {
      return const Color(0xFFbcbcbc);
    }
  }

  void _toggle() {
    setState(() {
      _isValid = _text.validateEmail;
    });
  }
}

extension _StringValidation on String {
  bool get validateEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}
