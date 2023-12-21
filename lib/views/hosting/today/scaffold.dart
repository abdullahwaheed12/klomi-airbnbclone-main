import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/utiles/math_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import '../../notifications/scaffold.dart';
import '../choose_cancellation_policy/scaffold.dart';
import '../house_rules/scaffold.dart';
import '../instant_booking/scaffold.dart';

class Today extends StatelessWidget {
  const Today({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  GetBuilder<GeneralGetxController>(builder: (controller) {
                    if (GeneralGetxController.instance.currentUserModel ==
                        null) {
                      return const SizedBox();
                    }
                    return Text(
                      "${"Welcome".tr()}\n${GeneralGetxController.instance.currentUserModel?.firstName}!",
                      style: largeTitle,
                    );
                  }),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.to(() => const Notifications());
                    },
                    child: const Icon(
                      Icons.notifications_none,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  "Guests can reserve your place 24 hours after you publish here's how to prepare."
                      .tr()),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 460,
              width: size.width,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    plantImagePath,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your next steps'.tr(),
                    style: largeTitle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "It's time to review a couple of\ncurrent settings.".tr(),
                    style: mediumDesc.copyWith(color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const InstantBooking());
                          },
                          child: StepsCard(
                              iconData: Icons.electric_bolt_outlined,
                              title: 'Turn Instant Book on or off'.tr(),
                              body: 'Choose how\nguests will book'.tr()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ChooseCancellationPolicy());
                          },
                          child: StepsCard(
                              iconData: Icons.not_interested_outlined,
                              title: 'Pick your policy for cancellations'.tr(),
                              body: 'Control your reservations'.tr()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const HouseRules());
                          },
                          child: StepsCard(
                              iconData: Icons.task_outlined,
                              title: 'Add your house rules'.tr(),
                              body: 'Set expectations with guests'.tr()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     Get.to(() => const SpecialOffer());
                        //   },
                        //   child: StepsCard(
                        //       iconData: Icons.local_offer_outlined,
                        //       title: 'Offer special promotions'.tr(),
                        //       body: 'Add discounts to attract guests'.tr()),
                        // ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     Get.to(() => const SetUpYourCallendar());
                        //   },
                        //   child:  StepsCard(
                        //       iconData: Icons.calendar_month_outlined,
                        //       title: 'Set up your calendar'.tr(),
                        //       body: 'Choose which dates are available'.tr()),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     "We're here to help".tr(),
            //     style: mediumTitle,
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            // Contact
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.grey),
            //         borderRadius: BorderRadius.circular(12)),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Icon(Icons.headset_mic_outlined),
            //         const SizedBox(
            //           width: 10,
            //         ),
            //         Expanded(
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 'Contact specialized support'.tr(),
            //                 style: mediumTitle.copyWith(fontSize: 14),
            //               ),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               Text(
            //                 'As a new Host, you get one-tap access to a specially trained support team'
            //                     .tr(),
            //                 style: mediumDesc.copyWith(fontSize: 12),
            //               )
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}

class StepsCard extends StatelessWidget {
  const StepsCard(
      {super.key,
      required this.iconData,
      required this.title,
      required this.body});
  final IconData iconData;
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconData,
                size: 30,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: smallTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              Text(body),
              const SizedBox(
                height: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}
