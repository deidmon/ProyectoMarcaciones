import 'package:flutter/material.dart';

class BtnMarcar extends StatelessWidget {
  const BtnMarcar({
    Key? key,
    required this.OnTap,
  }) : super(key: key);

  final void Function() OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        alignment: Alignment.center,
        width: 180.0,
        height: 40.0,
        margin: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 129, 22),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(137, 71, 70, 70),
                blurRadius: 5.0,
                offset: Offset(0, 3),
                spreadRadius: 0.0,
              ),
            ]),
        child: const Text(
          'Marcar',
          style: TextStyle(
              fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
