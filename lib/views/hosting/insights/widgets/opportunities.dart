import 'package:get/get.dart' hide Trans;
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/utiles/math_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/views/hosting/insights/enhanced_cleaning_process/scaffold.dart';
import 'package:klomi/views/hosting/insights/offer_flexible_cancellation/scaffold.dart';

import '../best_amenities_offer/scaffold.dart';
import '../comfortable_remote_workers/scaffold.dart';
import '../do_or_no_self_check_in/scaffold.dart';
import '../know_about_hosting_families/scaffold.dart';

class Opportunities extends StatelessWidget {
  const Opportunities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          color: const Color(0xffF7F7F7),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Resources for hosting now'.tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const OfferFlexibleCancellation());
                          },
                          child: OpportunitiesCard(
                            imageUrl: flexibleCancellationImagePath,
                            text:
                                "Why it's smart to offer flexible\ncancellations right now"
                                    .tr(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const EnhancedCleaningProcess());
                          },
                          child: OpportunitiesCard(
                            imageUrl: girlMaskImagePath,
                            text:
                                "Getting started with Klomi's\ncleaning protocol"
                                    .tr(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const DoOrNoSelfCheckIn());
                          },
                          child: OpportunitiesCard(
                            imageUrl: girlEnteringImagePath,
                            text:
                                "The do's and don'ts of providing\nself check-in"
                                    .tr(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const KnowAboutHostingAndFamilies());
                          },
                          child: OpportunitiesCard(
                            imageUrl: mohterDoughterImagePath,
                            text:
                                "What you need to know about\n hosting families and pets"
                                    .tr(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const ComfortableRemoteWorkers());
                          },
                          child: OpportunitiesCard(
                            imageUrl: oldMenSitingChairImagePath,
                            text:
                                "How to make your space\ncomfortable for remote workers"
                                    .tr(),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(() => const BestAmenitiesOffer());
                          },
                          child: OpportunitiesCard(
                            imageUrl: kitchenImagePath,
                            text: "The best amenities to offer right\nnow".tr(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class OpportunitiesCard extends StatelessWidget {
  const OpportunitiesCard(
      {super.key, required this.imageUrl, required this.text});
  final String imageUrl;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 100, width: 100, child: Image.asset(imageUrl)),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: size.width * 0.7,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
