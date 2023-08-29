import 'dart:convert';
import 'package:app_marcaciones/app/data/models/request/request_auth_model.dart';
import 'package:app_marcaciones/app/data/repositories/user_repository.dart';
import 'package:app_marcaciones/app/routes/app_routes.dart';
import 'package:app_marcaciones/app/services/local_storage_service.dart';
import 'package:app_marcaciones/core/utils/keys.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
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

  //Instances
  final _userRepository = Get.find<UserRepository>();

  //Variables
  String username = '';
  String password = '';
  //Functions
  void doAuth() async {
    try {
      final response = await _userRepository.postAuth(
        RequestAuthModel(
          username: username,
          password: password,
        ),
      );

      if (response.message == 'Inicio de sesión exitoso') {
        print(json.encode(response.toJson()));
        await LocalStorageService.set(
          key: Keys.KeyUserAuth,
          value: json.encode(response.toJson()),
        );
        Get.offNamed(AppRoutes.HOME);
        print('Bienvenido ${response.user?.username}');
      } else {
        print('${response.message}');
      }
    } catch (error) {
      if (error is DioException) {
        print('ERROR: ${error.response?.data['message']}');
      } else {
        print('Error de conexión');
      }
    }
  }
}
