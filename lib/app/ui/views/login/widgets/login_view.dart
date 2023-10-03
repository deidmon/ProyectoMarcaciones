import 'package:app_marcaciones/app/ui/components/buttons/btn_marcar.dart';
import 'package:app_marcaciones/app/ui/components/templates/ctm_input_field.dart';
import 'package:app_marcaciones/app/ui/views/login/widgets/login_controller.dart';
import 'package:app_marcaciones/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller) => Scaffold(
              body: Stack(children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    // boxShadow:
                    //color: Color.fromARGB(255, 255, 139, 7)
                    image: DecorationImage(
                      image: AssetImage("assets/reunion.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: textos("Valtx", 40.0, Colors.white, TextAlign.center),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.63,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                      child: Column(children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30),
                              textos(
                                  "Sistema de asistencia",
                                  26.0,
                                  Color.fromARGB(255, 1, 2, 96),
                                  TextAlign.center),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomInputField(
                                label: "Nro. documento",
                                //onChanged: controller.onEmailChanged,
                                inputType: TextInputType.emailAddress,
                                validator: (text) {
                                  if (isValidEmail(text!)) {
                                    return null;
                                  }
                                  return "Email inválido";
                                },
                                onChanged: (value) {
                                  controller.username = value;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomInputField(
                                label: "Contraseña",
                                //onChanged: controller.onPasswordChanged,
                                isPassword: true,
                                validator: (text) {
                                  if (text!.trim().length >= 6) {
                                    return null;
                                  }
                                  return "Constraseña inválida";
                                },
                                onChanged: (value) {
                                  controller.password = value;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ]),
                        /* ElevatedButton(
                          onPressed: controller.doAuth,
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(241, 247, 103, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              minimumSize: const Size(200, 50)),
                          child: const Text('Ingresar',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 253, 253))),
                        ), */
                        /* GestureDetector(
                          onTap: controller.doAuth,
                          child: Container(
                            alignment: Alignment.center,
                            width: 100.0,
                            height: 50.0,
                            //margin: const EdgeInsets.all(20.0),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(241, 247, 103, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(241, 247, 103, 1),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3),
                                    spreadRadius: 0.0,
                                  ),
                                ]),
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ), */
                        BtnMarcar(
                            OnTap: controller.doAuth,
                            title: 'Iniciar sesión',
                            color: const Color.fromARGB(241, 247, 103, 1),
                            sombra: const Color.fromARGB(241, 247, 103, 1))
                      ])
                      /* ListView(
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 30),
                                textos(
                                    "Sistema de asistencia",
                                    26.0,
                                    Color.fromARGB(255, 1, 2, 96),
                                    TextAlign.center),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomInputField(
                                  label: "Nro. documento",
                                  //onChanged: controller.onEmailChanged,
                                  inputType: TextInputType.emailAddress,
                                  validator: (text) {
                                    if (isValidEmail(text!)) {
                                      return null;
                                    }
                                    return "Email inválido";
                                  },
                                  onChanged: (value) {
                                    controller.username = value;
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomInputField(
                                  label: "Contraseña",
                                  //onChanged: controller.onPasswordChanged,
                                  isPassword: true,
                                  validator: (text) {
                                    if (text!.trim().length >= 6) {
                                      return null;
                                    }
                                    return "Constraseña inválida";
                                  },
                                  onChanged: (value) {
                                    controller.password = value;
                                  },
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ]),
                          /* ElevatedButton(
                            onPressed: controller.doAuth,
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(241, 247, 103, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                minimumSize: const Size(200, 50)),
                            child: const Text('Ingresar',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 253, 253))),
                          ), */
                          /* GestureDetector(
                            onTap: controller.doAuth,
                            child: Container(
                              alignment: Alignment.center,
                              width: 100.0,
                              height: 50.0,
                              //margin: const EdgeInsets.all(20.0),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(241, 247, 103, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(241, 247, 103, 1),
                                      blurRadius: 5.0,
                                      offset: Offset(0, 3),
                                      spreadRadius: 0.0,
                                    ),
                                  ]),
                              child: const Text(
                                'Iniciar sesión',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    decoration: TextDecoration.none),
                              ),
                            ),
                          ), */
                          BtnMarcar(
                              OnTap: controller.doAuth,
                              title: 'Iniciar sesión',
                              color: const Color.fromARGB(241, 247, 103, 1),
                              sombra: const Color.fromARGB(241, 247, 103, 1)),
                        ]), */

                      ),
                )
              ]),
            ));
  }
}

Widget textos(
    String texto, double tamano, Color colores, TextAlign alineacion) {
  return Text(
    texto,
    textAlign: alineacion,
    style: TextStyle(
      fontSize: tamano,
      color: colores,
      fontWeight: FontWeight.w900,
      //fontStyle: FontStyle.normal
    ),
  );
}
