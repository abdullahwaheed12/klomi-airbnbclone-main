import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/helper/app_toast.dart';
import 'package:klomi/models/notifications.dart';
import 'package:klomi/views/hosting/notifications/empty_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:swipeable_tile/swipeable_tile.dart';
import '../../contstant/text_styles.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Notifications'.tr(),
          style: mediumTitle,
        ),
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .where('receiverUid',
                isEqualTo:
                    Get.find<GeneralGetxController>().currentUserModel!.uid)
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
      ),
    );
  }
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
          // swipeThreshold: 0.2,
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
