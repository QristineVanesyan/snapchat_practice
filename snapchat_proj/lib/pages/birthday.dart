import 'package:flutter/material.dart';
import 'package:snapchat_proj/pages/userName.dart';
import 'package:snapchat_proj/widgets/customTextField.dart';
import 'package:snapchat_proj/widgets/roundedButton.dart';
import 'package:intl/intl.dart';

class Birthday extends StatefulWidget {
  @override
  _BirthdayState createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  TextEditingController _birthdayTextFieldController = TextEditingController();

  bool _isValid = false;
  DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime(DateTime.now().year);

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
          children: [_renderBirthDay(), _renderContinue()],
        ),
      ),
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
          customTextFieldController: _birthdayTextFieldController,
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
                builder: (context) => Username(),
              ),
            ), // GENERATE USERNAME
        },
        color: (_isValid) ? const Color(0xFF02a9f4) : const Color(0xFFbcbcbc),
      ),
    );
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(_currentDate.year - 110),
      lastDate: DateTime(_currentDate.year + 1),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _birthdayTextFieldController.text =
            DateFormat.yMMMMd().format(_selectedDate);
        _toggle();
      });
    print(_currentDate.year - 120);
  }

  void _toggle() {
    setState(() {
      _isValid = (_birthdayTextFieldController.text.isNotEmpty) &&
          calculateAge(_selectedDate) >= 18;
    });
  }
}
