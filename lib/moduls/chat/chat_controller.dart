import 'package:chat/models/chat_message/chat_message.dart';
import 'package:chat/services/socket_service.dart';
import 'package:chat/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final textController1 = TextEditingController();
  final scrollController = ScrollController();
  RxList<ChatMessage> get messages => UserService.to.messages;

  @override
  void onInit() {
    messages.listen((p0) async {
      var max = scrollController.position.maxScrollExtent;
      if (scrollController.offset + 100 >= max) {
        await Future.delayed(const Duration(milliseconds: 100));
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    super.onInit();
  }

  void sendMessage() {
    var message = textController1.text;
    SocketService.to.sendMessageToChat(message);
    textController1.text = '';
  }

  void disconnect() {
    SocketService.to.disconnect();
  }

  void clear() {
    UserService.to.clearMessage();
  }

  bool itsMe(String clientId) => clientId == SocketService.to.clientId;
}
