
import 'package:chat/routes/pages.dart';
import 'package:chat/services/socket_service.dart';
import 'package:chat/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void main() async {
  await initService();
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.LOGIN,
        getPages: AppPages.pages,
    )
  );
}

Future<void> initService()async{
await Get.putAsync(() => SocketService().init());
await Get.putAsync(() => UserService().init());
}