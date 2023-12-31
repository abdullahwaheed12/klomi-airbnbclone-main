import 'dart:async';

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:videosdk/videosdk.dart';

import '../../../../utiles/spacer.dart';
import '../../../../utiles/videosdk_utils/api.dart';
import 'recording_indicator.dart';

class MeetingAppBar extends StatefulWidget {
  final String token;
  final Room meeting;
  final String recordingState;
  final bool isFullScreen;
  const MeetingAppBar(
      {Key? key,
      required this.meeting,
      required this.token,
      required this.isFullScreen,
      required this.recordingState})
      : super(key: key);

  @override
  State<MeetingAppBar> createState() => MeetingAppBarState();
}

class MeetingAppBarState extends State<MeetingAppBar> {
  Duration? elapsedTime;
  Timer? sessionTimer;

  List<MediaDeviceInfo> cameras = [];

  @override
  void initState() {
    startTimer();
    // Holds available cameras info
    cameras = widget.meeting.getCameras();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        crossFadeState: !widget.isFullScreen
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        secondChild: const SizedBox.shrink(),
        firstChild: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Row(
            children: [
              if (widget.recordingState == "RECORDING_STARTING" ||
                  widget.recordingState == "RECORDING_STOPPING" ||
                  widget.recordingState == "RECORDING_STARTED")
                RecordingIndicator(recordingState: widget.recordingState),
              if (widget.recordingState == "RECORDING_STARTING" ||
                  widget.recordingState == "RECORDING_STOPPING" ||
                  widget.recordingState == "RECORDING_STARTED")
                const HorizontalSpacer(),
              Expanded(
                child: Text(
                  elapsedTime == null
                      ? "00:00:00"
                      : elapsedTime.toString().split(".").first,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/ic_switch_camera.svg",
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  MediaDeviceInfo newCam = cameras.firstWhere((camera) =>
                      camera.deviceId != widget.meeting.selectedCamId);
                  widget.meeting.changeCam(newCam.deviceId);
                },
              ),
            ],
          ),
        ));
  }

  Future<void> startTimer() async {
    dynamic session = await fetchSession(widget.token, widget.meeting.id);
    DateTime sessionStartTime = DateTime.parse(session['start']);
    final difference = DateTime.now().difference(sessionStartTime);

    setState(() {
      elapsedTime = difference;
      sessionTimer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          debugPrint('metting time ${elapsedTime!.inSeconds}');
          if (elapsedTime?.inMinutes == 5) {
            widget.meeting.end();
          }
          setState(() {
            elapsedTime = Duration(
                seconds: elapsedTime != null ? elapsedTime!.inSeconds + 1 : 0);
          });
        },
      );
    });
  }

  @override
  void dispose() {
    if (sessionTimer != null) {
      sessionTimer!.cancel();
    }
    super.dispose();
  }
}
