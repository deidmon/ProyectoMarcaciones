import 'package:app_marcaciones/app/data/models/request/request_asistdia_model.dart';
import 'package:app_marcaciones/app/data/models/request/request_asistmes_model.dart';
import 'package:app_marcaciones/app/data/models/request/request_auth_model.dart';
import 'package:app_marcaciones/app/data/models/request/request_information_model.dart';
import 'package:app_marcaciones/app/data/models/request/request_registry_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_asistdia_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_asistmes_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_auth_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_information_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_validacion_model.dart';
import 'package:dio/dio.dart';

import '../models/response/response_registry_model.dart';

class UserProvider {
  final _dio = Dio();

  //depende del método si es POST  o get
  Future<ResponseAuthModel> postAuth(RequestAuthModel requestAuth) async {
    final response = await _dio.post(
      'https://asistencias-c8aj.onrender.com/api/auth/login',
      data: requestAuth.toJson(),
    );

    return ResponseAuthModel.fromJson(response.data);
  }

  Future<ResponseRegistryModel> postRegistry(
      RequestRegistryModel requestRegistry) async {
    final response = await _dio.post(
      'https://asistencias-c8aj.onrender.com/api/auth/login',
      data: requestRegistry.toJson(),
      /* options: Options(headers:{
        'Authorization': 'Bearer $token'
      }) */
    );

    return ResponseRegistryModel.fromJson(response.data);
  }

  Future<ResponseInformationModel> getInformation(
      RequestInformationModel requestInformation, String token) async {
    final response = await _dio.get(
        'https://asistencias-c8aj.onrender.com/api/usuarios',
        data: requestInformation.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    return ResponseInformationModel.fromJson(response.data);
  }

   Future<ResponseValidacionModel> getTipoVal() async {
    try {
      final response = await _dio.get(
        'https://asistencias-c8aj.onrender.com/api/usuarios/TiposValidacion',
      );
      print('Respuesta: ${response.data}');
      return ResponseValidacionModel.fromJson(response.data);
    } catch (error) {
      print('Error en la solicitud GET: $error');
      throw error; // Puedes manejar el error de la manera que desees aquí
    }
  }
  
  Future<ResponseAsistDia> getAsistDia(RequestAsistdiaModel requestAsistDia, String authToken) async {
    try {
      final response = await _dio.get(
        'https://asistencias-c8aj.onrender.com/api/usuarios/marcacionDia',
         data: requestAsistDia.toJson(),
         options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
      ),
      );
      print('Respuesta: ${response.data}');
      return ResponseAsistDia.fromJson(response.data);
    } catch (error) {
      print('Error en la solicitud GET: $error');
      throw error; 
    }
  }
  Future<ResponseAsistMes> getAsistMes(RequestAsistMesModel requestAsistMes, String authToken) async {
    try {
      final response = await _dio.get(
        'https://asistencias-c8aj.onrender.com/api/usuarios/marcacion',
         data: requestAsistMes.toJson(),
         options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
      ),
      );
      print('Respuesta: ${response.data}');
      return ResponseAsistMes.fromJson(response.data);
    } catch (error) {
      print('Error en la solicitud GET: $error');
      throw error; 
    }
  }
}
