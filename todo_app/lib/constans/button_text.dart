import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  final String text;

  const CustomButtonText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
