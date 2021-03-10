import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/birthday.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _fnameTextFieldController = TextEditingController();
  TextEditingController _lnameTextFieldController = TextEditingController();

  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();

  void _toggle() {
    setState(() {
      _isValid = (_fnameTextFieldController.text.isNotEmpty ||
          _lnameTextFieldController.text.isNotEmpty);
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
        padding: const EdgeInsets.only(top: 70),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_renderForm(), _renderContinueButton()],
        ),
      ),
    );
  }

  Widget _renderContinueButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
        title: 'Sing Up & Accept',
        onButtonClick: () => {
          if (_isValid)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Birthday()))
        },
        color: (_isValid) ? const Color(0xFF02a9f4) : const Color(0xFFbcbcbc),
      ),
    );
  }

  Widget _renderForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'What\'s your name?',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          CustomTextField(
            labelName: 'first name'.toUpperCase(),
            customTextFieldController: _fnameTextFieldController,
            validator: (val) =>
                val.length > 2 ? "Minimum 2 characters are needed" : null,
            onTextFieldChange: () => {_toggle()},
          ),
          CustomTextField(
            labelName: 'last name'.toUpperCase(),
            onTextFieldChange: () => {_toggle()},
            customTextFieldController: _lnameTextFieldController,
          ),
          _renderRichTextMessage(),
        ],
      ),
    );
  }

  Widget _renderRichTextMessage() {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
      child: Center(
        child: RichText(
          text: TextSpan(
            text:
                'By tapping Sign Up & Accept, you acknowledge that you have read the ',
            style:
                TextStyle(color: Colors.grey, fontSize: 11, letterSpacing: 0.5),
            children: <TextSpan>[
              TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // some href
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
                      // some href
                    }),
              TextSpan(
                //ASK for one point i neet create new TextSpan????????????
                text: '.',
              )
            ],
          ),
        ),
      ),
    );
  }
}
