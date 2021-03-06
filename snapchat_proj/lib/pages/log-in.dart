import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/link.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class LogIN extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  _LogINState createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  bool _isValidForUsername = false;
  bool _isValidForPassword = false;
  bool _isValid = false;

  void _toggle1() {
    setState(() {
      _isValidForUsername = (widget._controller1.text.isEmpty) ? false : true;
      _isValid = (_isValidForPassword && _isValidForUsername);
    });
  }

  void _toggle2() {
    setState(() {
      _isValidForPassword = (widget._controller2.text.isEmpty) ? false : true;
      _isValid = (_isValidForPassword && _isValidForUsername) ? true : false;
      print(_isValidForPassword);
    });
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
                    'Log In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(
                    labelName: 'username or email',
                    onTextFieldChange: () => {_toggle1()},
                    customTextFieldController: widget._controller1,
                  ),
                  CustomTextField(
                    labelName: 'password',
                    hideInputedText: true,
                    onTextFieldChange: () => {_toggle2()},
                    customTextFieldController: widget._controller2,
                    icon: Icon(Icons.visibility_off_outlined),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Link(
                        title: "Forgot your password?",
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: RoundedButton(
                  title: 'Log In',
                  color: (_isValid)
                      ? const Color(0xFF02a9f4)
                      : const Color(0xFFbcbcbc),
                ),
              ),
            ],
          )),
    );
  }
}
