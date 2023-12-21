import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../global_widgets/empty_space_widget.dart';
import '../../../controllers/general_controller.dart';
import '../../../contstant/image_path.dart';
import 'block_user.dart';
import 'report_user.dart';
import 'un_block_user.dart';

class NameLastChat extends StatefulWidget {
  const NameLastChat({super.key, required this.chatDoc});
  final QueryDocumentSnapshot<Map<String, dynamic>> chatDoc;

  @override
  State<NameLastChat> createState() => _NameLastChatState();
}

class _NameLastChatState extends State<NameLastChat> {
  var currentUser = Get.find<GeneralGetxController>().currentUserModel!;
  @override
  Widget build(BuildContext context) {
    int unseen = widget.chatDoc[currentUser.uid] ?? 0;
    bool isBlockMe = widget.chatDoc
            .data()['${FirebaseAuth.instance.currentUser!.uid}_isBlock'] ??
        false;
    //      bool isBlockOther =
    // widget.chatDoc['${FirebaseAuth.instance.currentUser!.uid}_isBlock'] ??
    //     false;
    return Row(
      children: [
        if (widget.chatDoc['${currentUser.uid}_photo'] != '')
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        widget.chatDoc['${currentUser.uid}_photo'])),
                color: Colors.blue),
          )
        else
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(profileAvatar)),
                color: Colors.blue),
          ),
        const DynamicHorizontalSpace(15),
        //name and lastMessage
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name
            Text(
                widget.chatDoc['${currentUser.uid}_name']
                    .toString()
                    .capitalize!,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            const DynamicVerticalSpace(4),
            //lastMessage
            StreamBuilder(
              stream: widget.chatDoc.reference
                  .collection('chats')
                  .orderBy('time', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                }
                var chatsDoc = snapshot.data!.docs;
                if (chatsDoc.isEmpty) {
                  return const SizedBox();
                }
                if (chatsDoc.first
                    .get('message')
                    .toString()
                    .contains('firebasestorage')) {
                  return const Icon(
                    Icons.photo,
                    size: 20,
                  );
                }
                return Text(
                  chatsDoc.first.get('message').toString().length < 30
                      ? chatsDoc.first.get('message')
                      : chatsDoc.first
                          .get('message')
                          .toString()
                          .substring(0, 30),
                  style: Theme.of(context).textTheme.labelLarge,
                );
              },
            )
          ],
        ),
        const Spacer(),
        //time
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            StreamBuilder(
              stream: widget.chatDoc.reference
                  .collection('chats')
                  .orderBy('time', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                }
                var chatsDoc = snapshot.data!.docs;

                if (chatsDoc.isEmpty) {
                  return const SizedBox();
                }

                return Text(
                  formatDateTime(chatsDoc.first.get('time')),
                  style: const TextStyle(color: Colors.grey),
                );
              },
            ),
            const DynamicVerticalSpace(4),
            unseen > 0
                ? Container(
                    alignment: Alignment.center,
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "$unseen",
                      style: const TextStyle(color: Colors.white),
                    ))
                : const SizedBox(),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        PopupMenuButton<int>(
          itemBuilder: (context) => [
            if (!isBlockMe)
              PopupMenuItem(
                value: 1,
                child: Text("Block".tr()),
                onTap: () {},
              ),
            PopupMenuItem(
              value: 2,
              child: Text("Report".tr()),
            ),
            if (isBlockMe)
              PopupMenuItem(
                value: 3,
                child: Text("Unblock".tr()),
                onTap: () {},
              ),
          ],
          icon: const Icon(Icons.more_vert),
          onSelected: (value) {
            if (value == 1) {
              blockUser(context);
            } else if (value == 2) {
              reportUser(context);
            } else {
              unBlockUser(context);
            }

            // Handle the selection of the options
          },
        )
      ],
    );
  }

  unBlockUser(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => UnBlockUser(
              chatRoomId: widget.chatDoc.id,
              userName: widget.chatDoc['${currentUser.uid}_name']
                  .toString()
                  .capitalize!,
            ));
  }

  blockUser(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => BlockUser(
              userName: widget.chatDoc['${currentUser.uid}_name']
                  .toString()
                  .capitalize!,
              chatRoomId: widget.chatDoc.id,
            ));
  }

  reportUser(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ReportUser(
        chatDoc: widget.chatDoc,
        userName:
            widget.chatDoc['${currentUser.uid}_name'].toString().capitalize!,
      ),
    );
  }

  String formatDateTime(int dateTime) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dateTime);
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    if (date.day == now.day &&
        date.month == now.month &&
        date.year == now.year) {
      // convert date to am pm
      return DateFormat.jm().format(now).padLeft(2, '0');
      // return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
    } else if (date.day == yesterday.day &&
        date.month == yesterday.month &&
        date.year == yesterday.year) {
      return "yesterday";
    } else {
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    }
  }
}
