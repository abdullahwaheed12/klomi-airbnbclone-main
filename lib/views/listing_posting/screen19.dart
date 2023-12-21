import 'package:klomi/views/listing_posting/logic.dart';
import 'package:klomi/views/listing_posting/widgets/next_back.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/text_styles.dart';
import 'screen20.dart';

class ReviewYourListing extends StatelessWidget {
  const ReviewYourListing({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      // Text(
                      //   'Review your listing'.tr(),
                      //   style: mediumTitle,
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Text(
                      //     "Here's what we'll show to guests. Make sure everything looks good."
                      //         .tr()),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // //image price container
                      // Container(
                      //   padding: const EdgeInsets.all(16),
                      //   margin: const EdgeInsets.symmetric(horizontal: 8),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(12),
                      //     color: Colors.white,
                      //     boxShadow: const [
                      //       BoxShadow(
                      //         color: Colors.grey,
                      //         offset: Offset(2.0, 2.0),
                      //         blurRadius: 2.0,
                      //       ),
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Image.asset(houseImagePath),
                      //       const SizedBox(
                      //         height: 10,
                      //       ),
                      //       Row(
                      //         children: [
                      //           const Text(''),
                      //           const Spacer(),
                      //           Text('New'.tr()),
                      //           const Icon(
                      //             Icons.star,
                      //             size: 20,
                      //           )
                      //         ],
                      //       ),
                      //       const SizedBox(
                      //         height: 5,
                      //       ),
                      //       const Text.rich(
                      //         TextSpan(
                      //             text: '\$23',
                      //             style: TextStyle(
                      //                 decoration: TextDecoration.lineThrough,
                      //                 color: Colors.grey),
                      //             children: [
                      //               TextSpan(
                      //                   text: ' \$18',
                      //                   style: TextStyle(
                      //                       fontWeight: FontWeight.bold,
                      //                       decoration: TextDecoration.none,
                      //                       color: Colors.black)),
                      //               TextSpan(
                      //                   text: '  night',
                      //                   style: TextStyle(
                      //                     decoration: TextDecoration.none,
                      //                   ))
                      //             ]),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 50,
                      // ),
                      Text(
                        "What's next?".tr(),
                        style: smallTitle,
                      ),

                      // const SizedBox(
                      //   height: 50,
                      // ),
                      // ListTile(
                      //   leading: const Icon(Icons.details),
                      //   title: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Verify a few details and publish'.tr(),
                      //         style: smallTitle,
                      //       ),
                      //       Text(
                      //           "We'll let you know if you need to confirm your identity or register with the local government."
                      //               .tr())
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                      ListTile(
                        leading: const Icon(Icons.calendar_month_outlined),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Set up your calendar'.tr(),
                              style: smallTitle,
                            ),
                            Text(
                                "Choose which dates your listing is available. It will be visible 24 hours after you publish."
                                    .tr()),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Adjust your settings'.tr(),
                              style: smallTitle,
                            ),
                            Text(
                                "Set house rules, select a cancellation policy, choose how guests book, and more."
                                    .tr()
                                    .tr()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              NextBack(
                onPressed: () {
                  Get.find<ListingLogic>().publishAd(allPreviousArgu);
                  Get.to(() => const Congratulations());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
