import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../api_call/fcm_api.dart';
import '../../../../models/user.dart';
import '../../../controllers/general_controller.dart';
import '../../../contstant/firebsae_keys.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance
        .collection(userCollection)
        .add(userData)
        .catchError((e) {
      debugPrint(e.toString());
    });
  }

  getUserInfo(String email) async {
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .where("email", isEqualTo: email)
        .get()
        .catchError((e) {
      debugPrint(e.toString());
    });
  }

  searchByName(String searchField) async {
    return await FirebaseFirestore.instance
        .collection(userCollection)
        .where('name', isEqualTo: searchField)
        .get();
  }

  Future addChatRoom(Map<String, dynamic> chatRoom, String chatRoomId) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .get();
    if (doc.exists) {
    } else {
      await FirebaseFirestore.instance
          .collection("chatRoom")
          .doc(chatRoomId)
          .set(chatRoom)
          .catchError((e) {
        debugPrint(e);
      });
    }
  }

  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  Future addMessage(String chatRoomId, chatMessageData, UserModel currentUser,
      UserModel reciever) async {
    var messageId = FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .doc();
    await messageId.set(chatMessageData);
    messageNotificationCall(reciever.messagingToken, 'Alert!',
        '${currentUser.fullName} sends you an message', data: {
      ...chatMessageData,
      'chatRoomId': chatRoomId,
      'messageId': messageId.id
    });
    try {
      await FirebaseFirestore.instance
          .collection("chatRoom")
          .doc(chatRoomId)
          .update({"latestMessage": DateTime.now().millisecondsSinceEpoch});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future unseenMessages(String chatRoomId, String id) async {
    // final auth = FirebaseAuth.instance;
    try {
      await FirebaseFirestore.instance
          .collection("chatRoom")
          .doc(chatRoomId)
          .update({id: FieldValue.increment(1)});
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  updateMessageStatus(String chatRoomId) async {
    try {
      var docList = await FirebaseFirestore.instance
          .collection("chatRoom")
          .doc(chatRoomId)
          .collection('chats')
          .where('sendBy',
              isEqualTo:
                  Get.find<GeneralGetxController>().currentUserModel!.uid)
          .get();
      debugPrint("seen ${docList.docs.length}");

      var a = docList.docs.map((e) {
        if (e.data()['messageStatus'] != 'seen') {
          debugPrint("seen message update");
          return e.reference.update({'messageStatus': 'seen'});
        }
      });
      print(a);
      debugPrint("seen  update");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future updateseenMessages(String chatRoomId) async {
    try {
      await FirebaseFirestore.instance
          .collection("chatRoom")
          .doc(chatRoomId)
          .update({Get.find<GeneralGetxController>().currentUserModel!.uid: 0});
      debugPrint("unseen called");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future uploadFile(File photo, String chat, String name) async {
    //final fileName = basename(photo.path);
    String url = "";

    try {
      Reference ref =
          FirebaseStorage.instance.ref("chats").child("$chat/$name");

      TaskSnapshot task = await ref.putFile(photo);

      url = await task.ref.getDownloadURL();

      return url;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
