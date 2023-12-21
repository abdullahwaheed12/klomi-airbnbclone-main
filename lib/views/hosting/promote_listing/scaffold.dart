import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utiles/math_utils.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({super.key});

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Promote your listing'.tr(),
                    style: largeTitle,
                  )),
              const VerticalSpace25px(),
              Text(
                  'Offering discounts could help attract guests and get your first reviews.'
                      .tr()),
              const VerticalSpace25px(),
              ListTile(
                title: Text('Set a weekly discount'.tr()),
                subtitle: Text('Not set'.tr()),
                trailing: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const WeeklyDiscount());
                  },
                  child: Text(
                    'Edit'.tr(),
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const DviderApp(),
              ListTile(
                title: Text('Set a monthly discount'.tr()),
                subtitle: Text('Not set'.tr()),
                trailing: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const MonthlyDiscount());
                  },
                  child: Text(
                    'Edit'.tr(),
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MonthlyDiscount extends StatelessWidget {
  const MonthlyDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.clear)),
          const DynamicVerticalSpace(20),
          Text(
            'Monthly discount'.tr(),
            style: mediumTitle,
          ),
          const DynamicVerticalSpace(20),
          Text(
            'This discount will apply to reservations that are 28 days or longer'
                .tr(),
            style: smallDesc,
          ),
          const DynamicVerticalSpace(10),
          TextField(
            decoration:
                InputDecoration(hintText: 'Enter discount in percentage'.tr()),
          ),
          const DynamicVerticalSpace(20),
          Text(
            'Average discount in your area: 49%'.tr(),
            style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
          const DynamicVerticalSpace(20),
          Text(
            'Your average price with a 605 discount is US 9 dollar/month.'.tr(),
            style: smallDesc,
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: size.width,
            height: 72,
            child: Column(
              children: [
                const DviderApp(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel'.tr(),
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 45),
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Confirm'.tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WeeklyDiscount extends StatelessWidget {
  const WeeklyDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.clear)),
          const DynamicVerticalSpace(20),
          Text(
            'Weekly discount'.tr(),
            style: mediumTitle,
          ),
          const DynamicVerticalSpace(20),
          Text(
            'This discount will apply to reservations that are 7 days or longer'
                .tr(),
            style: smallDesc,
          ),
          const DynamicVerticalSpace(10),
          TextField(
            decoration:
                InputDecoration(hintText: 'Enter discount in percentage'.tr()),
          ),
          const DynamicVerticalSpace(20),
          Text(
            'Average discount in your area: 49%'.tr(),
            style: const TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold),
          ),
          const DynamicVerticalSpace(20),
          Text(
            'Your average price with a 0% discount is US 23 dollar/month.'.tr(),
            style: smallDesc,
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: size.width,
            height: 72,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DviderApp(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel'.tr(),
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 45),
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Confirm'.tr(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
