import 'package:app_marcaciones/app/data/models/request/request_auth_model.dart';
import 'package:app_marcaciones/app/data/repositories/user_repository.dart';
import 'package:app_marcaciones/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
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
