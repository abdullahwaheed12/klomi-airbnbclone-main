import 'package:klomi/views/listing_posting/widgets/next_back.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/image_path.dart';
import '../../contstant/text_styles.dart';
import 'screen3.dart';

class TellUsAboutYourPlace extends StatelessWidget {
  const TellUsAboutYourPlace({super.key});

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
                'Step 1'.tr(),
                style: smallTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Tell us about \nyour place'.tr(),
                style: largeTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  "In this step, we'll ask you which type of property you have and if guests will book the entire place or just a room. Then let us know the location and how many guests can stay."
                      .tr()),
              const Spacer(),
              NextBack(
                onPressed: () {
                  Get.to(() => const BestDesribeYourPlace());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
