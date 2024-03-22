import 'package:chat/models/socket_event.dart';
import 'package:chat/moduls/chat/chat_controller.dart';
import 'package:chat/moduls/chat/widgets/bubble_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.disconnect();
                controller.clear();
              },
              icon: const Icon(Icons.exit_to_app),
              iconSize: 45,
              color: const Color.fromARGB(255, 246, 244, 246),
            )
          ],
          title: const Text('Групповой чат',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        body: Column(children: [
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.messages.length,
                  controller: controller.scrollController,
                  itemBuilder: ((context, index) {
                    var message = controller.messages[index];
                    var itsMe = controller.itsMe(message.clientId);

                    switch (message.type) {
                      case SocketEvent.login:
                        return Center(
                            child: Text("${message.username} вошел в чат!"));
                      case SocketEvent.logout:
                        return Center(
                            child: Text("${message.username} вышел из чата!"));
                      case SocketEvent.newMessage:
                        return BubbleMessage(message: message, itsMe: itsMe);
                      default:
                        return const SizedBox();
                    }
                  })))),
          const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: controller.textController1,
              onEditingComplete: controller.sendMessage,
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.send),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ]));
  }
}
