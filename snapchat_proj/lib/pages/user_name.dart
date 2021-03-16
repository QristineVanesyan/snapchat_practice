import 'package:flutter/material.dart';
import 'package:snapchat_proj/models/user_provider.dart';
import 'package:snapchat_proj/pages/password.dart';
import 'package:snapchat_proj/widgets/custom_textfield.dart';
import 'package:snapchat_proj/widgets/rounded_button.dart';

class Username extends StatefulWidget {
  UserObj user;
  Username(this.user);
  @override
  _UsernameState createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  final TextEditingController _usernameTextFieldController =
      TextEditingController();

  final String _usernameFromDB = "username";

  bool _isValid = false;

  Widget _msgText;

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
            children: [_renderUsernameForm(), _renderContinueButton()],
          ),
        ));
  }

  Widget _renderUsernameForm() {
    return Column(
      children: [
        const Text(
          'Peek a username',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: const Text(
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
              setData();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Password(widget.user)));
            }
          });
        },
        color: _changeColor(),
      ),
    );
  }

  void _toggle() {
    setState(() {
      final String username = _usernameTextFieldController.text;
      _isValid = _usernameTextFieldController.text.isNotEmpty;
      if (_usernameFromDB == username) {
        _msgText = Text(
          "$_usernameFromDB is already taken!",
          style: const TextStyle(color: Colors.red, fontSize: 10),
        );
        _isValid = false;
      } else if (username.length < 3) {
        _msgText = const Text(
          "Uh oh! Usernames must be at least 3 characters",
          style: TextStyle(color: Colors.red, fontSize: 10),
        );
        _isValid = false;
      } else {
        _isValid = true;
        _msgText = const Text(
          "Username avialble",
          style: TextStyle(color: Colors.grey, fontSize: 10),
        );
      }
    });
  }

  void setData() {
    widget.user.username = _usernameTextFieldController.text;
  }

  Color _changeColor() {
    if (_isValid) {
      return const Color(0xFF02a9f4);
    } else {
      return const Color(0xFFbcbcbc);
    }
  }
}
