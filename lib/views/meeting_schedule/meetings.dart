import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../models/user.dart';
import '../../contstant/colors.dart';
import 'logic.dart';
import 'meeting_card.dart';
import 'schedule_meeting.dart';

class Meetings extends StatefulWidget {
  const Meetings(
      {super.key,
      required this.currentUser,
      required this.reciever,
      this.fromChat = false});
  final UserModel? reciever;
  final UserModel currentUser;
  final bool fromChat;
  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MeetingLogic());
    return Scaffold(
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
          'Meetings'.tr(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder(
          future: controller
              .fetchMeetings(widget.fromChat ? widget.reciever!.uid : null),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  MeetingCard(meeting: snapshot.data![index]),
            );
          },
        ),
      )),
      floatingActionButton: widget.reciever != null
          ? ElevatedButton(
              onPressed: () async {
                await Get.to(() => ScheduleMeeting(
                      currentUser: widget.currentUser,
                      reciever: widget.reciever!,
                    ));
                setState(() {});
              },
              child:  Text('Set Meeting'.tr()),
            )
          : const SizedBox(),
    );
  }
}
