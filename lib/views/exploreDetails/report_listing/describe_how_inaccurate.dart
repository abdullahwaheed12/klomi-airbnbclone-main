import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../utiles/math_utils.dart';
import 'we_got_your_report.dart';

class DescribeHowItIsInaccurate extends StatefulWidget {
  const DescribeHowItIsInaccurate({super.key});

  @override
  State<DescribeHowItIsInaccurate> createState() =>
      _DescribeHowItIsInaccurateState();
}

class _DescribeHowItIsInaccurateState extends State<DescribeHowItIsInaccurate> {
  var descriptionTEC = TextEditingController();
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
              "Describe how it's inaccurate or incorrect".tr(),
              style: largeTitle,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Ex. This listing says it is entire home but actually a private room."
                  .tr(),
              style: smallDesc,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: descriptionTEC,
              maxLines: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            Text('${descriptionTEC.text.length} ${'characters'.tr()}',
                style: smallDesc),
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
                      onPressed: descriptionTEC.text.isEmpty
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
