import 'package:flutter/material.dart';

import '../../../../enums/message_status.dart';
import '../../../../models/user.dart';
import '../models/chat_message.dart';
import 'chat_bubble.dart';
import 'media_message.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final bool sendByMe;
  final String messagetype;
  final String name;
  final messageInfo;
  final String messageId;
  final String chatroomId;
  final UserModel currentUser;
  final UserModel reciver;
  final DateTime time;

  final ChatMessage chatMessageObj;
  final bool isSameSender;

  const MessageTile(
      {super.key,
      required this.isSameSender,
      required this.message,
      required this.chatMessageObj,
      required this.sendByMe,
      required this.messagetype,
      required this.name,
      required this.messageInfo,
      required this.messageId,
      required this.chatroomId,
      required this.currentUser,
      required this.reciver,
      required this.time});

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: widget.messagetype == 'jpg' || widget.messagetype == 'png'
            ? () {}
            : null,
        child: Container(
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.only(top: 2, bottom: 2),
            child: widget.messagetype == 'jpg' || widget.messagetype == 'png'
                ? MediaMessage(
                    time: '${widget.time.hour}:${widget.time.minute}',
                    sendByMe: widget.sendByMe,
                    message: widget.message)
                : BubbleSpecialTwo(
                    text: widget.message,
                    color: widget.sendByMe
                        ? const Color(0xFFD9FDD2)
                        : Colors.white,
                    tail: !widget.isSameSender,
                    sent: widget.sendByMe
                        ? widget.chatMessageObj.messageStatus ==
                            MessageStatus.sent
                        : false,
                    delivered: widget.sendByMe
                        ? widget.chatMessageObj.messageStatus ==
                            MessageStatus.deliver
                        : false,
                    seen: widget.sendByMe
                        ? widget.chatMessageObj.messageStatus ==
                            MessageStatus.seen
                        : false,
                    time: '${widget.time.hour}:${widget.time.minute}',
                    isSender: widget.sendByMe,
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 16),
                  )),
      ),
    );
  }
}
