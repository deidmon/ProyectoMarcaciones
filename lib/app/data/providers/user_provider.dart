import 'package:app_marcaciones/app/data/models/request/request_auth_model.dart';
import 'package:app_marcaciones/app/data/models/response/response_auth_model.dart';
import 'package:dio/dio.dart';

class UserProvider {
  final _dio = Dio();

  //depende del método si es POST  o get
  Future<ResponseAuthModel> postAuth(RequestAuthModel requestAuth) async {
    final response = await _dio.post(
      'http://ip/login',
      data: requestAuth.toJson(),
      /* options: Options(
          validateStatus: (_) => true,
        ), */
    );

    return ResponseAuthModel.fromJson(response.data);
  }
}
