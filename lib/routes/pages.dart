import 'package:chat/moduls/chat/binding.dart';
import 'package:chat/moduls/chat/chat_view.dart';
import 'package:chat/moduls/login/binding.dart';
import 'package:chat/moduls/login/login_view.dart';
import 'package:get/get.dart';
part 'routes.dart';

abstract class AppPages {

  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    )
  ];
}
