import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/link.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

// you can create one page For Sign up and login and call it with other params
class SignUp extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                    labelName: 'first name'.toUpperCase(),
                    onTextFieldChange: () => {_toggle1()},
                    customTextFieldController: widget._controller1,
                  ),
                  CustomTextField(
                    labelName: 'last name'.toUpperCase(),
                    onTextFieldChange: () => {_toggle2()},
                    customTextFieldController: widget._controller2,
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
                                style: TextStyle(
                                  color: Colors.grey,
                                )),
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
                                //ask for one point i neet create new TextSpan????????????
                                text: '.',
                                style: TextStyle(
                                  color: Colors.grey,
                                  // fontSize: fontSizeForMessage,
                                  // fontWeight: FontWeight.bold
                                ))
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
