import 'package:klomi/controllers/adpost_controller.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/accessibility_features_filters.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/amenities_filter.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/booking_options.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/host_language.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/price_range.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/property_type.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/rooms_beds.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/top_tier_stays.dart';
import 'package:klomi/views/explore/widgets/filters/widgets/type_of_place.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  var logic = Get.find<AdController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            // filter title
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "filters".tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  //price Range
                  const PriceRange(),
                  const SizedBox(
                    height: 20,
                  ),
                  divder(),
                  const SizedBox(
                    height: 20,
                  ),
                  //types of place
                  const TypeOfPlace(),
                  const SizedBox(
                    height: 20,
                  ),
                  divder(),
                  const SizedBox(
                    height: 20,
                  ),
                  //rooms and beds
                  const RoomsAndBeds(),
                  const SizedBox(
                    height: 20,
                  ),
                  divder(),
                  const SizedBox(
                    height: 20,
                  ),
                  //property type
                  const PropertyType(),
                  const SizedBox(
                    height: 20,
                  ),
                  divder(),
                  const SizedBox(
                    height: 20,
                  ),
                  //amenities filter
                  const AmenitiesFilter(),
                  const SizedBox(
                    height: 20,
                  ),
                  divder(),
                  const SizedBox(
                    height: 20,
                  ),
                  //booking options
                  const BookingOptions(),
                  const SizedBox(
                    height: 20,
                  ),
                  divder(),
                  const SizedBox(
                    height: 20,
                  ),
                  //accessbility features
                  const AccessibilityFeaturesFilters(),
                  const SizedBox(
                    height: 20,
                  ),
                  divder(),
                  const SizedBox(
                    height: 20,
                  ),
                  //top tier
                  const TopTierStays(),
                  const SizedBox(
                    height: 20,
                  ),
                  divder(),
                  const SizedBox(
                    height: 20,
                  ),
                  const HostLanguage()
                ],
              ),
            ),

            // footer
            Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: InkWell(
                              onTap: () {
                                controller.clearFilter();
                              },
                              child: Text(
                                'clear all'.tr(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: SizedBox(
                              width: 120,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {
                                    controller.fetchFilterAds();
                                  },
                                  child: Text(
                                    'Show Results'.tr(),
                                    style: const TextStyle(fontSize: 12),
                                  )),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      );
    });
  }

  Widget divder() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 10.0),
      child: Divider(
        color: Colors.black,
      ),
    );
  }
}
