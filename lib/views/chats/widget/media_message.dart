import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class MediaMessage extends StatelessWidget {
  const MediaMessage(
      {super.key,
      required this.sendByMe,
      required this.message,
      required this.time});
  final bool sendByMe;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sendByMe ? Alignment.topRight : Alignment.topLeft,
      child: CustomPaint(
        painter: SpecialChatBubbleTwo(
            color: sendByMe ? const Color(0xFFD9FDD2) : Colors.white,
            alignment: sendByMe ? Alignment.topRight : Alignment.topLeft,
            tail: sendByMe),
        child: Container(
          alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: message,
                fit: BoxFit.cover,
              ),
              Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(top: 5, right: 25, bottom: 5),
                  child: Text(
                    time,
                    style: const TextStyle(fontSize: 10),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
