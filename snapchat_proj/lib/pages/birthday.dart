import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/userName.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

class Birthday extends StatefulWidget {
  @override
  _BirthdayState createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  TextEditingController _controller1 = TextEditingController();

  bool _isValid = false;
  DateTime _currentDate = DateTime.now();
  DateTime selectedDate = DateTime(DateTime.now().year);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(_currentDate.year - 110),
      lastDate: DateTime(_currentDate.year + 1),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _controller1.text = DateFormat.yMMMMd().format(selectedDate);
        _toggle();
      });
    print(_currentDate.year - 120);
  }

  int calculateAge(DateTime birthDate) {
    DateTime _currentDate = DateTime.now();
    int age = _currentDate.year - birthDate.year;
    int month1 = _currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = _currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  void _toggle() {
    setState(() {
      _isValid =
          (_controller1.text.isNotEmpty) && calculateAge(selectedDate) >= 18;
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
            children: [_renderBirthDay(), _renderContinue()],
          )),
    );
  }

  Widget _renderBirthDay() {
    return Column(
      children: [
        Text(
          "When'\s your birthday?",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        CustomTextField(
          labelName: 'birthday'.toUpperCase(),
          onTextFieldTap: () => _selectDate(context),
          onTextFieldChange: () => _toggle(),
          customTextFieldController: _controller1,
        ),
      ],
    );
  }

  Widget _renderContinue() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: RoundedButton(
        title: 'Continue',
        onButtonClick: () => {
          if (_isValid)
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Username())) //TODO GENERATE USERNAME
        },
        color: (_isValid) ? const Color(0xFF02a9f4) : const Color(0xFFbcbcbc),
      ),
    );
  }
}
