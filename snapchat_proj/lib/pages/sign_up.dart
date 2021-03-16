import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snapchat_proj/models/user_provider.dart';
import 'package:snapchat_proj/pages/birthday.dart';
import 'package:snapchat_proj/widgets/custom_textfield.dart';
import 'package:snapchat_proj/widgets/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';

/*

context.watch<Data>().getData

navigatorKey: _mainNavigatorKey;
context.read<UserObj>().firstName = _fnameTextFieldController.text;
    context.read<UserObj>().lastName = _lnameTextFieldController.text;
*/

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  UserObj user = UserObj();

  final String privacyPolicyUrl =
      'https://snap.com/en-US/privacy/privacy-policy';
  final String termsUrl = 'https://snap.com/en-US/terms';

  final TextEditingController _fnameTextFieldController =
      TextEditingController();
  final TextEditingController _lnameTextFieldController =
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
          children: [_renderForm(), _renderContinueButton()],
        ),
      ),
    );
  }

  Widget _renderForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            "What's your name?",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          CustomTextField(
            labelName: 'first name'.toUpperCase(),
            customTextFieldController: _fnameTextFieldController,
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
            style: const TextStyle(
                color: Colors.grey, fontSize: 11, letterSpacing: 0.5),
            children: <TextSpan>[
              TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(privacyPolicyUrl);
                    }),
              const TextSpan(
                text: ' and agree to the ',
              ),
              TextSpan(
                  text: 'Tearms of Service',
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(termsUrl);
                    }),
              const TextSpan(
                //TODO ASK for one point i neet create new TextSpan????????????
                text: '.',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderContinueButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
        title: 'Sing Up & Accept',
        onButtonClick: () {
          if (!_isValid) return;
          onButtonClickFunctionality();
        },
        color: _changeColor(),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _isValid = checkTextFields();
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Color _changeColor() {
    if (_isValid) {
      return const Color(0xFF02a9f4);
    } else {
      return const Color(0xFFbcbcbc);
    }
  }

  bool checkTextFields() {
    return _fnameTextFieldController.text.isNotEmpty ||
        _lnameTextFieldController.text.isNotEmpty;
  }

  void onButtonClickFunctionality() {
    setData();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Birthday(user),
        ));
  }

  void setData() {
    user.firstName = _fnameTextFieldController.text;
    user.lastName = _fnameTextFieldController.text;
  }
}
