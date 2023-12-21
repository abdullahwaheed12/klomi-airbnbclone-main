import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(
      //     color: Colors.black,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       'Notifications'.tr(),
            //       style: largeTitle,
            //     )),
            const Spacer(),
            const Icon(
              Icons.notifications_none,
              size: 35,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'No notifications yet'.tr(),
              style: smallTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You've got a blank slate (for now). We'll let you know when update arrive!"
                    .tr(),
                style: mediumDesc,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
