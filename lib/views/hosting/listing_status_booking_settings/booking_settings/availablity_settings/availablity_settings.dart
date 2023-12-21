import 'package:klomi/views/hosting/listing_status_booking_settings/booking_settings/availablity_settings/logic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../models/explore_model.dart';
import 'widgets/availability_window.dart';
import 'widgets/preparation_time.dart';
import 'widgets/same_day_cut_off_time.dart';
import 'widgets/advance_notice.dart';

class AvailabilitySettings extends StatefulWidget {
  const AvailabilitySettings({
    Key? key,
    required this.exploreModel,
  }) : super(key: key);
  final ExploreModel exploreModel;

  @override
  State<AvailabilitySettings> createState() => _AvailabilitySettingsState();
}

class _AvailabilitySettingsState extends State<AvailabilitySettings> {
  @override
  void initState() {
    super.initState();
    var controller = Get.put(AvaibilitySettingsLogic());
    print('controller ${widget.exploreModel.availbilitySettingsModel}');
    if (widget.exploreModel.availbilitySettingsModel != null) {
      controller.advanceNoticeInDays =
          widget.exploreModel.availbilitySettingsModel!.advanceNoticeInDays;

      controller.availbilityWindow =
          widget.exploreModel.availbilitySettingsModel!.availbilityWindow;

      controller.preparationTime =
          widget.exploreModel.availbilitySettingsModel!.preparationTime;

      controller.sameDayCutoffTime =
          widget.exploreModel.availbilitySettingsModel!.sameDayCutoffTime;
      controller.update();
    }
  }

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
          child: GetBuilder<AvaibilitySettingsLogic>(builder: (controller) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DynamicVerticalSpace(30),
                  Text(
                    'Availablity settings'.tr(),
                    style: largeTitle,
                  ),
                  const DynamicVerticalSpace(50),
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const AdvanceNotice(),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Avance notice'.tr(),
                          style: smallTitle,
                        ),
                        const DynamicVerticalSpace(5),
                        Text('How much notice you need before a guest arrives?'
                            .tr()),
                        const DynamicVerticalSpace(8),
                        Text(
                          controller.advanceNoticeInDays == null
                              ? 'Same day'.tr()
                              : "At least ${controller.advanceNoticeInDays} day's notice",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w100),
                        ),
                        const DynamicVerticalSpace(10),
                      ],
                    ),
                  ),

                  //--
                  const DviderApp(),
                  //--
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const SameDayCutOffTime(),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const DynamicVerticalSpace(20),
                        Text(
                          'Same day cutoff time'.tr(),
                          style: smallTitle,
                        ),
                        const DynamicVerticalSpace(5),
                        Text('Same day requests after this time will be blooked'
                            .tr()),
                        const DynamicVerticalSpace(10),
                        Text(
                          controller.sameDayCutoffTime == null
                              ? 'Any Time'
                              : '${controller.sameDayCutoffTime!.hour}:00',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w100),
                        ),
                        const DynamicVerticalSpace(10),
                      ],
                    ),
                  ),
                  //--
                  const DviderApp(),
                  //--
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const PreparationTime(),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const DynamicVerticalSpace(20),
                        Text(
                          'Preparation time'.tr(),
                          style: smallTitle,
                        ),
                        const DynamicVerticalSpace(5),
                        Text(
                            'Automatically blok your calendar before and after every reservation'
                                .tr()),
                        const DynamicVerticalSpace(8),
                        Text(
                          controller.preparationTime == null
                              ? 'None'.tr()
                              : 'For ${controller.preparationTime} night before and after',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w100),
                        ),
                        const DynamicVerticalSpace(10),
                      ],
                    ),
                  ),
                  //--
                  const DviderApp(),
                  //--
                  InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const AvailabilityWindow(),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const DynamicVerticalSpace(20),
                        Text(
                          'Availability window'.tr(),
                          style: smallTitle,
                        ),
                        const DynamicVerticalSpace(5),
                        Text('How far into the future can guests book?'.tr()),
                        const DynamicVerticalSpace(8),
                        Text(
                          controller.availbilityWindow == null
                              ? 'All future dates'
                              : '${controller.availbilityWindow} months in advance'
                                  .tr(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w100),
                        ),
                        const DynamicVerticalSpace(10),
                      ],
                    ),
                  ),

                  const DviderApp(),
                  const DynamicVerticalSpace(20),
                ]);
          }),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Get.find<AvaibilitySettingsLogic>()
                .updateAvailability(widget.exploreModel.adId);
          },
          child: Text(
            'Save'.tr(),
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
