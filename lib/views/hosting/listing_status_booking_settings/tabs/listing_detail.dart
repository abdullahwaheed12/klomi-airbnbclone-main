import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/views/exploreDetails/explore_details.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/listing_detail/amenities.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/listing_detail/directions.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/listing_detail/edit_rooms_beds.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/listing_detail/eidt_images.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/listing_detail/eidt_location.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/listing_detail/house_manual.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/listing_detail/wi_fi.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import '../../../../contstant/text_styles.dart';
import '../../../../models/explore_model.dart';
import '../listing_detail/description.dart';
import '../listing_detail/scenic_views.dart';
import '../listing_detail/title.dart';

class ListingDetailInListingStatus extends StatelessWidget {
  const ListingDetailInListingStatus({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Listing details'.tr(),
                  style: largeTitle,
                ),
                const Spacer(),
                InkWell(
                    onTap: () {
                      Get.to(() => ExploreDetails(exploreModel: exploreModel));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Preview'.tr(),
                        style: mediumDesc,
                      ),
                    )),
              ],
            ),
            const DynamicVerticalSpace(10),
            Text('Travellers can see this info before they book'.tr()),
            const DynamicVerticalSpace(20),
            Row(
              children: [
                const Text(
                  'Photos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                InkWell(
                  onTap: () =>
                      Get.to(() => EditImages(exploreModel: exploreModel)),
                  child: Text(
                    'Add'.tr(),
                    style: underLineText,
                  ),
                ),
              ],
            ),
            const DynamicVerticalSpace(5),
            Text('${exploreModel.images.length} added'),
            const DynamicVerticalSpace(30),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exploreModel.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    height: 120,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(exploreModel.images[index]),
                          fit: BoxFit.fill),
                    ),
                  );
                },
              ),
            ),
            const DynamicVerticalSpace(20),
            //--
            const DviderApp(),

            InkWell(
              onTap: () => Get.to(() => EditTitle(
                    exploreModel: exploreModel,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Listing title'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(5),
                  Text(exploreModel.title),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),
            const DviderApp(),
            //----

            InkWell(
              onTap: () => Get.to(() => EditDiscription(
                    exploreModel: exploreModel,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  const Text(
                    'Description',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(5),
                  Text(exploreModel.nameDescription),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),

            const DviderApp(),
            //----

            InkWell(
              onTap: () => Get.to(() => EditAboutYourPlace(
                    exploreModel: exploreModel,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Rooms and guests'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(5),
                  Text(
                      '${exploreModel.hostModel.bedRoom} bedroom, ${exploreModel.hostModel.bed} bed, ${exploreModel.hostModel.sharedBath} bathroom,${exploreModel.hostModel.guests}  guests'),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),
            const DviderApp(),
            //----
            InkWell(
              onTap: () => Get.to(() => PlaceAminities(
                    exploreModel: exploreModel,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Amenities'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),

            const DviderApp(),
            InkWell(
              onTap: () => Get.to(() => EditLocation(
                    exploreModel: exploreModel,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Location'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),

            const DviderApp(),
            //----

            InkWell(
              onTap: () =>
                  Get.to(() => ScenicViews(exploreModel: exploreModel)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Scenic views'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),
            //--
            const DviderApp(),

            //----
            const DynamicVerticalSpace(30),
            Text(
              'Info for guests'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(5),
            Text('Only shared with confirmed guests'.tr()),

            InkWell(
              onTap: () => Get.to(() => WiFi(exploreModel: exploreModel)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  DynamicVerticalSpace(30),
                  Text(
                    'Wi-Fi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  DynamicVerticalSpace(30),
                ],
              ),
            ),
            //---

            const DviderApp(),
            //---
            InkWell(
              onTap: () =>
                  Get.to(() => HouseManual(exploreModel: exploreModel)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(30),
                  Text(
                    'House manual'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(30),
                ],
              ),
            ),
            const DviderApp(),
            //---
            InkWell(
              onTap: () => Get.to(() => Directions(exploreModel: exploreModel)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(30),
                  Text(
                    'Directions'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(30),
                ],
              ),
            ),

            const DviderApp(),
          ],
        ),
      ),
    );
  }
}
