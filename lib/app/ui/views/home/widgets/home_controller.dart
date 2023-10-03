import 'dart:convert';
import 'package:app_marcaciones/app/data/models/request/request_information_model.dart';
import 'package:app_marcaciones/app/data/models/request/request_registry_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_auth_model.dart';
import 'package:app_marcaciones/app/data/repositories/user_repository.dart';
import 'package:app_marcaciones/app/services/local_storage_service.dart';
import 'package:app_marcaciones/core/utils/keys.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    _initialize();
    obtenerUbicacion();
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
  var myPosition2 = LatLng(-12.086733751659768, -76.99129060428967);
  //var myPosition = LatLng(0, 0);
  Rx<LatLng> myPosition =
      Rx<LatLng>(LatLng(-6.7638751891380995, -79.86384501573184));
  int userId = 0;
  String messageMarca = '';
  RxInt cantidadF = RxInt(0);
  RxInt cantidadT = RxInt(0);
  RxInt cantidadJ = RxInt(0);
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  double lat = 0.0;
  double long = 0.0;
  String username = '';
  String password = '';
  String token = '';
  /* int cantidadF = 0;
  int cantidadT = 0;
  int cantidadJ = 0;
  double latitude = 0.0;
  double longitude = 0.0; */
  Location location = Location();
  LocationData? locationData;
  //Functions
  void _initialize() async {
    String value = await LocalStorageService.get(Keys.KeyUserAuth);
    final responseAuthModel = ResponseAuthModel.fromJson(json.decode(value));
    print("Usuario con id ${responseAuthModel.body}");
    //userId = responseAuthModel.body?.id ?? 0;
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

  void obtenerUbicacion() async {
    try {
      LocationData userLocation = await location.getLocation();
      latitude.value = userLocation.latitude ?? 0.0;
      longitude.value = userLocation.longitude ?? 0.0;
      lat = latitude.value;
      long = longitude.value;

      /* latitude = userLocation.latitude ?? 0.0;
      longitude = userLocation.longitude ?? 0.0; */
      /* myPosition.value = LatLng(latitude.value, longitude.value); */
      /* myPosition = LatLng(latitude.value, longitude.value); */
      print('esta es la latitud------${latitude}');
      /* myPosition.value = LatLng(latitude.value, longitude.value); */
      myPosition.value = LatLng(lat, long);
      cantidadF += 1;
      update();
      print('mi posicion es: ${myPosition.value}');
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir al obtener la ubicación.
      print('Error al obtener la ubicación: $e');
    }
  }

  /* void obtenerInformacion() async {
    try {
      final response = await _userRepository.getInformation(
          RequestInformationModel(username: username, password: password),
          token);

      if (response.body == 'Asistencia marcada exitosamente') {
        //print(json.encode(response.toJson()));
        print('Mensaje: ${response.body}');
        messageMarca = response.body;
      } else {
        print('${response.body}');
      }
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir al obtener la ubicación.
      print('Error al obtener la ubicación: $e');
    }
  } */
}
