import 'package:chat/models/chat_message/chat_message.dart';
import 'package:chat/models/socket_event.dart';
import 'package:chat/routes/pages.dart';
import 'package:chat/services/user_service.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService extends GetxService {
  static SocketService get to => Get.find();
  late Socket _socket;
  String get clientId => _socket.id ?? "";

  Future<SocketService> init() async {
    _socket = io(
      'https://masqed.ru',
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .disableReconnection()
          .setPath('/chat/socket.io')
          .build(),
    );
    _socket.onConnect((data) {
      printInfo(info: "Socket connected");
      sendLoginMessage();
      Get.offAndToNamed(Routes.HOME);
    });
    _socket.onDisconnect((data) {
      printInfo(info: "Disconnected");
      Get.offAndToNamed(Routes.LOGIN);
    });
    _socket.onConnectError((data) => printInfo(info: "Connection Error"));
    _socket.onAny((event, data) {
      var isKnown = SocketEvent.values.any((el) => el.name == event);
      if (!isKnown) return;
      data['type'] = event;
      var message = ChatMessage.fromJson(data);
      UserService.to.addMessageToList(message);
    });
    return this;
  }

  void connect() => _socket.connect();

  void disconnect() {
    sendLogoutMessage();
    _socket.disconnect();
  }

  void sendLoginMessage() {
    _socket.emit(SocketEvent.login.name, UserService.to.username);
  }

  void sendLogoutMessage() {
    _socket.emit(SocketEvent.logout.name);
  }

  void sendMessageToChat(String message) {
    _socket.emit(SocketEvent.newMessage.name, message);
  }
}
