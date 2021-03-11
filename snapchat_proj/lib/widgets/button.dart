import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final String title;
  final Widget toPage;
  const Button({this.color, this.title, this.toPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigate(context),
      child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 5),
          )),
    );
  }

  Future<void> _navigate(BuildContext context) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => toPage));
  }
}
