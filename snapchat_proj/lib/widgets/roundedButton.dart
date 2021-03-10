import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.isActive, this.color, this.onButtonClick});

  final String title;
  final Color color;
  final Function onButtonClick;

  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onButtonClick()},
      child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.center, //centered vertically child
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: color),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          )),
    );
  }
}
