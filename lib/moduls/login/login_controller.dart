import 'package:chat/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

final nameController = TextEditingController();

 void signIn() {
  var username= nameController.text;
    UserService.to.setUsernameAndConnect(username);
  }
}