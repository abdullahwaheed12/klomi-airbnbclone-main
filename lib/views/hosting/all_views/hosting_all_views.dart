import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/views/hosting/calendar/scaffold.dart';
import 'package:klomi/views/hosting/host_trip/trips_host.dart';
import 'package:klomi/views/hosting/inbox/scaffold.dart';
import 'package:klomi/views/hosting/menu/scaffold.dart';
import 'package:klomi/views/hosting/today/scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../contstant/colors.dart';
import '../insights/scaffold.dart';

class HostingAllViews extends StatefulWidget {
  const HostingAllViews({Key? key, this.selectedIndex = 0}) : super(key: key);
  final int selectedIndex;
  @override
  State<HostingAllViews> createState() => _HostingAllViewsState();
}

class _HostingAllViewsState extends State<HostingAllViews> {
  static const List<Widget> _pages = <Widget>[
    Today(),
    HostInbox(),
    HostCalendar(),
    Insights(),
    TripsHost(),
    HostMenu(),
  ];
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;

    Get.find<GeneralGetxController>().getCurrentUserData();
    Get.find<GeneralGetxController>().getCurrentHostBookings();
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
            icon: const Icon(Icons.today),
            label: 'Today'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            label: 'inbox'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month),
            label: 'Calendar'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.line_axis),
            label: 'insights'.tr(),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu),
            label: 'Menu'.tr(),
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
