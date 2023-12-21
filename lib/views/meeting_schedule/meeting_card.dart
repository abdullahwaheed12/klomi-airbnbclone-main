import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../global_widgets/empty_space_widget.dart';
import '../../../../../utiles/math_utils.dart';
import '../../controllers/general_controller.dart';
import '../../contstant/colors.dart';
import '../../models/meeting.dart';
import '../../utiles/videosdk_utils/meeting_methods.dart';
import 'logic.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({
    super.key,
    required this.meeting,
  });
  final Meeting meeting;
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MeetingLogic>();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: getPadding(all: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Meeting title:'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const DynamicVerticalSpace(12),
              Text(
                meeting.meetingTitle.capitalize!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              //--
              const VerticalSpace25px(),
              Text(
                'Meeting with:'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const DynamicVerticalSpace(12),
              Text(
                meeting.user1Name.capitalizeFirst!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const VerticalSpace25px(),
              //--
              Text(
                'Meeting agenda:'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const DynamicVerticalSpace(12),
              Container(
                padding: const EdgeInsets.all(12),
                width: size.height,
                decoration: BoxDecoration(
                    color: const Color(0xffF2F3FC),
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  meeting.meetingAgenda.capitalizeFirst!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const VerticalSpace25px(),
              //--
              Text(
                controller.isBetween(meeting.start, meeting.end)
                    ? 'Meeting starting in:'.tr()
                    : 'Meeting ending in:'.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const DynamicVerticalSpace(12),
              CountdownTimer(
                  startTime: controller.isBetween(meeting.start, meeting.end)
                      ? meeting.start
                      : meeting.end),
              //--

              const VerticalSpace25px(),
              MaterialButton(
                onPressed: () {
                  if (controller.isBetween(meeting.start, meeting.end)) {
                    return;
                  }
                  joinLiveStreaming(
                      Get.find<GeneralGetxController>()
                          .currentUserModel!
                          .fullName,
                      meeting.meetingID,
                      context);
                },
                elevation: 0,
                height: 56,
                minWidth: size.width,
                color: controller.isBetween(meeting.start, meeting.end)
                    ? Colors.grey
                    : const Color(0xff4A4CD3),
                splashColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  controller.isBetween(meeting.start, meeting.end)
                      ? 'Join'.tr()
                      : 'Join'.tr(),
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),

              const DynamicVerticalSpace(12),
            ],
          ),
        ),
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  final DateTime startTime;

  const CountdownTimer({super.key, required this.startTime});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  String _remainingTime = '';

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateRemainingTime);
    _updateRemainingTime(_timer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateRemainingTime(Timer timer) {
    setState(() {
      Duration remaining = widget.startTime.difference(DateTime.now());

      if (remaining.isNegative) {
        _remainingTime = '';
      } else {
        int days = remaining.inDays;
        int hours = remaining.inHours.remainder(24);
        int minutes = remaining.inMinutes.remainder(60);
        int seconds = remaining.inSeconds.remainder(60);

        String daysString = days > 0 ? '$days days ' : '';
        String hoursString = hours > 0 ? '$hours hours ' : '';
        String minutesString = minutes > 0 ? '$minutes minutes ' : '';
        String secondsString = seconds > 0 ? '$seconds seconds' : '';

        _remainingTime =
            daysString + hoursString + minutesString + secondsString;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _remainingTime,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: const Color(0xff02CD03)),
    );
  }
}
