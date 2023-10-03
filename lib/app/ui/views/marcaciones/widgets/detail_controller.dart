import 'dart:convert';

import 'package:app_marcaciones/app/data/models/request/request_asistdia_model.dart';
import 'package:app_marcaciones/app/data/models/request/request_asistmes_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_asistdia_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_asistmes_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_auth_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_validacion_model.dart';
import 'package:app_marcaciones/app/data/repositories/user_repository.dart';
import 'package:app_marcaciones/app/services/local_storage_service.dart';
import 'package:app_marcaciones/core/utils/keys.dart';
import 'package:get/get.dart';


class DetailController extends GetxController {
  @override
  void onInit() {
    _initialize();
    _marcacionDelDia();
    //_marcacionDelMes();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  //variables
 
   var responseData = <Body>[].obs;
   var responseDataDia = <AsistDiaBody>[].obs;
   var responseDataMes = <AsistMesBody>[].obs;
   var userId = 1;
   var authToken= 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyYW5kb21EYXRhIjowLjcxOTc3NzQzODkzNjg4NzIsImV4cCI6MTY5NjM1MTU2NCwiaWF0IjoxNjk2MzQ3OTY0fQ.ep1yL-TmMsMo2ydZWf8MbreJvP8-gDkEp1lDVBQGHq8';
   
  //Instances
  final _userRepository = UserRepository();
  //Funciones
  Future<void> _initialize() async {
    try {
      final response = await _userRepository.getTipoVal();
      responseData.assignAll(response.body);
       if (response.error == false) {
        responseData.assignAll(response.body); // Actualizamos la lista reactiva
      } else {
        // Maneja errores si es necesario
      }
      // Procesa la respuesta y actualiza el estado según sea necesario
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir durante la petición
    }
  }
  // Future<void> _marcacionDelMes() async {
  //   try {
  //     final response = await _userRepository.getAsistMes(RequestAsistMesModel(idUsuario: userId),authToken);
  //     responseDataMes.assignAll(response.asistMesBody);
  //      if (response.error == false) {
  //       responseDataMes.assignAll(response.asistMesBody); // Actualizamos la lista reactiva
  //     } else {
  //       // Maneja errores si es necesario
  //     }
  //     // Procesa la respuesta y actualiza el estado según sea necesario
  //   } catch (e) {
  //     // Maneja cualquier error que pueda ocurrir durante la petición
  //   }
  // }
  // void _optenerId() async {
  //   String value = await LocalStorageService.get(Keys.KeyUserAuth);
  //   final responseAuthModel = ResponseAuthModel.fromJson(json.decode(value));
  //   print("Usuario con id ${responseAuthModel.user?.id}");
  //   userId = responseAuthModel.user?.id ?? 0;
  //   print(userId);
  // }
  
  Future<void> _marcacionDelDia() async {
    try {
      final response = await _userRepository.getAsistDia(RequestAsistdiaModel(idUsuarios: userId), authToken);
      responseDataDia.assignAll(response.asistDiaBody);
       if (response.error == false) {
        responseDataDia.assignAll(response.asistDiaBody);// Actualizamos la lista reactiva
      } else {
        // Maneja errores si es necesario
      }
      // Procesa la respuesta y actualiza el estado según sea necesario
    } catch (error) {

    }
  }
}