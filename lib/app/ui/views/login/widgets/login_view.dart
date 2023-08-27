import 'package:app_marcaciones/app/routes/app_routes.dart';
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
              body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/inicio.png"),
                      fit: BoxFit.cover,
                    ),
                    /* gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromRGBO(201, 215, 243, 1.0),
                    Color.fromRGBO(10, 61, 138, 1.0),
                  ],
                ), */
                  ),
                  child: ListView(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.only(
                          top: 200.0, right: 40.0, left: 40.0),
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textos("Valtx", 40.0, Colors.white,
                                  TextAlign.center),
                              const SizedBox(
                                height: 20.0,
                              ),
                              textos("Ingresa a tu cuenta", 16.0, Colors.white,
                                  TextAlign.center),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomInputField(
                                label: "Email",
                                //onChanged: controller.onEmailChanged,
                                inputType: TextInputType.emailAddress,
                                validator: (text) {
                                  if (isValidEmail(text!)) {
                                    return null;
                                  }
                                  return "Email invalido";
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
                                  return "Constraseña invalida";
                                },
                                onChanged: (value) {
                                  controller.password = value;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ]),
                        ElevatedButton(
                          /* onPressed: () => Get.offNamed(AppRoutes.HOME), */
                          onPressed: controller.doAuth,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(10, 61, 138,
                                  0.3), // Cambia el color de fondo aquí
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              minimumSize: const Size(200, 50)),
                          child: const Text('Ingresar',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ])),
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
    ),
  );
}
