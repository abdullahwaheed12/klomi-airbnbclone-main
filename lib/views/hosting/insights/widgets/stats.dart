import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../contstant/image_path.dart';
import '../../../../global_widgets/empty_space_widget.dart';
import '../../../../models/reviews_model.dart';
import '../../../reviews_ratings/scaffold.dart';

class Stats extends StatelessWidget {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('reviews')
          .where('reviewToUserId',
              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var ratingList = snapshot.data!.docs
              .map((e) => ReviewsModel.fromMap(e.data()))
              .toList();
          if (ratingList.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    reviewImagePath,
                  ),
                  const DynamicVerticalSpace(20),
                  Text(
                    'No Reviews'.tr(),
                    style: mediumDesc,
                  )
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: ratingList.length,
            itemBuilder: (context, index) =>
                ReviewAndRatingsCard(reviewModel: ratingList[index]),
          );
        }
      },
    );
  }
}
