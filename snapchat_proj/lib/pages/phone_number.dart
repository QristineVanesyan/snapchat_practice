// ignore: file_names
import 'package:snapchat_proj/widgets/custom_textfield.dart';
import 'package:snapchat_proj/widgets/link.dart';
import 'package:snapchat_proj/widgets/rounded_button.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
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
          "What's your mobile number?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.only(top: 10),
            child: const Link(
              title: 'Sign up with phone email instead',
            ),
          ),
        ),
        CustomTextField(
          labelName: 'mobile number'.toUpperCase(),
          onTextFieldChange: () => _toggle(),
          txtType: TextInputType.phone,
          customTextFieldController: _emailTextFieldController,
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Text("We'll send you an SMS verification code.",
              style: TextStyle(color: Colors.black)),
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
      _isValid = _text.length > 1;
    });
  }
}
