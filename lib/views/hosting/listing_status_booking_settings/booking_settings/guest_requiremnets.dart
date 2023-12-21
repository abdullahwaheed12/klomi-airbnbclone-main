import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../models/explore_model.dart';

class GuestRequirements extends StatefulWidget {
  const GuestRequirements({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<GuestRequirements> createState() => _GuestRequirementsState();
}

class _GuestRequirementsState extends State<GuestRequirements> {
  var isPhoto = false;
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
              'Guest requirements'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(20),
            Text(
                'Klomi Aribnb has requirements that all guests must meet before booking:'
                    .tr()),
            const DynamicVerticalSpace(30),
            //--
            Text(
              "Klomi klomi's requirements".tr(),
              style: smallTitle,
            ),
            const DynamicVerticalSpace(5),

            Text(
              'Confiremd email,phone number,payment information'.tr(),
            ),
            const DynamicVerticalSpace(15),
            const DviderApp(),
            const DynamicVerticalSpace(20),
            //--
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Profile photo".tr(),
                      style: smallTitle,
                    ),
                    const DynamicVerticalSpace(5),
                    Text(
                      "If you turn on this requirement. you'll be able to access guest's profile photo after a booking is confirmed, but not befoer."
                          .tr(),
                    ),
                  ],
                )),
                Switch(
                  value: isPhoto,
                  onChanged: (value) {
                    isPhoto = !isPhoto;
                    setState(() {});
                  },
                )
              ],
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
