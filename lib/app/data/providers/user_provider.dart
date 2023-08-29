import 'package:app_marcaciones/app/data/models/request/request_auth_model.dart';
import 'package:app_marcaciones/app/data/models/request/request_registry_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_auth_model.dart';
import 'package:dio/dio.dart';

import '../models/response/response_registry_model.dart';

class UserProvider {
  final _dio = Dio();

  //depende del método si es POST  o get
  Future<ResponseAuthModel> postAuth(RequestAuthModel requestAuth) async {
    final response = await _dio.post(
      'http://IP/login',
      data: requestAuth.toJson(),
    );

    return ResponseAuthModel.fromJson(response.data);
  }

  Future<ResponseRegistryModel> postRegistry(
      RequestRegistryModel requestRegistry) async {
    final response = await _dio.post(
      'http://IP/marcaciones',
      data: requestRegistry.toJson(),
    );

    return ResponseRegistryModel.fromJson(response.data);
  }
}
