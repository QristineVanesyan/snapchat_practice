import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:snapchat_proj/models/user.dart';

class UserProvider {
  // http://jsonplaceholder.typicode.com/users

  Future<List<User>> getUser() async {
    final response =
        await http.get('http://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      // print(response.body.toString());
      //final List<dynamic> userJson = json.decode(response.body);
      // return ["ewrew","werwer","werwerwerew"]//userJson.map((json) => User.fromJson(json)).toList();
      return null;
    } else {
      throw Exception('Error fetching users');
    }
  }
}
