import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String title;
  final Function toPage;
  Button({this.color, this.title, this.toPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => toPage()));
      },
      child: Container(
          alignment: Alignment.center, //centered vertically child
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 5),
          )),
    );
  }
}
