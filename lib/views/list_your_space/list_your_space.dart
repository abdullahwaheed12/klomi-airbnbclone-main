import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../models/explore_model.dart';
import '../exploreDetails/explore_details.dart';
import 'empty_space.dart';
import 'if_not_login_space.dart';

class ListYourSpace extends StatelessWidget {
  const ListYourSpace({super.key});

  @override
  Widget build(BuildContext context) {
    var isLogin = FirebaseAuth.instance.currentUser != null;
    if (!isLogin) {
      return const SpaceIfNotLogin();
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
                  'Your Space'.tr(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('posts')
                        .where('hostId',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var listActiveAds = snapshot.data!.docs
                            .map((e) => ExploreModel.fromMap(e.data()))
                            .toList();
                        if (listActiveAds.isEmpty) {
                          return const EmptySpace();
                        } else {
                          return ListView.builder(
                            itemCount: listActiveAds.length,
                            itemBuilder: (context, index) {
                              var objExplore = listActiveAds[index];
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  objExplore.images[0]),
                                              fit: BoxFit.fill),
                                        ),
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
                                            padding: const EdgeInsets.symmetric(
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
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
