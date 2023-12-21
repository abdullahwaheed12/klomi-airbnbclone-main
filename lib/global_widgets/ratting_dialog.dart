import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/helper/main_helper.dart';
import 'package:klomi/models/active_ad.dart';
import 'package:klomi/models/notifications.dart';
import 'package:klomi/models/reviews_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart' hide Trans;

import '../api_call/fcm_api.dart';
import '../controllers/general_controller.dart';
import '../contstant/colors.dart';
import '../enums/active_order_num.dart';
import '../helper/app_toast.dart';

class ReviewRatingDialog extends StatelessWidget {
  const ReviewRatingDialog(
      {super.key,
      required this.activeAd,
      required this.snapshot,
      required this.index,
      required this.isHost,
      required this.activeOrderStatus});
  final ActiveAd activeAd;
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  final int index;
  final bool isHost;
  final ActiveOrderStatus activeOrderStatus;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(activeAd.visitorPhotoUrl),
                            fit: BoxFit.fitHeight),
                        shape: BoxShape.circle,
                        color: Colors.grey[300]),
                    child: ClipOval(
                        child: Image.network(activeAd.visitorPhotoUrl,
                            fit: BoxFit.fill)),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.clear))
                ],
              ),
              Text(
                activeAd.visitorName.toUpperCase(),
                style: const TextStyle(color: Colors.black),
              ),
              const Review(),
              const SizedBox(
                height: 15,
              ),
              Text(
                "How was your experience?".tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Your feedback will help improve the experience".tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  controller: RattingLogic.instance.reviewTEController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black12,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: InkWell(
                  onTap: () async {
                    if (isHost) {
                      Get.find<RattingLogic>().giveRattingsByHost(
                          context: context,
                          activeAd: activeAd,
                          snapshot: snapshot,
                          index: index,
                          isHost: isHost,
                          activeOrderStatus: activeOrderStatus);
                    } else {
                      Get.find<RattingLogic>().giveRattingsByTraveler(
                          context: context,
                          activeAd: activeAd,
                          snapshot: snapshot,
                          index: index,
                          isHost: isHost,
                          activeOrderStatus: activeOrderStatus);
                    }
                  },
                  child: Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text(
                      "Submit Review".tr(),
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: RattingLogic.instance.ratings ?? 0,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        debugPrint(rating.toString());
        RattingLogic.instance.ratings = rating;
        setState(() {});
      },
    );
  }
}

class RattingLogic extends GetxController {
  static RattingLogic instance = Get.find();
  double? ratings;
  var reviewTEController = TextEditingController();
  giveRattingsByHost(
      {required BuildContext context,
      required ActiveAd activeAd,
      required AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
      required int index,
      required ActiveOrderStatus activeOrderStatus,
      required bool isHost}) async {
    var controller = RattingLogic.instance;
    if (controller.ratings == null) {
      AppToast.showToast(message: 'Please select star rating');
      return;
    } else if (controller.reviewTEController.text.isEmpty) {
      AppToast.showToast(message: 'Please give review about your experience');
      return;
    } else {
      //loading
      showLoader(context);
      var reviewObj = ReviewsModel(
        adId: activeAd.exploreModel.adId,
        reviewByUserId: FirebaseAuth.instance.currentUser!.uid,
        reviewToUserId: activeAd.visitorId,
        review: controller.reviewTEController.text,
        rating: controller.ratings!,
        time: DateTime.now(),
        description: controller.reviewTEController.text,
        image: Get.find<GeneralGetxController>().currentUserModel!.imageUrl,
        name: Get.find<GeneralGetxController>().currentUserModel!.fullName,
      );
      //review add
      await FirebaseFirestore.instance
          .collection('reviews')
          .add(reviewObj.toMap());
      //get the reviews
      var dataReview = await FirebaseFirestore.instance
          .collection('reviews')
          .where('reviewToUserId', isEqualTo: activeAd.visitorId)
          .get();
      int ratingCount = 0;
      double totalRating = 0;
      for (var e in dataReview.docs) {
        num rating = e.get('rating');
        totalRating += rating;
        ratingCount++;
      }
      var avgRatting = totalRating / ratingCount;
      log('average rattings  $avgRatting');
      //update ratting to the users
      await FirebaseFirestore.instance
          .collection('users')
          .doc(activeAd.visitorId)
          .update({
        'rattings': avgRatting.isNaN ? 0.0 : avgRatting,
        'rattingCount': ratingCount
      });
      log('update user rattings  ${controller.ratings!}');
      log('snapshot.data!.docs[index].id ${snapshot.data!.docs[index].id}');
      //update active ads
      await FirebaseFirestore.instance
          .collection('ActiveAds')
          .doc(snapshot.data!.docs[index].id)
          .update({
        'activeOrderStatus': ActiveOrderStatus.complete.name,
        'isRattingReviewByTraveler': false,
      }).then((value) {
        AppToast.showToast(message: 'update order status');
      }).catchError((e) {
        AppToast.showToast(message: 'error $e while updating order status');
      });

      sendNotificationToTheTraveler(
          activeAd.visitorId, activeOrderStatus, isHost);
      Get.back();
      Get.back();
      Get.back();
    }
  }

  giveRattingsByTraveler({
    required BuildContext context,
    required ActiveAd activeAd,
    required AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,
    required int index,
    required bool isHost,
    required ActiveOrderStatus activeOrderStatus,
  }) async {
    var controller = RattingLogic.instance;
    if (controller.ratings == null) {
      AppToast.showToast(message: 'Please select star rating');
      return;
    } else if (controller.reviewTEController.text.isEmpty) {
      AppToast.showToast(message: 'Please give review about your experience');
      return;
    } else {
      showLoader(context);

      var reviewObj = ReviewsModel(
        adId: activeAd.exploreModel.adId,
        reviewByUserId: FirebaseAuth.instance.currentUser!.uid,
        reviewToUserId: activeAd.visitorId,
        review: controller.reviewTEController.text,
        rating: controller.ratings!,
        time: DateTime.now(),
        description: controller.reviewTEController.text,
        image: Get.find<GeneralGetxController>().currentUserModel!.imageUrl,
        name: Get.find<GeneralGetxController>().currentUserModel!.fullName,
      );
      //save in the review collection
      await FirebaseFirestore.instance
          .collection('reviews')
          .add(reviewObj.toMap());
      var dataReview = await FirebaseFirestore.instance
          .collection('reviews')
          .where('reviewToUserId', isEqualTo: activeAd.hostId)
          .get();
      //save in the explore listing
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(activeAd.exploreModel.adId)
          .update({
        'reviews': FieldValue.arrayUnion([reviewObj.toMap()])
      });
      int ratingCount = 0;
      double totalRating = 0;
      for (var e in dataReview.docs) {
        num rating = e.get('rating');
        totalRating += rating;
        ratingCount++;
      }
      var avgRatting = totalRating / ratingCount;
      log('average rattings  $avgRatting');

      await FirebaseFirestore.instance
          .collection('users')
          .doc(activeAd.hostId)
          .update({
        'rattings': avgRatting.isNaN ? 0.0 : avgRatting,
        'rattingCount': ratingCount
      });
      log('update user rattings  ${controller.ratings!}');
      log('snapshot.data!.docs[index].id ${snapshot.data!.docs[index].id}');
      await FirebaseFirestore.instance
          .collection('ActiveAds')
          .doc(snapshot.data!.docs[index].id)
          .update({'isRattingReviewByTraveler': true}).then((value) {
        AppToast.showToast(message: 'update order status');
      }).catchError((e) {
        AppToast.showToast(message: 'error $e while updating order status');
      });
      sendNotificationToTheTraveler(activeAd.hostId, activeOrderStatus, isHost);
      Get.back();
      Get.back();
      Get.back();
    }
  }
}

sendNotificationToTheTraveler(
    String userID, ActiveOrderStatus activeOrderStatus, bool isHost) async {
  var user = await Get.find<GeneralGetxController>().getUserData(userID);
  var body =
      '${Get.find<GeneralGetxController>().currentUserModel!.fullName} gives you rattings and review';
  messageNotificationCall(user.messagingToken, 'Alert!', body, data: {});
  //save notification to the firestore
  var notification = NotificationsModel(
      receiverUid: userID,
      isHost: isHost,
      body: body,
      imageUrl: Get.find<GeneralGetxController>().currentUserModel!.imageUrl,
      activeOrderStatus: activeOrderStatus,
      dateTime: DateTime.now());
  FirebaseFirestore.instance
      .collection('notifications')
      .add(notification.toMap());
}
