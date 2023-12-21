import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../global_widgets/empty_space_widget.dart';
import '../../../models/user.dart';
import '../../contstant/colors.dart';
import '../../utiles/spacer.dart';
import 'logic.dart';

class ScheduleMeeting extends StatefulWidget {
  const ScheduleMeeting(
      {super.key, required this.reciever, required this.currentUser});
  final UserModel reciever;
  final UserModel currentUser;

  @override
  State<ScheduleMeeting> createState() => _ScheduleMeetingState();
}

class _ScheduleMeetingState extends State<ScheduleMeeting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            )),
        title: Text(
          'Schedule Meeting'.tr(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<MeetingLogic>(
            init: MeetingLogic(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DynamicVerticalSpace(40),
                    Text(
                      'Meeting title'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const DynamicVerticalSpace(12),

                    TextFormField(
                        controller: controller.titleTEC,
                        decoration: InputDecoration(
                          hintText: 'Enter meeting title'.tr(),
                        ),
                        validator: (value) {
                          return null;
                        }),
                    const VerticalSpace25px(),
                    //--
                    Text(
                      'Meeting agenda'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const DynamicVerticalSpace(12),

                    TextFormField(
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: 'Enter meeting agenda'.tr(),
                        ),
                        controller: controller.agendaTEC,
                        validator: (value) {
                          return null;
                        }),
                    const VerticalSpace25px(),
                    //--
                    Text(
                      'Meeting date'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const DynamicVerticalSpace(12),
                    MaterialButton(
                      onPressed: () {
                        controller.selectDate(context);
                      },
                      elevation: 0,
                      height: 56,
                      color: Colors.white,
                      splashColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Expanded(
                              child: controller.dateTime == null
                                  ? Text(
                                      'Select date'.tr(),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )
                                  : Text(controller.dateTime!
                                      .toString()
                                      .substring(0, 10))),
                          const Icon(Icons.arrow_drop_down),
                          const HorizontalSpacer(20)
                        ],
                      ),
                    ),
                    const VerticalSpace25px(),
                    //--
                    Text(
                      'Starting time'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const DynamicVerticalSpace(12),
                    MaterialButton(
                      onPressed: () {
                        controller.selectStartingTime(context);
                      },
                      elevation: 0,
                      height: 56,
                      color: Colors.white,
                      splashColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Expanded(
                              child: controller.startTime == null
                                  ? Text(
                                      'Select time'.tr(),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )
                                  : Text(controller.startTime!
                                      .toString()
                                      .substring(10, 16))),
                          const Icon(Icons.arrow_drop_down),
                          const HorizontalSpacer(20)
                        ],
                      ),
                    ),

                    const VerticalSpace25px(),
                    //--
                    Text(
                      'End time'.tr(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const DynamicVerticalSpace(12),

                    MaterialButton(
                      onPressed: () {
                        controller.selectEndingTime(context);
                      },
                      elevation: 0,
                      height: 56,
                      color: Colors.white,
                      splashColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Expanded(
                              child: controller.endTime == null
                                  ? Text(
                                      'Select time'.tr(),
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )
                                  : Text(controller.endTime!
                                      .toString()
                                      .substring(10, 16))),
                          const Icon(Icons.arrow_drop_down),
                          const HorizontalSpacer(20)
                        ],
                      ),
                    ),

                    const VerticalSpace25px(),
                    //--
                  ],
                ),
              );
            }),
      )),
      floatingActionButton: ElevatedButton(
        onPressed: () => Get.find<MeetingLogic>().saveMeeting(
            context: context,
            currentUser: widget.currentUser,
            recevier: widget.reciever),
        child: Text('Save'.tr()),
      ),
    );
  }
}
