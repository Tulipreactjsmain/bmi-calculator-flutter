import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
    fontSize: 18.0, color: Color(0xff8d8e98), fontWeight: FontWeight.bold);

class IconContent extends StatelessWidget {
  IconContent({required this.text, required this.icon});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: labelTextStyle,
        )
      ],
    );
  }
}
