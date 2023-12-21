import 'package:klomi/views/chats/views/chatrooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:swipeable_tile/swipeable_tile.dart';

import '../../controllers/general_controller.dart';
import '../../helper/app_toast.dart';
import '../../models/notifications.dart';
import '../hosting/notifications/empty_notifications.dart';
import 'login_if_not_login.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  InboxState createState() => InboxState();
}

class InboxState extends State<Inbox> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isLogin = FirebaseAuth.instance.currentUser != null;
    if (!isLogin) {
      return const LoginScreenIfNotLogin();
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('inbox'.tr(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 35,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0),
                      width: 0.7,
                    ),
                  )),
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(right: 4, left: 0),
                    labelStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0, color: Colors.black),

                        // borderSide: BorderSide(width: 2.0, color: KThemeColor),
                        insets: EdgeInsets.all(-1)),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: 'messages'.tr(),
                      ),
                      Tab(
                        text: 'notifications'.tr(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.grey.withOpacity(0.5),
                ),
                // tab bar view here
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // first tab bar view widget
                      const ChatRoom(),
                      notification(context)

                      // second tab bar view widget
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

Widget notification(BuildContext context) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('notifications')
        .where('receiverUid',
            isEqualTo: Get.find<GeneralGetxController>().currentUserModel!.uid)
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        var ratingList = snapshot.data!.docs
            .map((e) => NotificationsModel.fromMap(e.data()))
            .toList();
        if (ratingList.isEmpty) {
          return const EmptyNotifications();
        }
        return ListView.builder(
          itemCount: ratingList.length,
          itemBuilder: (context, index) => NotificationCard(
              notificationsModel: ratingList[index],
              reference: snapshot.data!.docs[index].reference),
        );
      }
    },
  );
}

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key, required this.notificationsModel, required this.reference});
  final NotificationsModel notificationsModel;
  final DocumentReference<Map<String, dynamic>> reference;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SwipeableTile(
          color: Colors.white,
          // swipeThreshold: 0.8,
          direction: SwipeDirection.horizontal,
          onSwiped: (direction) {
            // Here call setState to update state
          },
          backgroundBuilder: (context, direction, progress) {
            if (direction == SwipeDirection.endToStart) {
              reference.delete();
              AppToast.showToast(message: 'Delete'.tr());
              // return your widget
            } else if (direction == SwipeDirection.startToEnd) {
              reference.delete();
              AppToast.showToast(message: 'Delete'.tr());

              // return your widget
            }
            return const SizedBox();
          },
          key: UniqueKey(),
          child: Card(
            elevation: 8,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(notificationsModel.imageUrl),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(notificationsModel.body),
                  )),
                  Column(
                    children: [
                      TextButton(
                          onPressed: () async {},
                          child: Text('Check out'.tr())),
                      Text(notificationsModel.dateTime
                          .toString()
                          .substring(0, 16))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
