import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/views/exploreDetails/report_listing/offensive/abusive_hostile.dart';
import 'package:klomi/views/exploreDetails/report_listing/offensive/discriminatory.dart';
import 'package:klomi/views/exploreDetails/report_listing/offensive/inappropriate.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../utiles/math_utils.dart';

class Offensive extends StatefulWidget {
  const Offensive({super.key});

  @override
  State<Offensive> createState() => _OffensiveState();
}

class _OffensiveState extends State<Offensive> {
  WhyScamEnum? reportingEnum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Why do you think it's offensive?".tr(),
              style: largeTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            WhyScamListTile(
              title: "It's discriminatory".tr(),
              subTitle: "Ex: Recist, homophobic, sexist".tr(),
              isSelected: reportingEnum == WhyScamEnum.discriminatory,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.discriminatory;
                });
              },
            ),
            const DviderApp(),
            WhyScamListTile(
              title: "It's inappropriate".tr(),
              subTitle: "Ex: Sexually explicit, voilent, graphic".tr(),
              isSelected: reportingEnum == WhyScamEnum.inappropriate,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.inappropriate;
                });
              },
            ),
            const DviderApp(),
            WhyScamListTile(
              title: "It's abusive or hostile".tr(),
              subTitle: "Ex: Bullying, threats, verbal assaults".tr(),
              isSelected: reportingEnum == WhyScamEnum.abusiveORhostile,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.abusiveORhostile;
                });
              },
            ),
            const DviderApp(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.white,
        width: size.width,
        height: 104,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DviderApp(),
            Center(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width, 50),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: reportingEnum == null
                          ? null
                          : () {
                              if (reportingEnum == WhyScamEnum.discriminatory) {
                                Get.to(() => const DescribeDiscriminatory());
                              } else if (reportingEnum ==
                                  WhyScamEnum.inappropriate) {
                                Get.to(() => const DescribeInappropriate());
                              } else {
                                Get.to(() => const DescribeAbusiveHostile());
                              }
                            },
                      child: Text(
                        'Next'.tr(),
                        style: const TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WhyScamListTile extends StatelessWidget {
  const WhyScamListTile(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap,
      required this.subTitle});
  final String title;
  final String subTitle;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.black : Colors.grey.shade300,
              border: Border.all(color: Colors.grey.shade400)),
        ),
      ),
    );
  }
}

enum WhyScamEnum {
  discriminatory,
  inappropriate,
  abusiveORhostile,
}
