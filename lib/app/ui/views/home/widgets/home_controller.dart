import 'dart:convert';
import 'package:app_marcaciones/app/data/models/request/request_registry_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_auth_model.dart';
import 'package:app_marcaciones/app/data/repositories/user_repository.dart';
import 'package:app_marcaciones/app/services/local_storage_service.dart';
import 'package:app_marcaciones/core/utils/keys.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    _initialize();
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
  int userId = 0;
  String messageMarca = '';
  //Functions
  void _initialize() async {
    String value = await LocalStorageService.get(Keys.KeyUserAuth);
    final responseAuthModel = ResponseAuthModel.fromJson(json.decode(value));
    print("Usuario con id ${responseAuthModel.user?.id}");
    userId = responseAuthModel.user?.id ?? 0;
    print(userId);
  }

  void doRegistry() async {
    try {
      final response = await _userRepository
          .postRegistry(RequestRegistryModel(userId: userId));

      if (response.message == 'Asistencia marcada exitosamente') {
        //print(json.encode(response.toJson()));
        print('Mensaje: ${response.message}');
        messageMarca = response.message;
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
