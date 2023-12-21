import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../models/explore_model.dart';

class CheckInSettings extends StatelessWidget {
  const CheckInSettings({super.key, required this.exploreModel});
  final ExploreModel exploreModel;
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const DynamicVerticalSpace(30),
            Text(
              'Check-in-settings'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(20),
            Text('Check-in-window'.tr()),
            const DynamicVerticalSpace(15),
            //--
            Text('Arrive after'.tr()),
            Text(
              'Select a time'.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
            ),
            const DynamicVerticalSpace(15),
            const DviderApp(),
            const DynamicVerticalSpace(20),
            //--
            Text('Arrive before'.tr()),
            Text(
              'Select a time'.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
            ),
            const DynamicVerticalSpace(15),
            const DviderApp(),
            const DynamicVerticalSpace(20),
            Text(
              'Checkout'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(20),
            Text('Leave before'.tr()),
            Text(
              'Select a time'.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
            ),
            const DynamicVerticalSpace(15),
            const DviderApp(),
            const DynamicVerticalSpace(20),
            Text(
              'Days unavailable for check-in'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(20),

            Text(
              'Not set'.tr(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
            ),
          ]),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Save'.tr(),
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
