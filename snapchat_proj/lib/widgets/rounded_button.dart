import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({this.title, this.color, this.onButtonClick});

  final String title;
  final Color color;
  final Function onButtonClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onButtonClick()},
      child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: color),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          )),
    );
  }
}
