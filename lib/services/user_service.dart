import 'package:chat/models/chat_message/chat_message.dart';
import 'package:chat/services/socket_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find<UserService>();

  String username = "";
  RxList<ChatMessage>messages = <ChatMessage>[].obs;

    Future<UserService> init() async {
    return this;
  }

  void setUsernameAndConnect(String user){
    username=user;
    SocketService.to.connect();
  }

  void addMessageToList(ChatMessage message) { 
    printInfo(info: "New Message $message");
    messages.add(message);}

   void clearMessage() {
    messages.clear();
  }
}
