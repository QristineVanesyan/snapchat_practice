import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/birthday.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

// you can create one page For Sign up and login and call it with other params
class SignUp extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  String error = "";
  String username = "";
  String password = "";
  String email = "";
  void _toggle() {
    setState(() {
      _isValid = (widget._controller1.text.isNotEmpty ||
          widget._controller2.text.isNotEmpty);
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
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'What\'s your name?',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          labelName: 'first name'.toUpperCase(),
                          customTextFieldController: widget._controller1,
                          validator: (val) => val.length > 2
                              ? "Minimum 2 characters are needed"
                              : null,
                          onTextFieldChange: () => {_toggle()},
                          // onTextFieldChange: (val) {
                          //   setState(() {
                          //     _isValid = (widget._controller1.text.isNotEmpty ||
                          //         widget._controller2.text.isNotEmpty);
                          //     return username = val;
                          //   });
                          // },
                        ),
                        CustomTextField(
                          labelName: 'last name'.toUpperCase(),
                          // onTextFieldChange: () => {
                          //   _isValid = (widget._controller1.text.isNotEmpty ||
                          //       widget._controller2.text.isNotEmpty)
                          // },
                          onTextFieldChange: () => {_toggle()},
                          customTextFieldController: widget._controller2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text:
                              'By tapping Sign Up & Accept, you acknowledge that you have read the ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              letterSpacing: 0.5),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // open desired screen
                                  }),
                            TextSpan(
                              text: ' and agree to the ',
                            ),
                            TextSpan(
                                text: 'Tearms of Service',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // open desired screen
                                  }),
                            TextSpan(
                              //ASK for one point i neet create new TextSpan????????????
                              text: '.',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: RoundedButton(
                  title: 'Sing Up & Accept',
                  onButtonClick: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Birthday()))
                  },
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
