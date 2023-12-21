import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../helper/app_toast.dart';

class UnBlockUser extends StatelessWidget {
  const UnBlockUser(
      {super.key, required this.chatRoomId, required this.userName});
  final String userName;

  final String chatRoomId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:
          Text('${'Unblock'.tr()} $userName ${'to send a message.'.tr()}}'),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'.tr())),
        TextButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('chatRoom')
                  .doc(chatRoomId)
                  .update({
                '${FirebaseAuth.instance.currentUser!.uid}_isBlock': false
              });
              AppToast.showToast(message: 'User unblocked successfully'.tr());

              Get.back();
            },
            child: Text('Unblock'.tr())),
      ],
    );
  }
}
