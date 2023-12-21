import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/views/exploreDetails/report_listing/we_got_your_report.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../utiles/math_utils.dart';

class SomeThingElse extends StatefulWidget {
  const SomeThingElse({super.key});

  @override
  State<SomeThingElse> createState() => _SomeThingElseState();
}

class _SomeThingElseState extends State<SomeThingElse> {
  SomeThingElseEnum? reportingEnum;
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
              height: 20,
            ),
            SomeThingElseListTile(
              title: "Something on this page is broken".tr(),
              isSelected: reportingEnum == SomeThingElseEnum.isBroken,
              onTap: () {
                setState(() {
                  reportingEnum = SomeThingElseEnum.isBroken;
                });
              },
            ),
            const DviderApp(),
            SomeThingElseListTile(
              title: "The host is asking for more money".tr(),
              isSelected: reportingEnum == SomeThingElseEnum.askingForMoney,
              onTap: () {
                setState(() {
                  reportingEnum = SomeThingElseEnum.askingForMoney;
                });
              },
            ),
            const DviderApp(),
            SomeThingElseListTile(
              title: "It doesn't look clean or safe".tr(),
              isSelected: reportingEnum == SomeThingElseEnum.notLookSafe,
              onTap: () {
                setState(() {
                  reportingEnum = SomeThingElseEnum.notLookSafe;
                });
              },
            ),
            const DviderApp(),
            SomeThingElseListTile(
              title: "It's a duplicate listing".tr(),
              isSelected: reportingEnum == SomeThingElseEnum.duplicate,
              onTap: () {
                setState(() {
                  reportingEnum = SomeThingElseEnum.duplicate;
                });
              },
            ),
            const DviderApp(),
            SomeThingElseListTile(
              title: "I don't think it's allowed in my neighborhood".tr(),
              isSelected:
                  reportingEnum == SomeThingElseEnum.notAllowedNeighborhood,
              onTap: () {
                setState(() {
                  reportingEnum = SomeThingElseEnum.notAllowedNeighborhood;
                });
              },
            ),
            const DviderApp(),
            SomeThingElseListTile(
              title: "It's disturbing my neighborhood".tr(),
              isSelected:
                  reportingEnum == SomeThingElseEnum.disturbingNeighborhood,
              onTap: () {
                setState(() {
                  reportingEnum = SomeThingElseEnum.disturbingNeighborhood;
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
                              Get.to(() => const WeGotYourReport());
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

class SomeThingElseListTile extends StatelessWidget {
  const SomeThingElseListTile(
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

enum SomeThingElseEnum {
  isBroken,
  askingForMoney,
  notLookSafe,
  duplicate,
  notAllowedNeighborhood,
  disturbingNeighborhood
}
