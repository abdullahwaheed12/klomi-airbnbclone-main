import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../models/explore_model.dart';

class LocalLaws extends StatelessWidget {
  const LocalLaws({super.key, required this.exploreModel});
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
              'Local laws'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(30),
            Text(
                "Take a moment to review the local laws that apply to your listing. We want to make sure you have everything you need to get off to a great start."
                    .tr()),
            const DynamicVerticalSpace(20),
            Text(
                "Most cities have rules covering homesharing, and the specific codes and ordinances can appear in many places (such as zoning, building, licensing or tax codes). In most places, you must register, get a permit, or obtain a license before you list your property or accept guests. You may also be responsible for collecting and remitting certain taxes. In some places, short-term rentals could be prohibited altogether."
                    .tr()),
            const DynamicVerticalSpace(20),
            Text(
                "Since you are responsible for your own decision to list or book, you should get comfortable with the applicable rules before listing on klomi. To get you started, we offer some helpful resources under \"Your City Laws.\" "
                    .tr()),
            const DynamicVerticalSpace(20),
            Text(
                "By accepting our Terms of Service and listing your space, you certify that you will follow applicable laws and regulations."
                    .tr()),
          ]),
        ),
      ),
    );
  }
}
