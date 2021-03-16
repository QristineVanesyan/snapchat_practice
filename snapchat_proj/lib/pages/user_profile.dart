import 'package:snapchat_proj/models/user_provider.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  UserObj user;
  ProfilePage(this.user);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
          children: [
            _renderData(),
          ],
        ),
      ),
    );
  }

  Widget _renderData() {
    return Column(
      children: [
        const Text(
          "Your data",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Center(
          child: Text(
            widget.user.toString(),
            style: const TextStyle(
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }
}
