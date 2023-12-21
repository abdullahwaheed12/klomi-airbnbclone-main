import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/views/hosting/explore_hosting_resources/how_trun_big_events_opportunities/scaffold.dart';
import 'package:klomi/views/hosting/explore_hosting_resources/pricing_tools_attract_more_bookings/scaffold.dart';

import 'how_to_set_a_pricing_strategy/scaffold.dart';

class ExploreHostingResources extends StatelessWidget {
  const ExploreHostingResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00ff4444),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Become your best Host'.tr(),
              style: largeTitle.copyWith(color: Colors.white, fontSize: 40),
            ),
            const DynamicVerticalSpace(12),
            Text(
              'Resources to help you meet your goals'.tr(),
              style: mediumDesc.copyWith(color: Colors.white, fontSize: 25),
            ),
            const DynamicVerticalSpace(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(() => const HowToSetAPrice());
                    },
                    child: SizedBox(
                      width: 270,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage(girlOpenLaptopImagePath))),
                            ),
                            const DynamicVerticalSpace(20),
                            Text(
                              'How to set a pricing strategy'.tr(),
                              style: smallTitle.copyWith(color: Colors.white),
                            ),
                            const DynamicVerticalSpace(20),
                            Row(
                              children: [
                                const Icon(
                                  Icons.read_more,
                                  color: Colors.white,
                                ),
                                const DynamicHorizontalSpace(12),
                                Text(
                                  '3 minutes'.tr(),
                                  style:
                                      smallDesc.copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const PricingToolsAtrractMoreBookings());
                    },
                    child: SizedBox(
                      width: 270,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          girlPhoneKitchenImagePath))),
                            ),
                            const DynamicVerticalSpace(20),
                            Text(
                              'Price tools you can use to attract more bookings'
                                  .tr(),
                              style: smallTitle.copyWith(color: Colors.white),
                            ),
                            const DynamicVerticalSpace(20),
                            Row(
                              children: [
                                const Icon(
                                  Icons.read_more,
                                  color: Colors.white,
                                ),
                                const DynamicHorizontalSpace(12),
                                Text(
                                  '4 minutes',
                                  style:
                                      smallDesc.copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const HowTurnBigEventsOpportunity());
                    },
                    child: SizedBox(
                      width: 270,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 250,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage(watchingMatchImagePath))),
                            ),
                            const DynamicVerticalSpace(20),
                            Text(
                              'How to turn big events into opportunities to earn money'
                                  .tr(),
                              style: smallTitle.copyWith(color: Colors.white),
                            ),
                            const DynamicVerticalSpace(20),
                            Row(
                              children: [
                                const Icon(
                                  Icons.read_more,
                                  color: Colors.white,
                                ),
                                const DynamicHorizontalSpace(12),
                                Text(
                                  '3 minutes',
                                  style:
                                      smallDesc.copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   width: 270,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Container(
                  //           height: 250,
                  //           width: 250,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15),
                  //               image: const DecorationImage(
                  //                   image: AssetImage(girlMaskImagePath))),
                  //         ),
                  //         const DynamicVerticalSpace(20),
                  //         Column(
                  //           children: [
                  //             Text(
                  //               'A simpler way to dispute retaliatory reviews'
                  //                   .tr(),
                  //               style: smallTitle.copyWith(color: Colors.white),
                  //             ),
                  //           ],
                  //         ),
                  //         const DynamicVerticalSpace(20),
                  //         Row(
                  //           children: [
                  //             const Icon(
                  //               Icons.read_more,
                  //               color: Colors.white,
                  //             ),
                  //             const DynamicHorizontalSpace(12),
                  //             Text(
                  //               '2 minutes',
                  //               style: smallDesc.copyWith(color: Colors.white),
                  //             )
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 270,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Container(
                  //           height: 250,
                  //           width: 250,
                  //           decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(15),
                  //               image: const DecorationImage(
                  //                   image: AssetImage(girlMaskImagePath))),
                  //         ),
                  //         const DynamicVerticalSpace(20),
                  //         Text(
                  //           'Ground rules fo guests'.tr(),
                  //           style: smallTitle.copyWith(color: Colors.white),
                  //         ),
                  //         const DynamicVerticalSpace(20),
                  //         Row(
                  //           children: [
                  //             const Icon(
                  //               Icons.read_more,
                  //               color: Colors.white,
                  //             ),
                  //             const DynamicHorizontalSpace(12),
                  //             Text(
                  //               '2 minutes',
                  //               style: smallDesc.copyWith(color: Colors.white),
                  //             )
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
