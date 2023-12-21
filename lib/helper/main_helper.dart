import 'package:klomi/controllers/adpost_controller.dart';
import 'package:klomi/controllers/authentication_controller.dart';
import 'package:klomi/controllers/general_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;

import '../contstant/colors.dart';
import '../enums/message_status.dart';
import '../firebase_options.dart';
import '../models/explore_model.dart';
import '../views/chats/services/database.dart';
import '../views/chats/views/chat.dart';

class MainHelper {
  static Future<void> projectInitilization() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform)
        .then((_) {
      Get.put(AdController()).fetchAds();
      Get.put(AuthenticationController());
      Get.put(GeneralGetxController());
    });
    await EasyLocalization.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

showLoader(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => SimpleDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('Loading...'.tr()),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ));
}

sendMessage(ExploreModel ad, String adId, BuildContext context) async {
  DatabaseMethods databaseMethods = DatabaseMethods();
  final ownerUser = await GeneralGetxController.instance.getUserData(ad.hostId);
  var currentUser = GeneralGetxController.instance.currentUserModel;
  List<String> users = [currentUser!.uid, ownerUser.uid];
  String chatRoomId = await getChatRoomId(currentUser.uid, ownerUser.uid);

  Map<String, dynamic> chatRoom = {
    "users": users,
    "chatRoomId": chatRoomId,
    "adid": adId,
    "${currentUser.uid}_photo": ownerUser.imageUrl,
    "${ownerUser.uid}_photo": currentUser.imageUrl,
    "${currentUser.uid}_name": ownerUser.fullName,
    "${ownerUser.uid}_name": currentUser.fullName,
    "${currentUser.uid}_uid": ownerUser.uid,
    "${ownerUser.uid}_uid": currentUser.uid,
    currentUser.uid: 0,
    ownerUser.uid: 0
  };

  databaseMethods.addChatRoom(chatRoom, chatRoomId);
  // ignore: use_build_context_synchronously
  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) => Chat(
            currentUser: currentUser,
            chatRoomId: chatRoomId,
            reciever: ownerUser,
            adid: adId,
            isBlookByMe: false,
          )));
}

Future<String> getChatRoomId(
  String a,
  String b,
) async {
  var isExist = await FirebaseFirestore.instance
      .collection('chatRoom')
      .doc("${b}_$a}")
      .get();
  if (isExist.exists) {
    return "${b}_$a}";
  } else {
    return "${a}_$b";
  }
}

updateListing(RemoteMessage message) {
  var user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    FirebaseFirestore.instance.collection('notificaitons').add({
      'uid': user.uid,
      'title': 'Ad listing',
      'dateTime': DateTime.now().millisecondsSinceEpoch,
      'body': message.notification!.body
    });
  }
}

udpateMessageStatus(RemoteMessage message) async {
  var chatRoomId = message.data['chatRoomId'];
  var messageId = message.data['messageId'];
  FirebaseFirestore.instance
      .collection('chatRoom')
      .doc(chatRoomId)
      .collection('chats')
      .doc(messageId)
      .update({'messageStatus': MessageStatus.deliver.name}).then((value) {
    debugPrint('message deliver');
  }).catchError((c) {
    debugPrint('catch error $c');
  });
}
