import 'dart:io';

import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/helper/app_toast.dart';
import 'package:klomi/views/hosting/listing_status_booking_settings/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../contstant/text_styles.dart';
import '../../../../models/explore_model.dart';

class EditImages extends StatefulWidget {
  const EditImages({super.key, required this.exploreModel});
  final ExploreModel exploreModel;
  @override
  State<EditImages> createState() => _EditImagesState();
}

class _EditImagesState extends State<EditImages> {
  List<XFile> images = [];

  TextEditingController fare = TextEditingController();
  bool load = false;
  var user = Get.find<GeneralGetxController>().currentUserModel!;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Add more images '.tr(),
          style: mediumTitle,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: load,
        opacity: 0.3,
        progressIndicator: const CircularProgressIndicator(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextButton.icon(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    List<XFile>? image = await picker.pickMultiImage();
                    images.addAll(image);
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.black))),
                  icon: const Icon(
                    Icons.attach_file,
                    color: Colors.black,
                  ),
                  label: Text(
                    "Add images".tr(),
                    style: const TextStyle(color: Colors.black),
                  )),
              SizedBox(
                height: size.height - 300,
                child: GridView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 150,
                      height: 120,
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: FileImage(File(images[index].path)),
                            fit: BoxFit.fill),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            updateImaegs();
          },
          child: Text(
            'Save'.tr(),
            style: const TextStyle(color: Colors.white),
          )),
    );
  }

  updateImaegs() async {
    load = true;
    setState(() {});
    var imageUrl = <String>[];
    for (int i = 0; i < images.length; i++) {
      var url = await uploadFile(File(images[i].path));
      if (url != null) {
        imageUrl.add(url);
      }
    }
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.exploreModel.adId)
        .update({'images': FieldValue.arrayUnion(imageUrl)}).then((value) {
      AppToast.showToast(message: 'Images updated'.tr());
    }).catchError((e) {
      debugPrint('--->>>>>>  error  $e');
      AppToast.showToast(message: 'error while updating'.tr());
    });
    load = false;
    Get.find<ListingStatusController>().update();
    setState(() {});
    Get.back();
  }

  static Future uploadFile(File photo) async {
    String url = "";
    try {
      Reference ref = FirebaseStorage.instance
          .ref("ads")
          .child(photo.path.toString().split("/").last);

      TaskSnapshot task = await ref.putFile(photo);
      url = await task.ref.getDownloadURL();
      return url;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
