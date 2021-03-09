import 'package:flutter/material.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class Password extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool _isValid = false;

  void _toggle() {
    setState(() {
      _isValid = widget._controller1.text.isNotEmpty;
    });
  }

  String validatePassword(String value) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "email is not valid";
    } else
      return null;
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
                  'Set a password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Your password should be at last 8 characters.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                // CustomTextField(
                //   labelName: 'password'.toString(),
                //   customTextFieldController: widget._controller1,
                //   hideInputedText: true,
                //   onTextFieldChange: () => _toggle(),
                // ),

                CustomTextField(
                  flatButtonShow: true,
                  labelName: 'password',
                  isVisible: false,
                  hideInputedText: true,
                  onTextFieldChange: () => {_toggle()},
                  customTextFieldController: widget._controller1,
                  validator: validatePassword,
                  // onTextFieldChange: (val) {
                  //   setState(() {
                  //     _toggle();
                  //     return password = val;
                  //   });
                  // },
                  //icon: Icon(Icons.visibility_off_outlined),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: RoundedButton(
                title: 'Continue',
                //onButtonClick: () => /*Navigator.push(context,
                // MaterialPageRoute(builder: (context) => Username())),*/
                color: (_isValid)
                    ? const Color(0xFF02a9f4)
                    : const Color(0xFFbcbcbc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
