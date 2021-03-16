import 'package:flutter/material.dart';

class UserObj with ChangeNotifier {
  UserObj(
      {this.id,
      this.firstName,
      this.lastName,
      this.birthdate,
      this.username,
      this.email,
      this.password,
      this.phone});

  int id;
  String firstName;
  String lastName;
  DateTime birthdate;
  String username;
  String email;
  String password;
  String phone;

  @override
  String toString() {
    return "User firstname: $firstName, lastname: $lastName, lastname: $birthdate, username: $username, email: $email, password: $password, phone: $phone";
  }
}
