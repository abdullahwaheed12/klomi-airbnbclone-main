import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/views/allViews/all_views.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videosdk/videosdk.dart';

import '../../../global_widgets/video_sdk/common/joining/waiting_to_join.dart';
import '../../../global_widgets/video_sdk/common/meeting_controls/one_to_one.dart';
import '../../../global_widgets/video_sdk/one-to-one/one_to_one_meeting_container.dart';
import '../../../utiles/videosdk_utils/meeting_methods.dart';
import '../../../utiles/videosdk_utils/toast.dart';
import '../../contstant/colors.dart';
import '../../enums/calling_status.dart';
import '../../helper/app_toast.dart';

// Meeting Screen
class OneToOneMeetingScreen extends StatefulWidget {
  final String meetingId, token, displayName, callingId;
  final bool micEnabled, camEnabled, chatEnabled, isCaller;
  const OneToOneMeetingScreen({
    Key? key,
    required this.isCaller,
    required this.meetingId,
    required this.token,
    required this.callingId,
    required this.displayName,
    this.micEnabled = true,
    this.camEnabled = true,
    this.chatEnabled = true,
  }) : super(key: key);

  @override
  _OneToOneMeetingScreenState createState() => _OneToOneMeetingScreenState();
}

class _OneToOneMeetingScreenState extends State<OneToOneMeetingScreen> {
  // Meeting
  late Room meeting;
  bool _joined = false;

  // Streams
  Stream? videoStream;
  Stream? audioStream;
  Stream? remoteParticipantShareStream;

  bool fullScreen = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Create instance of Room (Meeting)
    Room room = VideoSDK.createRoom(
      roomId: widget.meetingId,
      token: widget.token,
      displayName: widget.displayName,
      micEnabled: widget.micEnabled,
      camEnabled: widget.camEnabled,
      maxResolution: 'hd',
      multiStream: false,
      defaultCameraIndex: 1,
      notification: const NotificationInfo(
        title: "Klomi",
        message: "Klomi is sharing screen in the meeting",
        icon: "notification_share", // drawable icon name
      ),
    );

    // Register meeting events
    registerMeetingEvents(room);

    // Join meeting
    room.join();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: _joined
          ? Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: SafeArea(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('calling')
                        .doc(widget.callingId)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return  WaitingToJoin(
                          calling: 'Connecting...'.tr(),
                        );
                      }
                      var data = snapshot.data!.data()!;
                      String callinStatus = data['callingStatus'];
                      if (callinStatus == CallingStatus.calling.name) {
                        return  WaitingToJoin(
                          calling: 'Calling...'.tr(),
                        );
                      } else if (callinStatus == CallingStatus.running.name) {
                        return  WaitingToJoin(
                          calling: 'Ringing...'.tr(),
                        );
                      } else if (callinStatus == CallingStatus.decline.name) {
                        AppToast.showToast(message: 'Decline'.tr());
                        Navigator.pop(context);
                        return  WaitingToJoin(
                          calling: 'Decline'.tr(),
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                  onDoubleTap: () => {
                                        setState(() {
                                          fullScreen = !fullScreen;
                                        })
                                      },
                                  child: OneToOneMeetingContainer(
                                      meeting: meeting)),
                            ),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 300),
                              crossFadeState: !fullScreen
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              secondChild: const SizedBox.shrink(),
                              firstChild: MeetingActionBarOneToOne(
                                meeting: meeting,
                                isMicEnabled: audioStream != null,
                                isCamEnabled: videoStream != null,
                                // Called when Call End button is pressed
                                onCallEndButtonPressed: () {
                                  meeting.end();
                                },

                                // Called when mic button is pressed
                                onMicButtonPressed: () {
                                  if (audioStream != null) {
                                    meeting.muteMic();
                                  } else {
                                    meeting.unmuteMic();
                                  }
                                },
                                // Called when camera button is pressed
                                onCameraButtonPressed: () {
                                  if (videoStream != null) {
                                    meeting.disableCam();
                                  } else {
                                    meeting.enableCam();
                                  }
                                },

                                onSwitchMicButtonPressed: (details) async {
                                  List<MediaDeviceInfo> outptuDevice =
                                      meeting.getAudioOutputDevices();
                                  double bottomMargin =
                                      (70.0 * outptuDevice.length);
                                  final screenSize =
                                      MediaQuery.of(context).size;
                                  await showMenu(
                                    context: context,
                                    color: black700,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    position: RelativeRect.fromLTRB(
                                      screenSize.width -
                                          details.globalPosition.dx,
                                      details.globalPosition.dy - bottomMargin,
                                      details.globalPosition.dx,
                                      (bottomMargin),
                                    ),
                                    items: outptuDevice.map((e) {
                                      return PopupMenuItem(
                                          value: e, child: Text(e.label));
                                    }).toList(),
                                    elevation: 8.0,
                                  ).then((value) {
                                    if (value != null) {
                                      meeting.switchAudioDevice(value);
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ))
          :  WaitingToJoin(calling: 'Calling...'.tr()),
    );
  }

  // ignore: no_leading_underscores_for_local_identifiers
  void registerMeetingEvents(Room _meeting) {
    // Called when joined in meeting
    _meeting.on(
      Events.roomJoined,
      () {
        setState(() {
          meeting = _meeting;
          _joined = true;
        });
      },
    );

    // Called when meeting is ended
    _meeting.on(Events.roomLeft, (String? errorMsg) {
      if (errorMsg != null) {
        showSnackBarMessage(
            message: "${'Meeting left due to'.tr()} $errorMsg !!", context: context);
      }
      endCallFirebaseUpdate(widget.callingId);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const AllViews(),
          ),
          (route) => false);
    });

    // Called when stream is enabled
    _meeting.localParticipant.on(Events.streamEnabled, (Stream stream) {
      if (stream.kind == 'video') {
        setState(() {
          videoStream = stream;
        });
      } else if (stream.kind == 'audio') {
        setState(() {
          audioStream = stream;
        });
      }
    });

    // Called when stream is disabled
    _meeting.localParticipant.on(Events.streamDisabled, (Stream stream) {
      if (stream.kind == 'video' && videoStream?.id == stream.id) {
        setState(() {
          videoStream = null;
        });
      } else if (stream.kind == 'audio' && audioStream?.id == stream.id) {
        setState(() {
          audioStream = null;
        });
      }
    });

    _meeting.on(
        Events.error,
        (error) => {
              showSnackBarMessage(
                  message: "${error['name']} :: ${error['message']}",
                  context: context)
            });
  }

  Future<bool> _onWillPopScope() async {
    meeting.leave();
    return true;
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }
}
