import 'dart:developer';

import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/models/wifi_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../helper/app_toast.dart';
import '../../../../models/explore_model.dart';
import '../controller.dart';

class WiFi extends StatefulWidget {
  const WiFi({super.key, required this.exploreModel});
  final ExploreModel exploreModel;

  @override
  State<WiFi> createState() => _WiFiState();
}

class _WiFiState extends State<WiFi> {
  late TextEditingController nameTEC;
  late TextEditingController passwordTEC;
  @override
  void initState() {
    nameTEC = TextEditingController(text: widget.exploreModel.wiFi?.name);
    passwordTEC =
        TextEditingController(text: widget.exploreModel.wiFi?.password);
    debugPrint('----?> ${widget.exploreModel.wiFi}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const DynamicVerticalSpace(30),
            Text(
              'Wi-Fi',
              style: largeTitle,
            ),
            const DynamicVerticalSpace(50),
            TextField(
              controller: nameTEC,
              decoration: InputDecoration(label: Text('Wi-Fi name'.tr())),
            ),
            const DynamicVerticalSpace(30),
            TextField(
              controller: passwordTEC,
              decoration: InputDecoration(label: Text('Wi-Fi Password'.tr())),
            ),
          ]),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            widget.exploreModel.wiFi =
                WifiModel(name: nameTEC.text, password: passwordTEC.text);
            log('name ${widget.exploreModel.wiFi}, password ${passwordTEC.text}');
            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update(widget.exploreModel.toMap())
                .then((value) {
              AppToast.showToast(message: 'Update wifi password'.tr());
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
