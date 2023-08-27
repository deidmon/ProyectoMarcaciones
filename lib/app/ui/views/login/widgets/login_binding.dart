import 'package:app_marcaciones/app/ui/views/login/widgets/login_controller.dart';
import 'package:get/get.dart';

class LoginBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
