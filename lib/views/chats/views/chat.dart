// ignore_for_file: use_key_in_widget_constructors, prefer_final_fields, deprecated_member_use, avoid_print, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../api_call/fcm_api.dart';
import '../../../../enums/message_status.dart';
import '../../../../models/user.dart';
import '../../../contstant/colors.dart';
import '../../../enums/calling_status.dart';
import '../../../utiles/kyes.dart';
import '../../../utiles/videosdk_utils/api.dart';
import '../../../utiles/videosdk_utils/toast.dart';
import '../../calling/scaffold.dart';
import '../../meeting_schedule/meetings.dart';
import '../models/chat_message.dart';
import '../services/database.dart';
import '../widget/block_user.dart';
import '../widget/message_bar.dart';
import '../widget/message_tile.dart';
import '../widget/un_block_user.dart';

class Chat extends StatefulWidget {
  final String chatRoomId;
  final UserModel reciever;
  final String adid;
  final UserModel currentUser;
  bool isBlookByMe;
  Chat({
    required this.isBlookByMe,
    required this.currentUser,
    required this.chatRoomId,
    required this.reciever,
    required this.adid,
  });

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  Stream<QuerySnapshot>? chats;
  TextEditingController messageEditingController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool load = false;
  DateTime selectedDate = DateTime.now();

  bool allowReview = false;
  var sacrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    DatabaseMethods().updateMessageStatus(widget.chatRoomId);
    DatabaseMethods().updateseenMessages(widget.chatRoomId);
    DatabaseMethods().getChats(widget.chatRoomId).then((val) {
      setState(() {
        chats = val;
      });
    });
  }

  Widget chatMessages() {
    return StreamBuilder<QuerySnapshot>(
      stream: chats,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //_scrollController.jumpTo(_scrollController.position.maxScrollExtent);

          return Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: ListView.builder(
                //controller: _scrollController,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot<Map> documnet =
                      snapshot.data!.docs[index]
                          as QueryDocumentSnapshot<Map<dynamic, dynamic>>;
                  var chatMessageObj = ChatMessage.fromMap(
                      snapshot.data!.docs[index].data()
                          as Map<String, dynamic>);
                  var isSameSender = false;
                  if (index != 0) {
                    var previousChatMessageObj = ChatMessage.fromMap(
                        snapshot.data!.docs[index - 1].data()
                            as Map<String, dynamic>);
                    if (previousChatMessageObj.sendBy ==
                        chatMessageObj.sendBy) {
                      isSameSender = true;
                    }
                  }
                  try {
                    // MessageTile
                    return GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Alert'.tr()),
                            content:
                                Text('Do you want to delete this message'.tr()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('No'.tr())),
                              TextButton(
                                  onPressed: () {
                                    documnet.reference.delete();
                                    Get.back();
                                  },
                                  child: Text('Yes'.tr())),
                            ],
                          ),
                        );
                      },
                      child: MessageTile(
                          isSameSender: isSameSender,
                          chatMessageObj: chatMessageObj,
                          message: documnet.get('message'),
                          sendByMe:
                              widget.reciever.uid == documnet.get('sendBy'),
                          messagetype: documnet.get('type') ?? "text",
                          name: widget.reciever.fullName,
                          messageInfo: documnet.data(),
                          messageId: documnet.id,
                          chatroomId: widget.chatRoomId,
                          currentUser: widget.currentUser,
                          reciver: widget.reciever,
                          time: DateTime.fromMillisecondsSinceEpoch(
                              documnet.get('time'))),
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                  return const SizedBox();
                }),
          );
        }
        return const Center();
      },
    );
  }

  addMessage(String type) {
    sacrollController.animateTo(sacrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 100), curve: Curves.bounceIn);
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = ChatMessage(
              messageStatus: MessageStatus.sent,
              sendBy: widget.reciever.uid,
              message: messageEditingController.text,
              time: DateTime.now().millisecondsSinceEpoch,
              type: type)
          .toMap();
      DatabaseMethods().addMessage(widget.chatRoomId, chatMessageMap,
          widget.currentUser, widget.reciever);
      DatabaseMethods().unseenMessages(widget.chatRoomId, widget.reciever.uid);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  addmediaMessage(String type, String url) {
    Map<String, dynamic> chatMessageMap = ChatMessage(
            messageStatus: MessageStatus.sent,
            sendBy: widget.reciever.uid,
            message: url,
            time: DateTime.now().millisecondsSinceEpoch,
            type: type)
        .toMap();

    sacrollController.animateTo(sacrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 100), curve: Curves.bounceIn);
    DatabaseMethods().addMessage(
        widget.chatRoomId, chatMessageMap, widget.currentUser, widget.reciever);
    DatabaseMethods()
        .unseenMessages(widget.chatRoomId, widget.reciever.fullName);
  }

  unBlockUser(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => UnBlockUser(
              chatRoomId: widget.chatRoomId,
              userName: widget.reciever.fullName.toString().capitalize!,
            ));
    Get.back();
  }

  blockUser(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => BlockUser(
              chatRoomId: widget.chatRoomId,
              userName: widget.reciever.fullName.toString().capitalize!,
            ));
    Get.back();
  }

  Future<void> makeCall(fcmToken) async {
    try {
      var token = await fetchToken();
      var meetingID = await createMeeting(token);

      var firestoreCalling =
          FirebaseFirestore.instance.collection('calling').doc();
      firestoreCalling.set({'callingStatus': CallingStatus.calling.name});
      var data = {
        'isCalling': true,
        mettingIdKey: meetingID,
        displayNameKey: widget.currentUser.fullName,
        callinIdKey: firestoreCalling.id,
        profileUrlKey: widget.currentUser.imageUrl,
        emailKey: widget.currentUser.email
      };
      makeCallNotificationCall(fcmToken, 'Alert!', 'calling', data: data);
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OneToOneMeetingScreen(
              callingId: firestoreCalling.id,
              isCaller: true,
              token: token,
              meetingId: meetingID,
              displayName: widget.currentUser.fullName,
              micEnabled: true,
              camEnabled: false,
            ),
          ),
        );
      }
    } catch (error) {
      showSnackBarMessage(message: error.toString(), context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            )),
        title: Text(
          widget.reciever.fullName.capitalize!,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                makeCall(widget.reciever.messagingToken);
              },
              icon: const Icon(
                Icons.call,
                color: primaryColor,
              )),
          IconButton(
              onPressed: () async {
                Get.to(() => Meetings(
                      currentUser: widget.currentUser,
                      reciever: widget.reciever,
                      fromChat: true,
                    ));
              },
              icon: const Icon(
                Icons.meeting_room,
                color: primaryColor,
              )),
          if (!widget.isBlookByMe)
            IconButton(
                onPressed: () {
                  blockUser(context);
                  // widget.isBlookByMe = true;
                },
                icon: const Icon(
                  Icons.block,
                  color: primaryColor,
                ))
          else
            IconButton(
                onPressed: () {
                  unBlockUser(context);
                  // widget.isBlookByMe = false;
                },
                icon: const Icon(
                  Icons.lock_open,
                  color: primaryColor,
                )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: load,
        progressIndicator: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Stack(
          children: [
            //messages
            SizedBox(
              height: widget.isBlookByMe
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.height * 0.85,
              child: SingleChildScrollView(
                controller: sacrollController,
                child: Column(
                  children: [
                    chatMessages(),
                  ],
                ),
              ),
            ),
            //send messge bar

            if (!widget.isBlookByMe)
              Align(
                  alignment: Alignment.bottomCenter,
                  child: MessageBar(
                    sendButtonColor: primaryColor,
                    onSend: (value) {
                      messageEditingController.text = value;
                      addMessage('text');
                    },
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: InkWell(
                          child: const Icon(
                            Icons.camera_alt,
                            color: primaryColor,
                            size: 24,
                          ),
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                                    type: FileType.custom,
                                    allowCompression: true,
                                    allowMultiple: false,
                                    allowedExtensions: [
                                  'jpg',
                                  'png',
                                ]);
                            if (result != null) {
                              setState(() {
                                load = true;
                              });
                              String url = await DatabaseMethods.uploadFile(
                                  File(result.files[0].path!),
                                  widget.chatRoomId,
                                  result.names[0].toString());

                              addmediaMessage(
                                  result.files[0].extension.toString(), url);
                              setState(() {
                                load = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
