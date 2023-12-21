import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/views/exploreDetails/report_listing/somethingelse.dart';
import 'package:klomi/views/exploreDetails/report_listing/we_got_your_report.dart';
import 'package:klomi/views/exploreDetails/report_listing/why_scam.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../utiles/math_utils.dart';
import 'describe_how_inaccurate.dart';
import 'offensive.dart';

class WhyReporting extends StatefulWidget {
  const WhyReporting({super.key});

  @override
  State<WhyReporting> createState() => _WhyReportingState();
}

class _WhyReportingState extends State<WhyReporting> {
  ReportingEnum? reportingEnum;
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
              'Why are you reporting this listing?'.tr(),
              style: largeTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("This won't be shared with the Host.".tr()),
            const SizedBox(
              height: 20,
            ),
            RortingListTile(
              title: "It's inaccurate or incorrect".tr(),
              isSelected: reportingEnum == ReportingEnum.inaccurate,
              onTap: () {
                setState(() {
                  reportingEnum = ReportingEnum.inaccurate;
                });
              },
            ),
            const DviderApp(),
            RortingListTile(
              title: "It's not a real place to stay".tr(),
              isSelected: reportingEnum == ReportingEnum.notReal,
              onTap: () {
                setState(() {
                  reportingEnum = ReportingEnum.notReal;
                });
              },
            ),
            const DviderApp(),
            RortingListTile(
              title: "It's a scam".tr(),
              isSelected: reportingEnum == ReportingEnum.scam,
              onTap: () {
                setState(() {
                  reportingEnum = ReportingEnum.scam;
                });
              },
            ),
            const DviderApp(),
            RortingListTile(
              title: "It's offensive".tr(),
              isSelected: reportingEnum == ReportingEnum.offensive,
              onTap: () {
                setState(() {
                  reportingEnum = ReportingEnum.offensive;
                });
              },
            ),
            const DviderApp(),
            RortingListTile(
              title: "It's something else".tr(),
              isSelected: reportingEnum == ReportingEnum.somethingElse,
              onTap: () {
                setState(() {
                  reportingEnum = ReportingEnum.somethingElse;
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
                              if (reportingEnum == ReportingEnum.inaccurate) {
                                Get.to(() => const DescribeHowItIsInaccurate());
                              } else if (reportingEnum ==
                                  ReportingEnum.notReal) {
                                Get.to(() => const WeGotYourReport());
                              } else if (reportingEnum == ReportingEnum.scam) {
                                Get.to(() => const WhyScam());
                              } else if (reportingEnum ==
                                  ReportingEnum.offensive) {
                                Get.to(() => const Offensive());
                              } else {
                                Get.to(() => const SomeThingElse());
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

class RortingListTile extends StatelessWidget {
  const RortingListTile(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onTap});
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title),
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

enum ReportingEnum { inaccurate, notReal, scam, offensive, somethingElse }
