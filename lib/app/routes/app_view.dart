import 'package:app_marcaciones/app/routes/app_routes.dart';
import 'package:app_marcaciones/app/ui/views/home/widgets/home_binding.dart';
import 'package:app_marcaciones/app/ui/views/home/widgets/home_view.dart';
import 'package:app_marcaciones/app/ui/views/login/widgets/login_binding.dart';
import 'package:app_marcaciones/app/ui/views/login/widgets/login_view.dart';
import 'package:app_marcaciones/app/ui/views/marcaciones/widgets/detail_binding.dart';
import 'package:app_marcaciones/app/ui/views/marcaciones/widgets/detail_view.dart';
import 'package:get/get.dart';

class AppViews {
  static final views = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBiding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
