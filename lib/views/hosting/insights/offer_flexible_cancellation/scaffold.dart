import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class OfferFlexibleCancellation extends StatelessWidget {
  const OfferFlexibleCancellation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Why it's smart to offer flexible cancellations".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Flexible cancellation policies can give guests peace of mind.'
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              flexibleCancellationImagePath,
              fit: BoxFit.fill,
            ),
          ),
          const DynamicVerticalSpace(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "This year, we’re focused on helping you attract guests for future travel, which includes letting you know about travel trends on Klomi."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "We’ve shared that many guests are searching for local stays right now. Those who are thinking about traveling later on are understandably wanting more flexibility to rebook or cancel reservations."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "We’ve gathered everything you need to know about offering guests more flexibility, so they can book your space with confidence."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'How can hosts offer more flexibility?'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Travel restrictions and general uncertainty can make it hard to plan. Consider updating your cancellation policy to help guests feel more comfortable during the booking process. The ability to modify or cancel a reservation may encourage them to book."
                        .tr()
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "If you have a strict policy in place, you can switch to a flexible, moderate, or firm policy by changing your settings on your Listings page. You can always go back to your strict cancellation policy as needed."
                        .tr()
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "According to our latest data, Hosts who switched from a strict or moderate cancellation policy to a flexible policy after March 2023 saw increases in next-month bookings of 10% or more.*"
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'What should I know about these cancellation polices?'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Flexible cancellation policies may allow guests to get a full refund, including all fees (like the Klomi service fee or any cleaning fee** charged by the Host), when they cancel at least 24 hours before the listing’s local check-in time. Please check this page to find out exactly how cancellations work for stays."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'How will Klomi support me if i change my cancellation policy to offer more flexibility?'
                      .tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "We have policies and support in place to help you manage cancellations. If you’re concerned about cancellations, we recommend that you read our tips for managing cancellations."
                        .tr()
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "We’ve rolled out a search filter to show listings with cancellation flexibility, so guests can easily find the ones that best suit their needs."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "During times of uncertainty, offering more flexible cancellation options can be one way to help you attract guests for future travel. Please note that this policy may change due to updates made by local communities and relevant authorities."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "We’ll keep sharing more travel trends, hosting tips, and new tools to support your hosting business, and we’re also answering all of your top questions here. As always, thank you for being part of the Klomi community."
                        .tr()),
                const DynamicVerticalSpace(12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
