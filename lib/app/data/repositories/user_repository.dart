import 'package:app_marcaciones/app/data/models/request/request_auth_model.dart';
import 'package:app_marcaciones/app/data/models/request/request_information_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_auth_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_information_model.dart';
import 'package:app_marcaciones/app/data/providers/user_provider.dart';
import 'package:get/get.dart';

import '../models/request/request_registry_model.dart';
import '../models/response/response_registry_model.dart';

class UserRepository {
  final _apiProvider = Get.find<UserProvider>();

  Future<ResponseAuthModel> postAuth(RequestAuthModel requestAuth) =>
      _apiProvider.postAuth(requestAuth);

  Future<ResponseRegistryModel> postRegistry(
          RequestRegistryModel requestRegistry) =>
      _apiProvider.postRegistry(requestRegistry);

  Future<ResponseInformationModel> getInformation(
          RequestInformationModel requestInformation, String token) =>
      _apiProvider.getInformation(requestInformation, token);
}
