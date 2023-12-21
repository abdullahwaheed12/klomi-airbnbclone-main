import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/helper/app_toast.dart';
import 'package:klomi/views/allViews/all_views.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../utiles/math_utils.dart';

class WeGotYourReport extends StatefulWidget {
  const WeGotYourReport({super.key});

  @override
  State<WeGotYourReport> createState() => _WeGotYourReportState();
}

class _WeGotYourReportState extends State<WeGotYourReport> {
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
              "We got your report".tr(),
              style: largeTitle,
            ),
            const SizedBox(
              height: 15,
            ),
             Text(
              "Thanks for taking the time to let us know what's going on. Reports like yours help keep the klomi community safe and secure.".tr(),
            ),
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
                      onPressed: () {
                        Get.offAll(() => const AllViews());
                        AppToast.showToast(message: 'Submit report'.tr());
                      },
                      child: Text(
                        'Ok'.tr(),
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
