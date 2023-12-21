import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart';

import '../../../../contstant/colors.dart';
import '../../../../utiles/spacer.dart';

class ParticipantLimitReached extends StatelessWidget {
  final Room meeting;
  const ParticipantLimitReached({Key? key, required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "OOPS!".tr(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const VerticalSpacer(20),
            Text(
              "Maximun 2 participants can join this meeting".tr(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            const VerticalSpacer(10),
            Text(
              "Please try again later".tr(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const VerticalSpacer(20),
            MaterialButton(
              onPressed: () {
                meeting.leave();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: purple,
              child: Text("Ok".tr(), style: const TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
