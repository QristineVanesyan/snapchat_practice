import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key key,
      this.labelName,
      this.icon,
      this.onTextFieldChange,
      this.onTextFieldTap,
      this.validator,
      this.txtType,
      this.isVisible,
      this.customTextFieldController})
      : super(key: key);

  final String labelName;
  final Icon icon;
  final Function onTextFieldChange;
  final Function onTextFieldTap;
  final Function validator;
  final bool isVisible;
  final TextInputType txtType;
  final TextEditingController customTextFieldController;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextFormField(
          validator: widget.validator,
          keyboardType: widget.txtType,
          obscureText: _obscureOfPassword(),
          controller: widget.customTextFieldController,
          decoration: InputDecoration(
              labelText: widget.labelName.toUpperCase(),
              labelStyle: TextStyle(
                  fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w500),
              suffixIcon: _showAndHideWidget()),
          onChanged: (text) => widget.onTextFieldChange(),
          onTap: () => widget.onTextFieldTap(),
        ),
      ),
    ]);
  }

  bool _obscureOfPassword() {
    if (widget.isVisible == null) {
      return false;
    } else if (widget.isVisible) {
      return !_obscureText;
    } else {
      return _obscureText;
    }
  }

  Widget _showAndHideWidget() {
    if (widget.isVisible == null)
      return Text("");
    else if (widget.isVisible == true)
      return TextButton(
          onPressed: _toggle, child: new Text(_obscureText ? "Hide" : "Show"));
    else
      return GestureDetector(
        child: (_obscureText) ? Icon(Icons.visibility_outlined) : widget.icon,
        onTap: _toggle,
      );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
