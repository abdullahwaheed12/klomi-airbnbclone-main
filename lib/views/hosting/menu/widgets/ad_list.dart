import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../contstant/text_styles.dart';
import '../../../../models/explore_model.dart';
import '../../../exploreDetails/explore_details.dart';
import '../../listing_status_booking_settings/scaffold.dart';

class AdListing extends StatelessWidget {
  const AdListing({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .where('hostId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(),
          );
        } else {
          var listActiveAds = snapshot.data!.docs
              .map((e) => ExploreModel.fromMap(e.data()))
              .toList();
          return SizedBox(
            height: 100 * listActiveAds.length.toDouble(),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listActiveAds.length,
              itemBuilder: (context, index) {
                var objExplore = listActiveAds[index];
                return InkWell(
                  onTap: () {
                    Get.to(() => ListingStatusSettings(
                          exploreModelDocId: objExplore.adId,
                          objExplore: objExplore,
                        ));
                  },
                  child: Container(
                    height: 80,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(objExplore.images[0]),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            objExplore.title.capitalize!,
                            style: smallTitle,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                );

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => ExploreDetails(
                            exploreModel: objExplore,
                          ));
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(objExplore.images[0]),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              objExplore.title,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
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
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
