import 'package:klomi/contstant/text_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class EditDiscription extends StatefulWidget {
  const EditDiscription({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<EditDiscription> createState() => _EditDiscriptionState();
}

class _EditDiscriptionState extends State<EditDiscription> {
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    descController.text = widget.exploreModel.nameDescription;
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Next, let\'s update your experience'.tr(),
                style: largeTitle,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'What you and your guests do?'.tr(),
                style: mediumDesc,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '\u2022 ${"Provide specific plans from start to finish, not multiple ideas or options".tr()}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '\u2022 ${"Describe what makes your experience special - something that guests wouldn't do on their own".tr()}'),
              ),
              const SizedBox(
                height: 35,
              ),
              TextField(
                maxLines: 5,
                controller: descController,
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
                .update({'nameDescription': descController.text}).then((value) {
              AppToast.showToast(message: 'updated bathrooms count'.tr());
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
