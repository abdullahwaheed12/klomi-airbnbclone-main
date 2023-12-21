import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/models/explore_model.dart';
import 'package:klomi/models/reviews_model.dart';
import 'package:klomi/views/exploreDetails/explore_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart' hide Trans;

class ReviewsRatings extends StatelessWidget {
  const ReviewsRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Reviews and ratings'.tr(),
          style: mediumTitle,
        ),
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: StreamBuilder(
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
      ),
    );
  }
}

class ReviewAndRatingsCard extends StatelessWidget {
  const ReviewAndRatingsCard({super.key, required this.reviewModel});
  final ReviewsModel reviewModel;

  @override
  Widget build(BuildContext context) {
    commonVerticalSpacer([double height = 15]) => DynamicVerticalSpace(height);

    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 8,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(reviewModel.image),
                          fit: BoxFit.fill)),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () async {
                      var doc = await FirebaseFirestore.instance
                          .collection('posts')
                          .doc(reviewModel.adId)
                          .get();
                      Get.to(() => ExploreDetails(
                          exploreModel: ExploreModel.fromMap(doc.data()!)));
                    },
                    child: Text('View Ad'.tr()))
              ],
            ),
            commonVerticalSpacer(),
            Row(
              children: [
                Text(
                  'Name:'.tr(),
                  style: mediumDesc,
                ),
                const Spacer(),
                Text(
                  reviewModel.name,
                  style: mediumDesc,
                )
              ],
            ),
            commonVerticalSpacer(),
            Row(
              children: [
                Text(
                  'Review:'.tr(),
                  style: mediumDesc,
                ),
                const Spacer(),
                Text(reviewModel.review)
              ],
            ),
            commonVerticalSpacer(),
            Row(
              children: [
                Text(
                  'Date & Time:'.tr(),
                  style: mediumDesc,
                ),
                const Spacer(),
                Text(reviewModel.time.toString().substring(0, 16))
              ],
            ),
            commonVerticalSpacer(),
            Row(
              children: [
                Text(
                  'Rating:'.tr(),
                  style: mediumDesc,
                ),
                const Spacer(),
                Text(reviewModel.rating.toString())
              ],
            ),
            const DynamicVerticalSpace(10),
            RatingBar.builder(
              initialRating: reviewModel.rating.toDouble(),
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              ignoreGestures: true,
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            const DynamicVerticalSpace(10),
          ],
        ),
      ),
    );
  }
}
