import 'package:flutter/material.dart';

class OpcDay extends StatelessWidget {
  const OpcDay({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        Text(text)
      ],
    );
  }
}
