import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../chats/views/chatrooms.dart';

class HostInbox extends StatelessWidget {
  const HostInbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Inbox'.tr(),
            style: mediumTitle,
          ),
          const Expanded(child: ChatRoom()),
        ],
      ),
    ));
  }
}
