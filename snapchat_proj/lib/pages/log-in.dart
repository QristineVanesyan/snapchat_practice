import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/link.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class LogIN extends StatefulWidget {
  @override
  _LogINState createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  TextEditingController _emailTextFieldController = TextEditingController();
  TextEditingController _passwordTextFieldController = TextEditingController();

  final String _emailfromDB = "test@mail.com";
  final String _passwordfromDB = "1111";

  bool _isValid = false;

  final _formKey = GlobalKey<FormState>();

  String _msg = "";

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
              _renderForm(),
              _renderLogInButton(),
            ],
          )),
    );
  }

  Widget _renderForm() {
    return Column(children: [
      Text(
        "Log In",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
      Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                labelName: 'username or email',
                onTextFieldChange: () => {_toggle()},
                customTextFieldController: _emailTextFieldController,
              ),
              CustomTextField(
                labelName: 'password',
                hideInputedText: true,
                onTextFieldChange: () => {_toggle()},
                customTextFieldController: _passwordTextFieldController,
                icon: Icon(Icons.visibility_off_outlined),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _msg,
                  style: TextStyle(color: Colors.red, fontSize: 10),
                ),
              ),
            ],
          )),
      Center(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Link(
            title: "Forgot your password?",
          ),
        ),
      ),
    ]);
  }

  Widget _renderLogInButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
        title: "Log In",
        onButtonClick: () async => checkUser(),
        color: (_isValid) ? const Color(0xFF02a9f4) : const Color(0xFFbcbcbc),
      ),
    );
  }

  void checkUser() {
    setState(() {
      if (_isValid) {
        if (!(_emailfromDB == _emailTextFieldController.text.trim() &&
            _passwordfromDB == _passwordTextFieldController.text.trim())) {
          _msg = "Oops! Your username/email or password is incorrect.";
        } else {
          _msg = "you successfuly log in";
        }
      }
    });
  }

  void _toggle() {
    setState(() {
      _isValid = _emailTextFieldController.text.isNotEmpty &&
          _passwordTextFieldController.text.isNotEmpty;
    });
  }
}
