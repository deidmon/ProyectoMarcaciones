import 'package:app_marcaciones/app/ui/components/buttons/btn_marcar.dart';
import 'package:flutter/material.dart';

class CtnMarcar extends StatelessWidget {
  const CtnMarcar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: MediaQuery.of(context).size.height * 0.19,
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 3, 48, 120).withOpacity(0.4),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 45.0,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 3, 48, 120),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Text(
              'Registra tu asistencia',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          ),
          BtnMarcar(),
        ],
      ),
    );
  }
}
