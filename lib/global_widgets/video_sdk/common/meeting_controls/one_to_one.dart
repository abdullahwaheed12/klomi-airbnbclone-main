import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import 'package:videosdk/videosdk.dart';

import '../../../../contstant/colors.dart';

// Meeting ActionBar
class MeetingActionBarOneToOne extends StatelessWidget {
  // control states
  final bool isMicEnabled, isCamEnabled;

  // callback functions
  final void Function() onCallEndButtonPressed,
      onMicButtonPressed,
      onCameraButtonPressed;

  final void Function(TapDownDetails) onSwitchMicButtonPressed;
  final Room meeting;

  const MeetingActionBarOneToOne(
      {Key? key,
      required this.isMicEnabled,
      required this.isCamEnabled,
      required this.onCallEndButtonPressed,
      required this.onMicButtonPressed,
      required this.onSwitchMicButtonPressed,
      required this.onCameraButtonPressed,
      required this.meeting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => onCallEndButtonPressed(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: red),
                color: red,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.call_end,
                size: 30,
              ),
            ),
          ),

          // Mic Control
          TouchRippleEffect(
            borderRadius: BorderRadius.circular(12),
            rippleColor: isMicEnabled ? primaryColor : Colors.white,
            onTap: onMicButtonPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: secondaryColor),
                color: isMicEnabled ? primaryColor : Colors.white,
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(
                    isMicEnabled ? Icons.mic : Icons.mic_off,
                    size: 30,
                    color: isMicEnabled ? Colors.white : primaryColor,
                  ),
                  GestureDetector(
                      onTapDown: (details) =>
                          {onSwitchMicButtonPressed(details)},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: isMicEnabled ? Colors.white : primaryColor,
                        ),
                      )),
                ],
              ),
            ),
          ),

          // Camera Control
          // TouchRippleEffect(
          //   borderRadius: BorderRadius.circular(12),
          //   rippleColor: primaryColor,
          //   onTap: onCameraButtonPressed,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(12),
          //       border: Border.all(color: secondaryColor),
          //       color: isCamEnabled ? primaryColor : Colors.white,
          //     ),
          //     padding: const EdgeInsets.all(10),
          //     child: SvgPicture.asset(
          //       isCamEnabled
          //           ? "assets/ic_video.svg"
          //           : "assets/ic_video_off.svg",
          //       width: 26,
          //       height: 26,
          //       color: isCamEnabled ? Colors.white : primaryColor,
          //     ),
          //   ),
          // ),
          if (isCamEnabled)
            SwtichCamera(
              meeting: meeting,
            )
        ],
      ),
    );
  }

  // PopupMenuItem<dynamic> _buildMeetingPoupItem(
  //     String value, String title, String? description, Widget leadingIcon) {
  //   return PopupMenuItem(
  //     value: value,
  //     padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
  //     child: Row(children: [
  //       leadingIcon,
  //       const HorizontalSpacer(12),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(
  //             title,
  //             style: const TextStyle(
  //                 fontSize: 14,
  //                 fontWeight: FontWeight.w500,
  //                 color: Colors.white),
  //           ),
  //           if (description != null) const VerticalSpacer(4),
  //           if (description != null)
  //             Text(
  //               description,
  //               style: const TextStyle(
  //                   fontSize: 12, fontWeight: FontWeight.w500, color: black400),
  //             )
  //         ],
  //       )
  //     ]),
  //   );
  // }
}

class SwtichCamera extends StatefulWidget {
  const SwtichCamera({super.key, required this.meeting});
  final Room meeting;

  @override
  State<SwtichCamera> createState() => _SwtichCameraState();
}

class _SwtichCameraState extends State<SwtichCamera> {
  List<MediaDeviceInfo> cameras = [];
  @override
  void initState() {
    // Holds available cameras info
    cameras = widget.meeting.getCameras();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          MediaDeviceInfo newCam = cameras.firstWhere(
              (camera) => camera.deviceId != widget.meeting.selectedCamId);
          widget.meeting.changeCam(newCam.deviceId);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: secondaryColor),
          ),
          child: const Icon(
            Icons.flip_camera_ios_outlined,
            color: Colors.white,
          ),
        ));
  }
}
