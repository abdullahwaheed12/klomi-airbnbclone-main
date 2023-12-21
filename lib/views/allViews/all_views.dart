import 'package:firebase_auth/firebase_auth.dart';
import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/contstant/colors.dart';
import 'package:klomi/views/explore/explore.dart';
import 'package:klomi/views/whishlists/whishlists.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';

import '../../enums/calling_status.dart';
import '../../utiles/kyes.dart';
import '../../utiles/videosdk_utils/meeting_methods.dart';
import '../chats/views/chatrooms.dart';
import '../chats/views/empty_chat.dart';
import '../profile/scaffold.dart';
import '../trips_traveller/trips.dart';

class AllViews extends StatefulWidget {
  const AllViews({Key? key, this.selectedIndex = 0}) : super(key: key);
  final int selectedIndex;
  @override
  State<AllViews> createState() => _AllViewsState();
}

class _AllViewsState extends State<AllViews> {
  final List<Widget> _pages = <Widget>[
    const Explore(),
    const WhishListsScreen(),
    const Trips(),
    if (FirebaseAuth.instance.currentUser != null)
      const ChatRoom()
    else
      const EmptyChat(),
    const Profile(),
  ];
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
    Get.find<GeneralGetxController>().getCurrentUserData();
    if (GetStorage().read('callFromTerminateState') != null) {
      var data = GetStorage().read('callFromTerminateState');

      var mettingId = data[mettingIdKey];
      var displayName = data[displayNameKey];
      var callingId = data[callinIdKey];
      joinCalling(displayName, mettingId, callingId, context);
    }
    FlutterCallkitIncoming.onEvent.listen((event) async {
      if (event == null) return;
      if (event.event == Event.ACTION_CALL_ACCEPT) {
        var displayName = event.body['extra'][displayNameKey];
        var mettingId = event.body['extra'][mettingIdKey];
        var callingId = event.body['extra'][callinIdKey];
        await callingUpdate(callingId, CallingStatus.receive);
        if (mounted) {
          joinCalling(displayName, mettingId, callingId, context);
        }
      } else if (event.event == Event.ACTION_CALL_DECLINE) {
        GetStorage().remove('callFromTerminateState');
        var callingId = event.body['extra'][callinIdKey];
        callingUpdate(callingId, CallingStatus.decline);
        debugPrint('---->>>> ACTION_CALL_INCOMING ${event.body}');
      } else if (event.event == Event.ACTION_CALL_INCOMING) {
        debugPrint('---->>>> ACTION_CALL_INCOMING ${event.body}');
      } else if (event.event == Event.ACTION_CALL_TIMEOUT) {
        GetStorage().remove('callFromTerminateState');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'explore'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border_outlined),
            label: 'wishlists'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.travel_explore),
            label: 'trips'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            label: 'inbox'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_pin),
            label: 'profile'.tr(),
          ),
        ],
        currentIndex: _selectedIndex,
        iconSize: 20,
        onTap: _onItemTapped,
        backgroundColor: secondaryColor,
        elevation: 0.0,
        selectedItemColor: Colors.white70,
        selectedLabelStyle: const TextStyle(
            fontFamily: 'ManropeBold',
            fontSize: 12,
            color: Colors.white70,
            fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.white24,
        unselectedLabelStyle: const TextStyle(
            fontFamily: 'ManropeBold', fontSize: 11, color: Colors.black87),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
