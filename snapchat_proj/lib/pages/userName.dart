import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/password.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class Username extends StatefulWidget {
  @override
  _UsernameState createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  TextEditingController _usernameTextFieldController = TextEditingController();

  final String _usernameFromDB = "username";

  bool _isValid = false;

  Widget _msgText;

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
            children: [_renderUsernameForm(), _renderContinueButton()],
          ),
        ));
  }

  Widget _renderUsernameForm() {
    return Column(
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
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ),
        CustomTextField(
          labelName: 'username'.toUpperCase(),
          onTextFieldChange: () => _toggle(),
          customTextFieldController: _usernameTextFieldController,
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: _msgText,
        )
      ],
    );
  }

  Widget _renderContinueButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
        title: 'Continue',
        onButtonClick: () {
          setState(() {
            if (_isValid) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Password()));
            }
          });
        },
        color: (_isValid) ? const Color(0xFF02a9f4) : const Color(0xFFbcbcbc),
      ),
    );
  }

  void _toggle() {
    setState(() {
      String username = _usernameTextFieldController.text;
      _isValid = _usernameTextFieldController.text.isNotEmpty;
      if (_usernameFromDB == username) {
        _msgText = Text(
          "$_usernameFromDB is already taken!",
          style: TextStyle(color: Colors.red, fontSize: 10),
        );
        _isValid = false;
      } else if (username.length < 3) {
        _msgText = Text(
          "Uh oh! Usernames must be at least 3 characters",
          style: TextStyle(color: Colors.red, fontSize: 10),
        );
        _isValid = false;
      } else {
        _isValid = true;
        _msgText = Text(
          "Username avialble",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        );
      }
    });
  }
}
