import 'dart:async';

import 'package:klomi/contstant/colors.dart';
import 'package:klomi/views/explore/widgets/tabs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import '../../controllers/adpost_controller.dart';
import '../../utiles/math_utils.dart';
import '../exploreDetails/explore_details.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  MapsViewState createState() => MapsViewState();
}

class MapsViewState extends State<MapsView> with TickerProviderStateMixin {
  var loader = true;

  TabController? tabController;
  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    setMarker();
  }

  final Set<Marker> markers = {};

  setMarker() async {
    var listOfAds = Get.find<AdController>().adpostModel!;

    for (var ads in listOfAds) {
      markers.addLabelMarker(LabelMarker(
        backgroundColor: primaryColor,
        label: "${ads.price.toString()}\$",
        markerId: MarkerId(
            LatLng(ads.location.latitude, ads.location.longitude).toString()),
        position: LatLng(ads.location.latitude, ads.location.longitude),
        onTap: () {
          Get.to(ExploreDetails(exploreModel: ads));
        },
      ));
    }
    await Future.delayed(const Duration(seconds: 1));
    loader = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: SizedBox(
        //   height: 40,
        //   width: 40,
        //   child: FloatingActionButton(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(06.0),
        //     ),
        //     onPressed: () {
        //       // showModalBottomSheet(
        //       //     shape: const RoundedRectangleBorder(
        //       //         bo
        //rderRadius: BorderRadius.only(
        //       //             topLeft: Radius.circular(20),
        //       //             topRight: Radius.circular(20))),
        //       //     context: context,
        //       //     builder: (context) {
        //       //       return const MapSettings();
        //       //     });
        //     },
        //     splashColor: Colors.white,
        //     child: const Icon(
        //       Icons.settings,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Stack(
          children: [
            // exploreTabs(),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  100, // If its giving responsive error change it back to 100
              child: loader
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GoogleMap(
                      onMapCreated: _onMapCreated,
                      markers: markers,
                      mapType: MapType.normal,
                      initialCameraPosition: const CameraPosition(
                          target: LatLng(40.712776, -74.005974), zoom: 10),
                    ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 56,
                width: size.width,
                child: Card(
                  child: Center(
                    child: Text(
                      '${Get.find<AdController>().adpostModel?.length} ${"amazing views".tr()}', // TODO : Add the number of views

                      style: const TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget exploreTabs() {
    return ExploreTabs(
      tabController: tabController!,
    );
  }
}

// class MapSettings extends StatefulWidget {
//   const MapSettings({super.key});

//   @override
//   State<MapSettings> createState() => _MapSettingsState();
// }

// class _MapSettingsState extends State<MapSettings> {
//   final zoomControls = ValueNotifier<bool>(false);
//   final panControls = ValueNotifier<bool>(false);
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 365,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, top: 5),
//             child: Text(
//               "map Settings".tr(),
//               style: const TextStyle(
//                 letterSpacing: 0.4,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20, top: 5, right: 10),
//             child: Text(
//               "turn accessibility-focused map controls on or off".tr(),
//               style: const TextStyle(
//                 color: Colors.grey,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           ListTile(
//             title: Text("zoom Controls".tr()),
//             subtitle: Text("zoom in or out with distinct buttons".tr()),
//             trailing: AdvancedSwitch(
//               controller: zoomControls,
//               activeColor: Theme.of(context).primaryColor,
//               inactiveColor: Colors.grey,
//               borderRadius: const BorderRadius.all(Radius.circular(15)),
//               width: 50.0,
//               height: 30.0,
//               enabled: true,
//               disabledOpacity: 0.5,
//             ),
//           ),
//           const Divider(
//             color: Colors.grey,
//           ),
//           ListTile(
//             title: Text("pan controls".tr()),
//             subtitle: Text("move around the map with directional buttons".tr()),
//             trailing: AdvancedSwitch(
//               controller: panControls,
//               activeColor: Theme.of(context).primaryColor,
//               inactiveColor: Colors.grey,
//               borderRadius: const BorderRadius.all(Radius.circular(15)),
//               width: 50.0,
//               height: 30.0,
//               enabled: true,
//               disabledOpacity: 0.5,
//             ),
//           ),
//           const Divider(
//             color: Colors.grey,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SizedBox(
//               height: 50,
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                     // Border
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(06.0),
//                     )),
//                     backgroundColor:
//                         MaterialStateProperty.all(const Color(0xFFC65201))),
//                 onPressed: () {},
//                 child: Text(
//                   'done'.tr(),
//                   style: const TextStyle(fontSize: 16, letterSpacing: 0.2),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
