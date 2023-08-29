import 'package:flutter/material.dart';

class CtnControl extends StatelessWidget {
  const CtnControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.0,
      ),
      margin: const EdgeInsets.all(0),
      //width: 190,
      //alignment: Alignment.center,
      decoration: const BoxDecoration(
        //color: Colors.amber,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0,
            child: const Text(
              'CONTROL DE ASISTENCIAS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          item(color: Colors.green, title: 'Conforme'),
          item(color: Colors.yellow, title: 'Justificado'),
          item(color: Colors.orange, title: 'Tardanza'),
          item(color: Colors.red, title: 'Falta'),
          Align(
            //alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.all(0),
              //color: Colors.amberAccent,
              width: 100.0,
              height: 80,
              child: const Icon(
                Icons.person,
                size: 90.0,
                color: Colors.orangeAccent,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget item({
    required Color color,
    required String title,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 5.0,
          backgroundColor: color,
        ),
        const SizedBox(
          width: 15.0,
        ),
        Text(title,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white70,
            )),
      ],
    );
  }
}
