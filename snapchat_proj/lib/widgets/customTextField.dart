import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key key,
      this.labelName,
      this.icon,
      this.hideInputedText = false,
      this.onTextFieldChange,
      this.onTextFieldTap,
      this.validator,
      this.txtType,
      this.isVisible = true,
      this.flatButtonShow = false,
      this.customTextFieldController})
      : super(key: key);
  @override
  _State createState() => _State();

  final String labelName;
  final Icon icon;
  final Function onTextFieldChange;
  final Function onTextFieldTap;
  final Function validator;
  final TextInputType txtType;
  bool isVisible;
  bool hideInputedText;
  bool flatButtonShow;
  final TextEditingController customTextFieldController;
}

class _State extends State<CustomTextField> {
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextFormField(
          validator: widget.validator,
          keyboardType: widget.txtType,
          obscureText: (widget.hideInputedText) ? widget.isVisible : false,
          controller: widget.customTextFieldController,
          decoration: InputDecoration(
              labelText: widget.labelName.toUpperCase(),
              labelStyle: TextStyle(
                  fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w500),
              suffixIcon: TextButton(
                onPressed: _togglePasswordView,
                child: (widget.flatButtonShow)
                    ? new Text(widget.isVisible ? "Show" : "Hide")
                    : Text(""),
              )),
          onChanged: (text) => widget.onTextFieldChange(),
          onTap: () => widget.onTextFieldTap(),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    widget.customTextFieldController.dispose();
    super.dispose();
  }

  void _togglePasswordView() {
    setState(() {
      widget.isVisible = !widget.isVisible;
    });
  }
}
