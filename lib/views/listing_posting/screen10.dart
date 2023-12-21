import 'dart:io';

import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/utiles/kyes.dart';
import 'package:klomi/views/listing_posting/screen11.dart';
import 'package:klomi/views/listing_posting/widgets/next_back.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../contstant/text_styles.dart';

class AddImages extends StatefulWidget {
  const AddImages({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;

  @override
  State<AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<AddImages> {
  List<XFile> images = [];

  TextEditingController fare = TextEditingController();
  bool load = false;
  var user = Get.find<GeneralGetxController>().currentUserModel!;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                height: 50,
              ),
              Text(
                'Select more then 3 images for your cabin'.tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 50,
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: FileImage(File(images[index].path)),
                              fit: BoxFit.fill)),
                    );
                  },
                ),
              ),
              const Spacer(),
              NextBack(
                onPressed: () {
                  if (images.length > 2) {
                    Get.to(() => CabinTitle(allPreviousArgu: {
                          ...widget.allPreviousArgu,
                          AppKeys.imagesFileKey: images
                        }));
                  } else {
                    Get.snackbar(
                        'Empty'.tr(), 'Please select more then 3 images'.tr());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
