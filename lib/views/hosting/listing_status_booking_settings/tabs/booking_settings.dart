import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/views/exploreDetails/widgets/cancellation_policy.dart';
import 'package:klomi/views/hosting/house_rules/scaffold.dart';
import 'package:klomi/views/hosting/instant_booking/scaffold.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/booking_settings/additional_charges.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/booking_settings/availablity_settings/availablity_settings.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/booking_settings/guest_requiremnets.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/booking_settings/listing_status.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/booking_settings/local_laws.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/booking_settings/nightly_price.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import '../../../../contstant/text_styles.dart';
import '../../../../models/explore_model.dart';
import '../booking_settings/trip_length.dart';

class BookingSettings extends StatelessWidget {
  const BookingSettings({super.key, required this.exploreModel});
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
            Text(
              'Price'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(10),
            Text('Preview what guests pay'.tr()),
            const DynamicVerticalSpace(20),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 80,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(exploreModel.images[1]),
                        fit: BoxFit.fill),
                  ),
                ),
                const DynamicHorizontalSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('\$26 total'),
                    DynamicVerticalSpace(5),
                    Text('1 night . 1 guest')
                  ],
                )
              ],
            ),
            const DynamicVerticalSpace(20),
            const DviderApp(),
            InkWell(
              onTap: () =>
                  Get.to(() => NightlyPrice(exploreModel: exploreModel)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Nightly price'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),

            const DviderApp(),

            InkWell(
              onTap: () =>
                  Get.to(() => AditionalCharges(exploreModel: exploreModel)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Aditional charges'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),
            const DviderApp(
              thickness: 5,
            ),
            const DynamicVerticalSpace(20),
            Text(
              'Booking'.tr(),
              style: largeTitle,
            ),
            const DynamicVerticalSpace(20),
            const DviderApp(),

            InkWell(
              onTap: () => Get.to(() => const InstantBooking()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'How guests can book instant Book on'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(5),
                  Text(
                    'Instant Book on'.tr(),
                    style: mediumDesc,
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),
            const DviderApp(),
            InkWell(
              onTap: () =>
                  Get.to(() => GuestRequirements(exploreModel: exploreModel)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Guest requirements'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),

            const DviderApp(),
            InkWell(
              onTap: () => Get.to(() => const HouseRules()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'House Rules'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),

            const DviderApp(),
            //--
            InkWell(
              onTap: () {
                Get.to(() => const CancellationPolicy());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Cancellation policy'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(5),
                  Text('Flexible'.tr()),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),

            const DviderApp(
              thickness: 5,
            ),
            const DynamicVerticalSpace(20),
            Text(
              'Calendar'.tr(),
              style: largeTitle,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AvailabilitySettings(exploreModel: exploreModel));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Availability settings'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(5),
                  Text(
                      'Advance notice: Same day preparation time: None Availability window: 12 months'
                          .tr()),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),

            const DviderApp(),

            InkWell(
              onTap: () {
                Get.to(() => TripLength(exploreModel: exploreModel));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Trip length'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(5),
                  Text('Minimum stay: 1 night'.tr()),
                  Text('Maximum stay: 365 nights'.tr()),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),
            // //--
            // const DviderApp(),
            // InkWell(
            //   onTap: () {
            //     Get.to(() => CheckInSettings(exploreModel: exploreModel));
            //   },
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       const DynamicVerticalSpace(20),
            //       Text(
            //         'Check-in & checkout'.tr(),
            //         style: const TextStyle(
            //             fontSize: 18, fontWeight: FontWeight.w400),
            //       ),
            //       const DynamicVerticalSpace(5),
            //       Text('Arrive between Flexible and Flexible'.tr()),
            //       Text('Leave before Flexible'.tr()),
            //       const DynamicVerticalSpace(20),
            //     ],
            //   ),
            // ),
            //--
            const DviderApp(
              thickness: 5,
            ),
            const DynamicVerticalSpace(20),
            Text(
              'Management'.tr(),
              style: largeTitle,
            ),
            //--
            InkWell(
              onTap: () {
                Get.to(() => LocalLaws(exploreModel: exploreModel));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Local laws'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(20),
                ],
              ),
            ),
            const DviderApp(),
            //--
            InkWell(
              onTap: () {
                Get.to(() => ListingStatus(exploreModel: exploreModel));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DynamicVerticalSpace(20),
                  Text(
                    'Status'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  const DynamicVerticalSpace(5),
                  Text(
                      "Unlisted - Guests can't book this listing or find it in search resutls"
                          .tr()),
                ],
              ),
            ),
            const DynamicVerticalSpace(20),
          ],
        ),
      ),
    );
  }
}
