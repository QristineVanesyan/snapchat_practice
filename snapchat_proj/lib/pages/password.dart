import 'package:flutter/material.dart';
import 'package:snapchat_proj/models/user_provider.dart';
import 'package:snapchat_proj/pages/email.dart';
import 'package:snapchat_proj/widgets/custom_textfield.dart';
import 'package:snapchat_proj/widgets/rounded_button.dart';

class Password extends StatefulWidget {
  UserObj user;
  Password(this.user);
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _passwordTextFieldController =
      TextEditingController();

  bool _isValid = false;

  final _formKey = GlobalKey<FormState>();

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
            _renderPasswordForm(),
            _renderContinueButton(),
          ],
        ),
      ),
    );
  }

  Widget _renderPasswordForm() {
    return Container(
      padding: const EdgeInsets.only(top: 70),
      child: Column(
        children: [
          const Text(
            'Set a password',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: const Text(
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
              customTextFieldController: _passwordTextFieldController,
              isVisible: true,
              validator: _validatePassword,
              onTextFieldChange: () => _toggle(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderContinueButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
        title: 'Continue',
        onButtonClick: () async {
          if (_formKey.currentState.validate()) {
            setData();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Email(widget.user)));
          }
        },
        color: _changeColor(),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _isValid = _passwordTextFieldController.text.isNotEmpty;
    });
  }

  void setData() {
    widget.user.password = _passwordTextFieldController.text;
  }

  String _validatePassword(String value) {
    if (_passwordTextFieldController.text.length < 8) {
      return "Your password must be at least 8 characters.";
    }
    return null;
  }

  Color _changeColor() {
    if (_isValid) {
      return const Color(0xFF02a9f4);
    } else {
      return const Color(0xFFbcbcbc);
    }
  }
}
