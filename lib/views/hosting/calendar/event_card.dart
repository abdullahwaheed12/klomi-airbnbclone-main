import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../contstant/text_styles.dart';
import '../../../helper/main_helper.dart';
import '../../../models/active_ad.dart';
import '../../exploreDetails/explore_details.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.obj,
    required this.actionButton,
  });
  final ActiveAd obj;
  final Widget actionButton;
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
                Text(obj.visitorName),
              ],
            ),
            commonVerticalSpacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Visting Dates:'.tr(),
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
                  '\$${obj.exploreModel.price}x${obj.days}${"nights:".tr()}',
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
                    text: '(USD)',
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
                      'Contact With Traveller'.tr(),
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
