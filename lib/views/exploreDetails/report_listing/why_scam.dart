import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/views/exploreDetails/report_listing/we_got_your_report.dart';
import 'package:klomi/views/exploreDetails/report_listing/why_scam/where_did_they_advertise.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../utiles/math_utils.dart';
import 'why_scam/how_did_ask_for_pay.dart';
import 'why_scam/what_is_misleading.dart';
import 'why_scam/where_did_share_contact.dart';

class WhyScam extends StatefulWidget {
  const WhyScam({super.key});

  @override
  State<WhyScam> createState() => _WhyScamState();
}

class _WhyScamState extends State<WhyScam> {
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
              "Why do you think it's a scam?".tr(),
              style: largeTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            WhyScamListTile(
              title: "The host asked me to pay outside of klomi".tr(),
              subTitle: "Ex: Wire transfer, cash, bank transfer".tr(),
              isSelected: reportingEnum == WhyScamEnum.outSidePay,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.outSidePay;
                });
              },
            ),
            const DviderApp(),
            WhyScamListTile(
              title: "The host shared their contact information".tr(),
              subTitle: "Ex: Personal email or phone number".tr(),
              isSelected: reportingEnum == WhyScamEnum.shareContactInfo,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.shareContactInfo;
                });
              },
            ),
            const DviderApp(),
            WhyScamListTile(
              title: "The host is advertising other services".tr(),
              subTitle: "Ex: Links ot non-klomi websites".tr(),
              isSelected: reportingEnum == WhyScamEnum.otherServices,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.otherServices;
                });
              },
            ),
            const DviderApp(),
            WhyScamListTile(
              title: "It's duplicate lisitng".tr(),
              subTitle: "Ex: Copies all or part of another listing".tr(),
              isSelected: reportingEnum == WhyScamEnum.duplicate,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.duplicate;
                });
              },
            ),
            const DviderApp(),
            WhyScamListTile(
              title: "It's misleading",
              subTitle: "Ex: Photos don't match description, stock photos".tr(),
              isSelected: reportingEnum == WhyScamEnum.misleading,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.misleading;
                });
              },
            ),
            const DviderApp(),
            WhyScamListTile(
              title: "It's something else".tr(),
              subTitle: "",
              isSelected: reportingEnum == WhyScamEnum.somethingElse,
              onTap: () {
                setState(() {
                  reportingEnum = WhyScamEnum.somethingElse;
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
                              if (reportingEnum == WhyScamEnum.outSidePay) {
                                Get.to(() => const HowDidTheyAskYouToPay());
                              } else if (reportingEnum ==
                                  WhyScamEnum.shareContactInfo) {
                                Get.to(() =>
                                    const WhereDidTheyShareTheirContactInformation());
                              } else if (reportingEnum ==
                                  WhyScamEnum.otherServices) {
                                Get.to(() => const WhereDidTheyAdvertise());
                              } else if (reportingEnum ==
                                  WhyScamEnum.duplicate) {
                                Get.to(() => const WeGotYourReport());
                              } else if (reportingEnum ==
                                  WhyScamEnum.misleading) {
                                Get.to(() => const WhatIsMisldeading());
                              } else {
                                Get.to(() => const WeGotYourReport());
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
  outSidePay,
  shareContactInfo,
  otherServices,
  duplicate,
  misleading,
  somethingElse
}
