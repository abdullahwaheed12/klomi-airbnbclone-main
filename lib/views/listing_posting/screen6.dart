import 'dart:async';

import 'package:klomi/utiles/kyes.dart';
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
import '../../contstant/text_styles.dart';
import 'screen7.dart';
import 'widgets/next_back.dart';

class AddYourLocation extends StatefulWidget {
  const AddYourLocation({super.key, required this.allPreviousArgument});
  final Map allPreviousArgument;
  @override
  State<AddYourLocation> createState() => _AddYourLocationState();
}

class _AddYourLocationState extends State<AddYourLocation> {
  bool load = false;
  LatLng target = const LatLng(40.712776, -74.005974);
  var marker = {const LatLng(40.712776, -74.005974)};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
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
                      height: 100,
                    ),
                    Text(
                      "Where's your place located?".tr(),
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
                    NextBack(
                      onPressed: () {
                        Get.to(() => AboutYourPlace(
                              allPreviousArgument: {
                                ...widget.allPreviousArgument,
                                AppKeys.targetLatngKey:
                                    GeoPoint(target.latitude, target.longitude)
                              },
                            ));
                      },
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
                  child: SearchLocation(
                    strictBounds: true,
                    apiKey: googleMapKeys,
                    onSelected: (searchMapWidgets.Place place) async {
                      print(place.description);
                      final GoogleMapController controller =
                          await _controller.future;
                      var geolocation = await place.geolocation;
                      // print(geolocation);
                      // LatLng latLng = LatLng(geolocation?.coordinates.latitude,
                      //     geolocation?.coordinates.longitude);
                      // print(latLng);
                      controller.animateCamera(CameraUpdate.newLatLng(LatLng(
                          geolocation!.coordinates.latitude,
                          geolocation.coordinates.longitude)));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
