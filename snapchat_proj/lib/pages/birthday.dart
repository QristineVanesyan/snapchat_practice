import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/userName.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Birthday extends StatefulWidget {
  TextEditingController _controller1 = TextEditingController();

  @override
  _BirthdayState createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  bool _isValid = false;
  DateTime selectedDate = DateTime.now();
  DateTime currentDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(currentDate.year - 110),
      lastDate: DateTime(currentDate.year + 1), //TODO now.year - 18
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        widget._controller1.text = DateFormat.yMd().format(selectedDate);
        _toggle();
      });
    print(currentDate.year - 120);
  }

  void _toggle() {
    setState(() {
      _isValid = (widget._controller1.text.isNotEmpty);
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
                    "When'\s your birthday?",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  CustomTextField(
                    labelName: 'birthday'.toUpperCase(),
                    onTextFieldTap: () => _selectDate(context),
                    onTextFieldChange: () => _toggle(),
                    customTextFieldController: widget._controller1,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: RoundedButton(
                  title: 'Continue',
                  onButtonClick: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Username())),
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
