import 'package:klomi/controllers/adpost_controller.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/tabs/booking_settings.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/tabs/listing_detail.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/tabs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/explore_model.dart';
import 'controller.dart';

class ListingStatusSettings extends StatefulWidget {
  const ListingStatusSettings(
      {super.key, required this.exploreModelDocId, required this.objExplore});
  final String exploreModelDocId;
  final ExploreModel objExplore;

  @override
  State<ListingStatusSettings> createState() => _ListingStatusSettingsState();
}

class _ListingStatusSettingsState extends State<ListingStatusSettings>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    Get.put(ListingStatusController());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: GetBuilder<ListingStatusController>(builder: (controller) {
        return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('posts')
              .doc(widget.exploreModelDocId)
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var exploreModel = ExploreModel.fromMap(snapshot.data!.data()!);
              return SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          exploreModel.title.capitalize!,
                          style: largeTitle,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListingStatusTabs(tabController: _tabController),
                      Expanded(
                          child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListingDetailInListingStatus(
                            exploreModel: exploreModel,
                          ),
                          BookingSettings(
                            exploreModel: exploreModel,
                          ),
                        ],
                      ))
                    ]),
              );
            }
          },
        );
      }),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Alert!'),
                content: const Text('Do you wnat to delete this listing'),
                actions: [
                  TextButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('posts')
                            .doc(widget.exploreModelDocId)
                            .delete()
                            .then((value) {
                          debugPrint('posts delete');
                          Get.find<AdController>().fetchAds();
                          Get.back();
                          Get.back();
                        });
                      },
                      child: const Text('Yes')),
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('No'))
                ],
              ),
            );
          },
          child: const Text('Delete listing')),
    );
  }
}
