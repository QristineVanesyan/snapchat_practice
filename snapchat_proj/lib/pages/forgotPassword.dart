import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class ForgotPasswordScreen extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isValid = false;
  String email = "";
  String error = "";
  final _formKey = GlobalKey<FormState>();

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
                    "When'\s your birthday?",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  // CustomTextField(
                  //   labelName: 'birthday'.toUpperCase(),
                  //   //  onTextFieldTap: () => _selectDate(context),
                  //   onTextFieldChange: () => _toggle(),
                  //   customTextFieldController: widget._controller1,
                  // ),
                  Form(
                    key: _formKey,
                    child: CustomTextField(
                      labelName: "Email",
                      validator: (val) => val.isEmpty ? "Enter an email" : null,
                      onTextFieldChange: (val) {
                        setState(() {
                          _isValid = (widget._controller1.text.isNotEmpty);
                          return email = val;
                        });
                      },
                      customTextFieldController: widget._controller1,
                    ),
                  ),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: RoundedButton(
                  title: 'Continue',
                  onButtonClick: () async {
                    if (_formKey.currentState.validate()) {}
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
