import 'package:klomi/controllers/adpost_controller.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class LearnMoreCover extends StatefulWidget {
  const LearnMoreCover({super.key});

  @override
  State<LearnMoreCover> createState() => _LearnMoreCoverState();
}

class _LearnMoreCoverState extends State<LearnMoreCover> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  var logic = Get.find<AdController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DynamicVerticalSpace(20),
            // cross
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            const DynamicVerticalSpace(10),

            Row(
              children: [
                Text(
                  "klomi",
                  style: TextStyle(
                      letterSpacing: 0.2,
                      fontFamily: 'ManropeBold',
                      color: Theme.of(context).primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "cover".tr(),
                  style: const TextStyle(
                      letterSpacing: 0.5,
                      fontFamily: 'ManropeBold',
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const DynamicVerticalSpace(20),

            Text(
                'is comprehensive protection included for free with every booking.'
                    .tr()),
            const DynamicVerticalSpace(20),
            divder(),
            const DynamicVerticalSpace(20),
            Text(
              'Booking Protection Guarantee'.tr(),
              style: smallTitle,
            ),
            const DynamicVerticalSpace(5),
            Text(
              "In the unlikely event a Host needs to cancel your booking within 30 days of check-in, we'll find you a similar or better home, or we'll refund you."
                  .tr(),
              style: const TextStyle(wordSpacing: 3, height: 1.5),
            ),
            const DynamicVerticalSpace(20),
            //--
            Text(
              'Check-In Guarantee'.tr(),
              style: smallTitle,
            ),
            const DynamicVerticalSpace(5),

            Text(
              "If you can't check into your home and the Host cannot resolve the issue, we'll find you a similar or better home for the length of your original stay, or we'll refund you."
                  .tr(),
              style: const TextStyle(wordSpacing: 3, height: 1.5),
            ),
            const DynamicVerticalSpace(20),
            //--
            Text(
              'Get-What-You-Booked Guarantee'.tr(),
              style: smallTitle,
            ),
            const DynamicVerticalSpace(10),
            Text(
              "If at any time during your stay you find your listing isn't as advertised-for example, the refrigerator stops working and your Host can't easily fix it, or it has fewer bedrooms than listed you'll have three days to report it and we'll find you a similar or better home, or we'll refund you."
                  .tr(),
              style: const TextStyle(wordSpacing: 3, height: 1.5),
            ),
            const DynamicVerticalSpace(20),
            //--
            Text(
              '24-hour Satety Line'.tr(),
              style: smallTitle,
            ),
            const DynamicVerticalSpace(10),
            Text(
              "If you ever feel unsafe, you'll get priority access to specially-trained safety agents, day or night."
                  .tr(),
              style: const TextStyle(wordSpacing: 3, height: 1.5),
            ),
          ],
        ),
      );
    });
  }

  Widget divder() {
    return const Divider(
      color: Colors.black,
    );
  }
}
