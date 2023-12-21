import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/contstant/colors.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/views/meeting_schedule/meetings.dart';
import 'package:klomi/views/trips_traveller/active_trips.dart';
import 'package:klomi/views/trips_traveller/complete_trips.dart';
import 'package:klomi/views/trips_traveller/pending_rattings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import 'pending_trips.dart';
import 'trips_if_not_login.dart';

class Trips extends StatelessWidget {
  const Trips({super.key});

  @override
  Widget build(BuildContext context) {
    var isLogin = FirebaseAuth.instance.currentUser != null;
    if (!isLogin) {
      return const TripsIfNotLogin();
    } else {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Trips'.tr(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const DynamicVerticalSpace(30),
                  //1
                  SizedBox(
                    height: 220,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //pending orders
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            Get.to(() => const PendingTripTraveler());
                          },
                          child: Container(
                            height: 200,
                            width: 150,
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Pending\nOrders'.tr(),
                                  style: mediumTitle,
                                ),
                                const DynamicVerticalSpace(12),
                                Expanded(
                                    child: Image.asset(
                                  orderPendingImagePath,
                                  color: primaryColor,
                                )),
                              ],
                            ),
                          ),
                        ),
                        //active orders
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            Get.to(() => const ActiveTripsTraveler());
                          },
                          child: Container(
                            height: 200,
                            width: 150,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Active \nOrders'.tr(),
                                  style: mediumTitle,
                                ),
                                const DynamicVerticalSpace(12),
                                Expanded(
                                    child: Image.asset(
                                  orderActiveImagePath,
                                  color: primaryColor,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //2
                  SizedBox(
                    height: 220,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //pending Rattings
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            Get.to(() => const PendingRatingsTripTraveler());
                          },
                          child: Container(
                            height: 200,
                            width: 150,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Pending \nRatings'.tr(),
                                  style: mediumTitle,
                                ),
                                const DynamicVerticalSpace(12),
                                Expanded(
                                    child: Image.asset(
                                  pendingRattingImagePath,
                                  color: primaryColor,
                                )),
                              ],
                            ),
                          ),
                        ),

                        //complete order
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            Get.to(() => const CompleteTripsTraveler());
                          },
                          child: Container(
                            height: 200,
                            width: 150,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Complete \nOrders'.tr(),
                                  style: mediumTitle,
                                ),
                                const DynamicVerticalSpace(12),
                                Expanded(
                                    child: Image.asset(
                                  orderCompleteImagePath,
                                  color: primaryColor,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //3
                  SizedBox(
                    height: 220,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //meeting
                        MaterialButton(
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            Get.to(() => Meetings(
                                currentUser: Get.find<GeneralGetxController>()
                                    .currentUserModel!,
                                reciever: null));
                          },
                          child: Container(
                            height: 200,
                            width: 150,
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Meeting'.tr(),
                                  style: mediumTitle,
                                ),
                                const DynamicVerticalSpace(12),
                                Expanded(
                                    child: Image.asset(
                                  meetingImagePath,
                                  color: primaryColor,
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
