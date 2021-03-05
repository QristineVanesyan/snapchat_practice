import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelName;
  final Icon icon;
  final Function onTextFieldChange;
  TextEditingController customTextFieldController;

  CustomTextField(
      {Key key,
      this.labelName,
      this.icon,
      this.onTextFieldChange,
      this.customTextFieldController})
      : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<CustomTextField> {
  bool _isHidden = true;
  bool _hideInputedText = false;
  //bool isValid = false;
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        obscureText: _hideInputedText,
        controller: widget.customTextFieldController,
        decoration: InputDecoration(
          labelText: widget.labelName.toUpperCase(),
          labelStyle: TextStyle(
              fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w500),
          suffixIcon: widget.icon != null
              ? GestureDetector(
                  child: (_isHidden == false)
                      ? widget.icon
                      : Icon(Icons.visibility_outlined),
                  onTap: _togglePasswordView,
                )
              : null,
        ),
        onChanged: 
        (text) =>widget.onTextFieldChange(),
        
      ),
    );
  }

  @override
  void dispose() {
    widget.customTextFieldController.dispose();
    super.dispose();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
      _hideInputedText = !_hideInputedText;
    });
  }
}
