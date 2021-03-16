import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:snapchat_proj/models/user_provider.dart';
import 'package:snapchat_proj/pages/user_name.dart';
import 'package:snapchat_proj/widgets/custom_textfield.dart';
import 'package:snapchat_proj/widgets/rounded_button.dart';

class Birthday extends StatefulWidget {
  UserObj user;
  Birthday(this.user);

  @override
  _BirthdayState createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  final TextEditingController _birthdayTextFieldController =
      TextEditingController();

  bool _isValid = false;

  final DateTime _currentDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //context.read<UserObj>().firstName = _birthdayTextFieldController.text;

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
          children: [_renderBirthDay(), _renderContinue()],
        ),
      ),
    );
  }

  Widget _renderBirthDay() {
    return Column(
      children: [
        const Text(
          "When's your birthday?",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        CustomTextField(
          labelName: 'birthday'.toUpperCase(),
          isTapable: true,
          onTextFieldTap: () {
            _selectDate(context);
          },
          onTextFieldChange: () {
            _toggle();
          },
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
        onButtonClick: () {
          if (!_isValid) return;
          setData();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Username(widget.user),
            ),
          ); //TODO GENERATE USERNAME
        },
        color: _changeColor(),
      ),
    );
  }

  void setData() {
    widget.user.birthdate = _selectedDate;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(_currentDate.year - 110),
      lastDate: DateTime(_currentDate.year + 1),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdayTextFieldController.text =
            DateFormat.yMMMMd().format(_selectedDate);
        _toggle();
      });
    }
  }

  void _toggle() {
    setState(() {
      _isValid = (_birthdayTextFieldController.text.isNotEmpty) &&
          DateTimeCalculator._getAge(_selectedDate) >= 16;
    });
  }

  Color _changeColor() {
    if (_isValid) {
      return const Color(0xFF02a9f4);
    } else {
      return const Color(0xFFbcbcbc);
    }
  }
}

extension DateTimeCalculator on DateTime {
  static int _getAge(DateTime birthDate) {
    final DateTime _currentDate = DateTime.now();
    int age = _currentDate.year - birthDate.year;
    final int month1 = _currentDate.month;
    final int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      final int day1 = _currentDate.day;
      final int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
}
