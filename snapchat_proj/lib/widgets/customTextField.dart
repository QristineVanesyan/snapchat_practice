import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelName;
  final Icon icon;
  final Function onTextFieldChange;
  final Function onTextFieldTap;
  final Function validator;
  final TextInputType txtType;
  bool hideInputedText;

  TextEditingController customTextFieldController;

  CustomTextField(
      {Key key,
      this.labelName,
      this.icon,
      this.hideInputedText = false,
      this.onTextFieldChange,
      this.onTextFieldTap,
      this.validator,
      this.txtType,
      this.customTextFieldController})
      : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<CustomTextField> {
  bool _isVisible = true;
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        validator: widget.validator,
        keyboardType: widget.txtType,
        obscureText: (widget.hideInputedText) ? _isVisible : false,
        controller: widget.customTextFieldController,
        decoration: InputDecoration(
          labelText: widget.labelName.toUpperCase(),
          labelStyle: TextStyle(
              fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w500),
          suffixIcon: widget.icon != null
              ? GestureDetector(
                  child: (_isVisible == false)
                      ? Icon(Icons.visibility_outlined)
                      : widget.icon,
                  onTap: _togglePasswordView,
                )
              : null,
        ),
        onChanged: (text) => widget.onTextFieldChange(),
        onTap: () => widget.onTextFieldTap(),
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
      _isVisible = !_isVisible;
    });
  }
}
