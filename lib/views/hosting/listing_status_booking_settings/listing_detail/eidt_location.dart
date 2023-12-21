import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:search_map_location/widget/search_widget.dart';
import 'package:search_map_location/utils/google_search/place.dart'
    // ignore: library_prefixes
    as searchMapWidgets;
import '../../../../contstant/text_styles.dart';
import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../../../../utiles/kyes.dart';
import '../controller.dart';

class EditLocation extends StatefulWidget {
  const EditLocation({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<EditLocation> createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  bool load = false;
  late LatLng target;
  late Set<LatLng> marker;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  void initState() {
    super.initState();
    target = LatLng(widget.exploreModel.location.latitude,
        widget.exploreModel.location.longitude);
    marker = {target};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ModalProgressHUD(
              inAsyncCall: load,
              opacity: 0.3,
              progressIndicator: const CircularProgressIndicator(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      "update your place located".tr(),
                      style: mediumTitle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Your address is only shared with guests after they've made a reservation"
                            .tr()),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GoogleMap(
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          if (!_controller.isCompleted) {
                            _controller.complete(controller);
                          }
                        },
                        onCameraMove: (position) {
                          target = position.target;

                          setState(() {});
                        },
                        markers: {
                          Marker(
                              markerId: const MarkerId('der'),
                              position: target,
                              infoWindow: InfoWindow(title: target.toString()))
                        },
                        initialCameraPosition: const CameraPosition(
                            target: LatLng(40.712776, -74.005974), zoom: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Theme(
                  data: ThemeData(),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      SearchLocation(
                        strictBounds: true,
                        apiKey: googleMapKeys,
                        onSelected: (searchMapWidgets.Place place) async {
                          print(place.description);
                          final GoogleMapController controller =
                              await _controller.future;
                          var geoLocation = await place.geolocation;
                          // print(geolocation);
                          // LatLng latLng = LatLng(geolocation?.coordinates.latitude,
                          //     geolocation?.coordinates.longitude);
                          // print(latLng);
                          controller.animateCamera(CameraUpdate.newLatLng(
                              LatLng(geoLocation!.coordinates.latitude,
                                  geoLocation.coordinates.longitude)));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            widget.exploreModel.location =
                GeoPoint(target.latitude, target.longitude);
            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update(widget.exploreModel.toMap())
                .then((value) {
              AppToast.showToast(message: 'Updated location'.tr());
              Get.find<ListingStatusController>().update();
            }).catchError((e) {
              debugPrint('--->>>>>>  error  $e');
              AppToast.showToast(message: 'error while updating'.tr());
            });
            Get.back();
          },
          child: Text(
            'Save'.tr(),
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
