import 'package:chat/models/chat_message/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BubbleMessage extends StatelessWidget {
  const BubbleMessage({super.key, required this.message, required this.itsMe});

  final ChatMessage message;
  final bool itsMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: itsMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: itsMe ? const Color.fromARGB(255, 172, 144, 177) : const Color.fromARGB(255, 141, 183, 217),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(message.username, style: const TextStyle(color: Colors.white, fontSize: 14),),
              Text(message.message, style: const TextStyle(color: Colors.black, fontSize: 18),),
            ],
          )),
    );
  }
}
