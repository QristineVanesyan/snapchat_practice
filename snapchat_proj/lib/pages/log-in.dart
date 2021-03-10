import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/link.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogIN extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  final String _emailfromDB = "test@mail.com";
  final String _passwordfromDB = "1111";
  @override
  _LogINState createState() => _LogINState();
}

class _LogINState extends State<LogIN> {
  bool _isValid = false;

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String msg = "";

  // String validateUsername(String value) {
  //   if (value.isEmpty) {
  //     _isValidPassword = false;
  //     return "* Required";
  //   } else if (value.length < 6) {
  //     _isValidPassword = false;
  //     return "Password should be atleast 6 characters";
  //   } else if (value.length > 15) {
  //     _isValidPassword = false;
  //     return "Password should not be greater than 15 characters";
  //   } else {
  //     _isValidPassword = true;
  //     return null;
  //   }
  // }

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
                    'Log In',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            labelName: 'username or email',
                            // validator: validateUsername,
                            //(val) =>
                            // val.isEmpty ? "Enter an email" : null,

                            // onTextFieldChange: (val) {
                            //   setState(() {
                            //     _toggle();
                            //     return email = val;
                            //   });
                            // },
                            onTextFieldChange: () => {_toggle()},
                            customTextFieldController: widget._controller1,
                          ),
                          CustomTextField(
                            labelName: 'password',
                            hideInputedText: true,
                            onTextFieldChange: () => {_toggle()},
                            customTextFieldController: widget._controller2,
                            //validator: validatePassword,
                            // onTextFieldChange: (val) {
                            //   setState(() {
                            //     _toggle();
                            //     return password = val;
                            //   });
                            // },
                            icon: Icon(Icons.visibility_off_outlined),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              msg,
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
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: RoundedButton(
                  title: 'Log In',
                  onButtonClick: () async {
                    setState(() {
                      //_isValid = widget._controller1.text.isNotEmpty &&
                      //    widget._controller2.text.isNotEmpty;

                      if (_isValid) {
                        if (widget._emailfromDB == widget._controller1.text &&
                            widget._passwordfromDB ==
                                widget._controller2.text) {
                          print("User log in to session");
                        } else {
                          msg =
                              "Oops! Your username/email or password is incorrect.";
                        }
                      }
                    });
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

  void _toggle() {
    setState(() {
      _isValid = widget._controller1.text.isNotEmpty &&
          widget._controller2.text.isNotEmpty;
    });
  }
}
