import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../global_widgets/empty_space_widget.dart';
import '../../../helper/app_toast.dart';

class BlockUser extends StatefulWidget {
  const BlockUser(
      {super.key, required this.userName, required this.chatRoomId});
  final String userName;
  final String chatRoomId;

  @override
  State<BlockUser> createState() => _BlockUserState();
}

class _BlockUserState extends State<BlockUser> {
  var isBlock = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${'Block'.tr()} ${widget.userName}? '),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'Blocked users cannot call or send you messages. This user will not be notified.'
                  .tr()),
          const DynamicVerticalSpace(12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: isBlock,
                onChanged: (value) {
                  setState(() {
                    isBlock = !isBlock;
                  });
                },
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DynamicVerticalSpace(12),
                    Text(
                      'Report contact'.tr(),
                      // style: mediumDesc,
                    ),
                    const DynamicVerticalSpace(6),
                    Text(
                      'The last 5 messages will be forwarded to Klomi support team.'
                          .tr(),
                      // style: smallDesc,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
                  .doc(widget.chatRoomId)
                  .update({
                '${FirebaseAuth.instance.currentUser!.uid}_isBlock': true
              });
              AppToast.showToast(message: 'User blocked successfully.'.tr());

              Get.back();
            },
            child: Text('Block'.tr())),
      ],
    );
  }
}
