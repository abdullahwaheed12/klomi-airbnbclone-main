// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart' as geo_locator;
import 'package:get_storage/get_storage.dart';
import 'package:system_settings/system_settings.dart';

import 'package:haversine_distance/haversine_distance.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../models/explore_model.dart';
import '../../../utiles/kyes.dart';
import '../../exploreDetails/explore_details.dart';

class ExploreItem extends StatefulWidget {
  ExploreItem({Key? key, required this.exploreModel}) : super(key: key);
  ExploreModel exploreModel;

  @override
  State<ExploreItem> createState() => _ExploreItemState();
}

class _ExploreItemState extends State<ExploreItem> {
  int indexPage = 0;

  requestLocationPermission(BuildContext context) async {
    if (Platform.isIOS) {
      await [
        Permission.location,
        Permission.locationWhenInUse,
      ].request();
      await Permission.locationWhenInUse.request();
      ServiceStatus serviceStatus = await Permission.location.serviceStatus;
      bool enabled = (serviceStatus == ServiceStatus.enabled);

      if (!enabled) {
      } else {}
    } else {
      var granted = await _requestPermission(Permission.location);
      if (granted != true) {
        var granted1 = await _requestPermission(Permission.locationAlways);
        if (granted1 != true) {
          if (mounted) {
            requestLocationPermission(context);
          }
        }
        if (mounted) {
          requestLocationPermission(context);
        }
      } else {
        _gpsService();
      }
      debugPrint('requestLocationPermission $granted');
      return granted;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    var result = await permission.request();
    if (result == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  Future<String> _getAddressFromLatLng(double lat, double long) async {
    List<Placemark> p = await placemarkFromCoordinates(lat, long);

    Placemark place = p[0];
    return "${place.locality}, ${place.country}";
  }

//
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
//
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<geo_locator.Position> _determinePosition() async {
    bool serviceEnabled;
    geo_locator.LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await geo_locator.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        requestLocationPermission(context);
      }
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // return Future.error('Location services are disabled.');
    }

    permission = await geo_locator.Geolocator.checkPermission();
    if (permission == geo_locator.LocationPermission.denied) {
      permission = await geo_locator.Geolocator.requestPermission();
      if (permission == geo_locator.LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
      }
    }

    if (permission == geo_locator.LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await geo_locator.Geolocator.getCurrentPosition();
  }

  enableLocation() async {
    await SystemSettings.location();
  }

  Future _gpsService() async {
    if (!(await geo_locator.Geolocator.isLocationServiceEnabled())) {
      enableLocation();
      return null;
    } else {
      return true;
    }
  }

  Future<int> calculateDistence() async {
    /// Create the two location objects you want to calculate the distance between.
    /// The Location object is included in the package.
    var loc = await _determinePosition();

    final startCoordinate = Location(loc.latitude, loc.longitude);
    final endCoordinate = Location(widget.exploreModel.location.latitude,
        widget.exploreModel.location.longitude);
    return HaversineDistance()
        .haversine(startCoordinate, endCoordinate, Unit.KM)
        .floor();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ExploreDetails(exploreModel: widget.exploreModel)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //ad images slider
            ImageSlider(exploreModel: widget.exploreModel),
            //----
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //address
                  FutureBuilder(
                      future: _getAddressFromLatLng(
                          widget.exploreModel.location.latitude,
                          widget.exploreModel.location.longitude),
                      builder: (context, snap) {
                        if (!snap.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Text(
                          snap.data!,
                          style: const TextStyle(
                            fontFamily: 'ManropeBold',
                            fontSize: 15,
                          ),
                        );
                      }),
                  //ratting
                  Row(
                    children: [
                      const Icon(
                        Icons.star_purple500_outlined,
                        color: Colors.black,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.exploreModel.rate.toString(),
                        style: const TextStyle(
                          fontFamily: 'ManropeRegular',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            FutureBuilder(
                future: calculateDistence(),
                builder: (context, snap) {
                  if (!snap.hasData) {
                    return const Center();
                  }
                  return Text(
                    "${snap.data} " "killometers away".tr(),
                    style: const TextStyle(
                      fontFamily: 'ManropeRegular',
                      color: Colors.black87,
                      fontSize: 13,
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                '${DateFormat('MMMM').format(DateTime(0, widget.exploreModel.start.month))} ${widget.exploreModel.start.day} - ${widget.exploreModel.end.day}',
                style: const TextStyle(
                  fontFamily: 'ManropeRegular',
                  color: Colors.black87,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "\$${widget.exploreModel.price}",
                    style: const TextStyle(
                      fontFamily: 'ManropeBold',
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: '  night'.tr(),
                    style: const TextStyle(
                      fontFamily: 'ManropeRegular',
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int indexPage = 0;

  var wishedAdList = GetStorage().read(AppKeys.wishListKey) ?? [];

  wishAd() {
    debugPrint('wished ${widget.exploreModel.isFav}');
    wishedAdList.add(widget.exploreModel.adId);
    GetStorage().write(AppKeys.wishListKey, wishedAdList);
    setState(() {});
  }

  unWishAd() {
    debugPrint('unWished ${widget.exploreModel.isFav}');

    wishedAdList.remove(widget.exploreModel.adId);
    GetStorage().write(AppKeys.wishListKey, wishedAdList);

    setState(() {});
  }

  @override
  void initState() {
    GetStorage().listen(() {
      if (mounted) {
        setState(() {
          wishedAdList = GetStorage().read(AppKeys.wishListKey) ?? [];
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.exploreModel.isFav = wishedAdList.contains(widget.exploreModel.adId);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
              onPageChanged: (v) {
                indexPage = v;
                setState(() {});
              },
              itemCount: widget.exploreModel.images.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage(widget.exploreModel.images[index]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                          onTap: () {
                            if (widget.exploreModel.isFav) {
                              unWishAd();
                            } else {
                              wishAd();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              widget.exploreModel.isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: widget.exploreModel.isFav
                                  ? Colors.red[900]
                                  : Colors.white,
                            ),
                          )),
                    ),
                  ],
                );
              }),
          Container(
            padding: const EdgeInsets.only(bottom: 10.0),
            width: widget.exploreModel.images.length * 15,
            height: 40,
            alignment: Alignment.center,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: widget.exploreModel.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CircleAvatar(
                      radius: indexPage == index ? 5 : 3,
                      backgroundColor: indexPage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
