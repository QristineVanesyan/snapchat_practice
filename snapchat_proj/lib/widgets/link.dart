import 'package:flutter/material.dart';

class Link extends StatefulWidget {
  const Link({this.title});
  final String title;
  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        widget.title,
        style: const TextStyle(
          fontSize: 11,
          color: Colors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
