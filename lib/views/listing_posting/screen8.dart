import 'package:klomi/views/listing_posting/widgets/next_back.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/image_path.dart';
import '../../contstant/text_styles.dart';
import 'screen9.dart';

class MakeYourPlaceStandOut extends StatelessWidget {
  const MakeYourPlaceStandOut({super.key, required this.allPreviousArgument});
  final Map allPreviousArgument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 400, width: 400, child: Image.asset(houseImagePath)),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Step 2'.tr(),
                style: smallTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Make your place stand out'.tr(),
                style: largeTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  "In this step, you'll add some of the amenities your place offers, plus 5 or more photos. Then, you'll create a title and description."
                      .tr()),
              const Spacer(),
              NextBack(
                onPressed: () {
                  Get.to(
                      () => PlaceOffer(allPreviousArgu: allPreviousArgument));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
