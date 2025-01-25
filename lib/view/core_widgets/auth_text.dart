import 'package:flutter/material.dart';

class AuthText extends StatelessWidget {
  final String text;
  final Color textColor;
  final double size;
  final TextAlign? align ;
  const AuthText({super.key, required this.text, required this.textColor, required this.size, this.align = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(

      text,

      style: TextStyle(
          fontSize: size,
          color: textColor,
          fontFamily: "cairo",
          fontWeight: FontWeight.bold),
      textAlign: align,
    );
  }
}