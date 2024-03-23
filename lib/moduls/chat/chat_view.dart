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
          backgroundColor: Color.fromARGB(255, 211, 234, 245),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.disconnect();
                controller.clear();
              },
              icon: const Icon(Icons.exit_to_app),
              iconSize: 45,
              color: Color.fromARGB(255, 0, 0, 0),
            )
          ],
          title: const Text('Групповой чат',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        body: Stack(children: [
          Image(
            image: const AssetImage(
              'images/image.png',
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Column(children: [
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: controller.messages.length,
                    controller: controller.scrollController,
                    itemBuilder: ((context, index) {
                      var message = controller.messages[index];
                      var itsMe = controller.itsMe(message.clientId);

                      switch (message.type) {
                        case SocketEvent.login:
                          return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                "${message.username} присоединился к чату",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )));
                        // return Center(
                        //     child: Text(
                        //   "${message.username} присоединился к чату",
                        //   style: const TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        // ));
                        case SocketEvent.logout:
                          return Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                "${message.username} покинул чат",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )));
                        // return Center(
                        //     child: Text("${message.username} покинул чат",
                        //         style: const TextStyle(
                        //             fontSize: 40,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white)));
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
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        controller.sendMessage();
                      }),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ])
        ]));
  }
}
