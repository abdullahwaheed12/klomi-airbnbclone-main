import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../contstant/text_styles.dart';
import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class EditTitle extends StatefulWidget {
  const EditTitle({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<EditTitle> createState() => _EditTitleState();
}

class _EditTitleState extends State<EditTitle> {
  var editTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    editTitle.text = widget.exploreModel.title;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Now, let's update your cabin a title".tr(),
                style: largeTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                  "Short titles work best. Have fun with it ---you can always change it later."
                      .tr()),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: editTitle,
                maxLines: 5,
                maxLength: 32,
                decoration: const InputDecoration(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update({'title': editTitle.text}).then((value) {
              AppToast.showToast(message: 'updated title'.tr());
              Get.find<ListingStatusController>().update();
            }).catchError((e) {
              debugPrint('--->>>>>>  error  $e');
              AppToast.showToast(message: 'error while updating'.tr());
            });

            Get.back();
          },
          child: Text(
            'Save'.tr(),
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
