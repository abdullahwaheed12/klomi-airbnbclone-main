import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import '../contstant/text_styles.dart';
import '../helper/main_helper.dart';
import '../models/active_ad.dart';
import '../views/exploreDetails/explore_details.dart';

class TripCard extends StatelessWidget {
  const TripCard(
      {super.key,
      required this.obj,
      required this.snapshot,
      required this.index,
      required this.actionButton,
      this.isHost = true,
      this.isPending = true});
  final ActiveAd obj;
  final AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  final int index;
  final Widget actionButton;
  final bool isHost;
  final bool isPending;
  @override
  Widget build(BuildContext context) {
    var objExplore = obj.exploreModel;
    commonVerticalSpacer([double height = 15]) => DynamicVerticalSpace(height);
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 8,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(obj.visitorPhotoUrl),
                          fit: BoxFit.fill)),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () =>
                        Get.to(() => ExploreDetails(exploreModel: objExplore)),
                    child: Text('Preview Ad'.tr()))
              ],
            ),
            commonVerticalSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Visitor name:'.tr(),
                  style: mediumDesc,
                ),
                const Spacer(),
                Expanded(
                  child: Text(isHost
                      ? obj.visitorName
                      : obj.exploreModel.hostModel.hostBy),
                ),
              ],
            ),
            commonVerticalSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Visiting Dates:'.tr(),
                  style: mediumDesc,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '${DateFormat('MMMM').format(DateTime(0, objExplore.start.month))} ${objExplore.start.day} - ${objExplore.end.day}',
                    style: const TextStyle(
                      fontFamily: 'ManropeRegular',
                      color: Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            if (obj.exploreModel.direction.isNotEmpty && !isPending)
              commonVerticalSpacer(),
            if (obj.exploreModel.direction.isNotEmpty && !isPending)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Direction:'.tr(),
                    style: mediumDesc,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        obj.exploreModel.direction,
                        style: const TextStyle(
                          fontFamily: 'ManropeRegular',
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (obj.exploreModel.wiFi != null && !isPending)
              commonVerticalSpacer(),
            if (obj.exploreModel.wiFi != null && !isPending)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wifi:'.tr(),
                    style: mediumDesc,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${'Wifi name:'.tr()} ${obj.exploreModel.wiFi!.name}\n Wifi Password: ${obj.exploreModel.wiFi!.password}',
                        style: const TextStyle(
                          fontFamily: 'ManropeRegular',
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (obj.exploreModel.houseManual.isNotEmpty && !isPending)
              commonVerticalSpacer(),
            if (obj.exploreModel.houseManual.isNotEmpty && !isPending)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'House Manual'.tr(),
                    style: mediumDesc,
                  ),
                  const Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        obj.exploreModel.houseManual,
                        style: const TextStyle(
                          fontFamily: 'ManropeRegular',
                          color: Colors.black87,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            commonVerticalSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Guests Count:'.tr(),
                  style: mediumDesc,
                ),
                const Spacer(),
                Text(
                  objExplore.hostModel.guests.toString(),
                  style: const TextStyle(
                    fontFamily: 'ManropeRegular',
                    color: Colors.black87,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            commonVerticalSpacer(),

            Row(
              children: [
                Text(
                  '\$${obj.exploreModel.price}x${obj.days}${"nights".tr()}',
                  style: mediumDesc,
                ),
                const Spacer(),
                Text(
                  '\$${int.parse(obj.exploreModel.price) * obj.days}',
                ),
              ],
            ),
            commonVerticalSpacer(),

            Row(
              children: [
                Text(
                  'Service fee'.tr(),
                  style: mediumDesc,
                ),
                const Spacer(),
                Text('\$${obj.serviceFee}'),
              ],
            ),
            commonVerticalSpacer(),

            Row(
              children: [
                Text.rich(
                    TextSpan(text: 'Total'.tr(), style: smallTitle, children: [
                  TextSpan(
                    text: '(USD)'.tr(),
                    style: smallTitle.copyWith(
                        decoration: TextDecoration.underline),
                  )
                ])),
                const Spacer(),
                Text(
                  '\$${int.parse(objExplore.price) * obj.days + obj.serviceFee}',
                  style: smallTitle,
                ),
              ],
            ),
            commonVerticalSpacer(20),

            //-- action Button for accept order, complete order
            Row(
              children: [
                actionButton,
                const Spacer(),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                    onPressed: () {
                      sendMessage(objExplore, objExplore.adId, context);
                    },
                    child: Text(
                      isHost ? 'Contact With Traveler'.tr() : 'Contact With Host'.tr(),
                      style: const TextStyle(color: Colors.grey),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
