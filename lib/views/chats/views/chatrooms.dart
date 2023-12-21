// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import '../../../../global_widgets/empty_space_widget.dart';
import '../../../../models/user.dart';
import '../../../controllers/general_controller.dart';
import '../widget/name_lastmessage_chat.dart';
import 'chat.dart';
import 'empty_chat.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late UserModel currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = Get.find<GeneralGetxController>().currentUserModel!;
  }

  deleteFullChat(DocumentReference chatDoc) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Alert'.tr()),
        content: Text('Do you want to delete this chat'.tr()),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('No'.tr())),
          TextButton(
              onPressed: () {
                chatDoc.delete();
                Get.back();
              },
              child: Text('Yes'.tr()))
        ],
      ),
    );
  }

  goToChatDetail(QueryDocumentSnapshot chatDoc) async {
    final reciverDoc = await Get.find<GeneralGetxController>()
        .getUserData(chatDoc['${currentUser.uid}_uid']);
    bool isBlockMe = (chatDoc.data()
            as Map)['${FirebaseAuth.instance.currentUser!.uid}_isBlock'] ??
        false;
    if (mounted) {
      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
          builder: (context) => Chat(
                isBlookByMe: isBlockMe,
                currentUser: currentUser,
                chatRoomId: chatDoc['chatRoomId'],
                reciever: reciverDoc,
                adid: chatDoc['adid'],
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const VerticalSpace25px(),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("chatRoom")
                      .where('users', arrayContains: currentUser.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var chatRoomDocs = snapshot.data!.docs;

                      if (chatRoomDocs.isEmpty) {
                        return const EmptyChat();
                      }
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 150,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: chatRoomDocs.length,
                            itemBuilder: (context, index) {
                              var chatDoc = chatRoomDocs[index];

                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: InkWell(
                                  onLongPress: () =>
                                      deleteFullChat(chatDoc.reference),
                                  onTap: () => goToChatDetail(chatDoc),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 90,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: NameLastChat(
                                                      chatDoc: chatDoc)),
                                            ],
                                          ),
                                          const Divider()
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
