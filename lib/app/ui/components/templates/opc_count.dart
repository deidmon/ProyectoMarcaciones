import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpcCount extends StatelessWidget {
  const OpcCount({Key? key, required this.text, required this.cantidad})
      : super(key: key);
  final String cantidad;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$cantidad',
            style: const TextStyle(
                color: Color.fromARGB(255, 5, 0, 80),
                fontWeight: FontWeight.w900)),
        Text(text,
            style: const TextStyle(color: Color.fromARGB(255, 192, 192, 192))),
      ],
    );
  }
}
