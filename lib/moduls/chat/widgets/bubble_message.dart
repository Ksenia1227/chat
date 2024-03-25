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
      child:Column(children: [Text(message.username,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20,fontWeight: FontWeight.bold,),),
       Container(
        width: 200,
           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
           padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: itsMe
                ? Color.fromARGB(255, 4, 144, 186)
                : Color.fromARGB(255, 211, 234, 245),
            borderRadius: BorderRadius.circular(10),
          ),
          child: 
          // Column(
            // children: [
              // Text(
                // message.username,
                // style: const TextStyle(color: Colors.white, fontSize: 14),
                
                
              // ),
              Text(
                message.message,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              
              // ),
            // ],
          )),]
    ));
  }
}
