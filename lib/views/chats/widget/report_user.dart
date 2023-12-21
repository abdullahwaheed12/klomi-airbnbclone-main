import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../global_widgets/empty_space_widget.dart';
import '../../../helper/app_toast.dart';

class ReportUser extends StatefulWidget {
  const ReportUser({super.key, required this.userName, required this.chatDoc});
  final String userName;
  final QueryDocumentSnapshot<Map<String, dynamic>> chatDoc;

  @override
  State<ReportUser> createState() => _ReportUserState();
}

class _ReportUserState extends State<ReportUser> {
  var isBlock = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${'Report'.tr()} + ${widget.userName} ?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'The last 5 messages from this user will be forwarded to Klomi. This user will not be notified.'
                  .tr()),
          const DynamicVerticalSpace(12),
          Row(
            children: [
              Checkbox(
                value: isBlock,
                onChanged: (value) {
                  setState(() {
                    isBlock = !isBlock;
                  });
                },
              ),
              Text('Block user and delete chat'.tr())
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child:  Text('Cancel'.tr())),
        TextButton(
            onPressed: () {
              if (isBlock) {
                widget.chatDoc.reference.update({
                  '${FirebaseAuth.instance.currentUser!.uid}_isBlock': true
                });
              }
              AppToast.showToast(message: 'User reported successfully'.tr());

              Get.back();
            },
            child:  Text('Report'.tr())),
      ],
    );
  }
}
