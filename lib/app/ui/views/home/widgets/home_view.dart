import 'package:app_marcaciones/app/ui/components/alerts/alt_marcar.dart';
import 'package:app_marcaciones/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_marcaciones/app/ui/components/templates/ctn_calendar.dart';
import 'package:app_marcaciones/app/ui/components/templates/ctn_marcar.dart';
import 'package:app_marcaciones/app/ui/components/templates/opc_primary.dart';
import 'package:app_marcaciones/app/ui/views/home/widgets/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Scaffold(
              body: Container(
                height: double.infinity,
                //height: MediaQuery.of(context).size.height * 1,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/fondoinicial.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Valtx',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Color.fromARGB(255, 3, 48, 120),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 400.0,
                      //height: 100.0,
                      height: MediaQuery.of(context).size.height * 0.18,
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 3, 48, 120).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      child: const Row(
                        children: [
                          OpcPrimary(
                              icon: Icons.access_time,
                              title: 'Cambio de turno'),
                          OpcPrimary(
                              icon: Icons.check_circle_outline,
                              title: 'Justificar Inasistencias'),
                        ],
                      ),
                    ),
                    CtnCalendar(),
                    CtnMarcar(
                      buttonWidget: BtnMarcar(
                        OnTap: () {
                          controller.doRegistry();
                          _showAlertDialog(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AltMarcar());
  }
}
