import 'package:klomi/controllers/adpost_controller.dart';
import 'package:klomi/contstant/colors.dart';
import 'package:klomi/models/explore_model.dart';
import 'package:klomi/views/whishlists/whishlist_if_not_login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';

import '../../utiles/kyes.dart';
import '../exploreDetails/explore_details.dart';
import 'empty_fav.dart';

class WhishListsScreen extends StatelessWidget {
  const WhishListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var adList = Get.find<AdController>().adpostModel;
    var wishedAdList = GetStorage().read(AppKeys.wishListKey) ?? [];
    debugPrint('wishedAdList $wishedAdList');

    var isLogin = FirebaseAuth.instance.currentUser != null;
    if (!isLogin) {
      return const WhishListsScreenIfNotLogin();
    } else {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Wishlists'.tr(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 0)),
                    builder: (context, ssnapshot) {
                      if (wishedAdList.isEmpty) {
                        return const EmptyWishlists();
                      }

                      return GetBuilder<AdController>(
                        builder: (controller) {
                          if (controller.adpostModel == null) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            List<ExploreModel> finalAdWishList = [];
                            for (var ad in adList!) {
                              for (var element in wishedAdList) {
                                if (ad.adId == element) {
                                  finalAdWishList.add(ad);
                                }
                              }
                            }
                            return ListView.builder(
                              itemCount: finalAdWishList.length,
                              itemBuilder: (context, index) {
                                var objExplore = finalAdWishList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: secondaryColor),
                                      borderRadius: BorderRadius.circular(12)),
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
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      objExplore.images[0]))),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
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
                            );
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
