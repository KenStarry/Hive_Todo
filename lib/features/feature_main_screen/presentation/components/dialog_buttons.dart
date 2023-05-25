import 'package:flutter/material.dart';

class DialogButtons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  DialogButtons({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: text == "Save" ? Colors.deepOrange.shade200 : Colors.transparent,
      child: Text(text),
      elevation: 0,
    );
  }
}
