import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/password.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';

class Username extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();

  @override
  _UsernameState createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  bool _isValid = false;

  void _toggle() {
    setState(() {
      _isValid = widget._controller1.text.isNotEmpty;
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
                  'Peek a username',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Text(
                    'Your username is how friends add you on Snapchat.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ),
                CustomTextField(
                  labelName: 'username'.toUpperCase(),
                  onTextFieldChange: () => _toggle(),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15),
              child: RoundedButton(
                title: 'Continue',
                onButtonClick: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Password())),
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
