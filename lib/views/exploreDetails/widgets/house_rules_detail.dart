import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../global_widgets/dvider.dart';
import '../../../models/explore_model.dart';
import '../../../models/house_rules_model.dart';
import '../../hosting/house_rules/scaffold.dart';

class HouseRulesDetail extends StatelessWidget {
  const HouseRulesDetail(
      {super.key, required this.exploreModel, required this.houseRulesLogic});
  final HouseRulesModel? houseRulesLogic;
  final ExploreModel exploreModel;
  @override
  Widget build(BuildContext context) {
    if (houseRulesLogic == null) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Center(
          child: Text('Not House Rules'.tr()),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'House Rules'.tr(),
                      style: largeTitle,
                    )),
                const VerticalSpace25px(),

                //1
                const DynamicVerticalSpace(50),
                ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Pets allowed'.tr(),
                      ),
                    ),
                    subtitle: Text(
                        "You can refuse pets, but must reasonably accommodate assistance animals."
                            .tr()),
                    trailing: HouseRulesCheckCross(
                      isSelected: houseRulesLogic!.isPetAllowed,
                      crossOnTab: () {
                        // setState(() {
                        //   houseRulesLogic.isPetAllowed = false;
                        // });
                      },
                      checkOnTab: () {
                        // setState(() {
                        //   houseRulesLogic.isPetAllowed = true;
                        // });
                      },
                    )),

                const DynamicVerticalSpace(5),
                const DviderApp(),
                //2
                const DynamicVerticalSpace(5),

                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Events Allowed'.tr(),
                    ),
                  ),
                  trailing: HouseRulesCheckCross(
                    isSelected: houseRulesLogic!.isEventAllowed,
                    crossOnTab: () {
                      // setState(() {
                      //   houseRulesLogic.isEventAllowed = false;
                      // });
                    },
                    checkOnTab: () {
                      // setState(() {
                      //   houseRulesLogic.isEventAllowed = true;
                      // });
                    },
                  ),
                ),
                const DynamicVerticalSpace(5),

                const DviderApp(),
                //3
                const DynamicVerticalSpace(5),

                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Smoking, vaping, e-cigarettes allowed'.tr(),
                    ),
                  ),
                  trailing: HouseRulesCheckCross(
                    isSelected: houseRulesLogic!.isSmookingAllowed,
                    crossOnTab: () {
                      // setState(() {
                      //   houseRulesLogic.isSmokingVapingAllowed = false;
                      // });
                    },
                    checkOnTab: () {
                      // setState(() {
                      //   houseRulesLogic.isSmokingVapingAllowed = true;
                      // });
                    },
                  ),
                ),
                const DynamicVerticalSpace(5),

                const DviderApp(),
                //4
                const DynamicVerticalSpace(5),

                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Quiet hours'.tr(),
                    ),
                  ),
                  trailing: HouseRulesCheckCross(
                    isSelected: houseRulesLogic!.isSetQuithours,
                    crossOnTab: () {
                      // setState(() {
                      //   houseRulesLogic.isSetQuietHours = false;
                      // });
                    },
                    checkOnTab: () {
                      // setState(() {
                      //   houseRulesLogic.isSetQuietHours = true;
                      // });
                    },
                  ),
                ),
                if (houseRulesLogic!.isSetQuithours != null &&
                    houseRulesLogic!.isSetQuithours!)
                  const DynamicVerticalSpace(5),
                if (houseRulesLogic!.isSetQuithours != null &&
                    houseRulesLogic!.isSetQuithours!)
                  const QuietHours(),
                const DynamicVerticalSpace(5),

                const DviderApp(),
                //5
                const DynamicVerticalSpace(5),

                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Commercial photography and filming allowed'.tr(),
                    ),
                  ),
                  trailing: HouseRulesCheckCross(
                    isSelected: houseRulesLogic!.isCommercialPhotoGraphyAllowed,
                    crossOnTab: () {
                      // setState(() {
                      //   houseRulesLogic.isCommercialPhotographyFilmingAllowed =
                      //       false;
                      // });
                    },
                    checkOnTab: () {
                      // setState(() {
                      //   houseRulesLogic.isCommercialPhotographyFilmingAllowed =
                      //       true;
                      // });
                    },
                  ),
                ),
                const DynamicVerticalSpace(60)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
