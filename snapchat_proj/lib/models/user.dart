import 'package:flutter/material.dart';

class User {
  const User(
      {this.fname,
      this.lname,
      this.birtdate,
      @required this.username,
      this.email,
      @required this.phoneNumber,
      @required this.password});

  final String fname;
  final String lname;
  final DateTime birtdate;
  final String username;
  final String email;
  final String phoneNumber;
  final String password;
}
