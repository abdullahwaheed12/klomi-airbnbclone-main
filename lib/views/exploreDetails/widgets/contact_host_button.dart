import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../helper/main_helper.dart';
import '../../../models/explore_model.dart';

class ContactHostButton extends StatelessWidget {
  const ContactHostButton({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        sendMessage(exploreModel, exploreModel.adId, context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black38, width: 1),
        ),
        alignment: Alignment.center,
        child: Text(
          'Contact Host'.tr(),
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
