import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HostEmptyInbox extends StatelessWidget {
  const HostEmptyInbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Text('All messages'.tr()),
          const Spacer(),
          const Icon(Icons.message_outlined),
          const SizedBox(
            height: 20,
          ),
          Text(
            'No new messages'.tr(),
            style: smallTitle,
          ),
          const Spacer(),
        ],
      ),
    ));
  }
}
