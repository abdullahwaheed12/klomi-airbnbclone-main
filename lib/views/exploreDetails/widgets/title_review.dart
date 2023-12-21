import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../models/explore_model.dart';

class TitleAndReview extends StatelessWidget {
  const TitleAndReview({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          //rate
          // Row(
          //   children: [
          //     const Icon(
          //       Icons.star_purple500_outlined,
          //       color: Colors.black,
          //       size: 15,
          //     ),
          //     const SizedBox(
          //       width: 5,
          //     ),
          //     Text(
          //       exploreModel.rate.toString(),
          //       style: const TextStyle(
          //         fontSize: 13,
          //       ),
          //     ),
          //   ],
          // ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(
              Icons.circle,
              size: 4,
              color: Colors.black,
            ),
          ),
          //reviews
          Text(
            '${exploreModel.reviews.length}  ${"reviews".tr()}',
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 13,
            ),
          ),
          //superhost
          if (exploreModel.isSuperHost)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.incomplete_circle_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'superhost'.tr(),
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
