import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListingStatusTabs extends StatelessWidget {
  const ListingStatusTabs({Key? key, required this.tabController})
      : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 60,
            child: TabBar(
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.black,
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              indicatorWeight: 2,
              unselectedLabelColor: Colors.black45,
              indicatorColor: Colors.black,
              controller: tabController,
              tabs: <Widget>[
                Text(
                  'Listing'.tr(),
                  style: const TextStyle(
                    fontFamily: 'ManropeMedium',
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Booking settings'.tr(),
                  style: const TextStyle(
                    fontFamily: 'ManropeMedium',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          height: 1.5,
          thickness: 1.5,
          color: Colors.black12,
        )
      ],
    );
  }
}
