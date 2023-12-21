import 'dart:io';

import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/contstant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utiles/math_utils.dart';
import '../../image_view.dart/scaffold.dart';
import '../logic.dart';

class ProfileUpdateImageContainer extends StatelessWidget {
  const ProfileUpdateImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileUpdateLogic>(builder: (profileUpdateController) {
      return SizedBox(
        height: getSize(200),
        width: getSize(200),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              SizedBox(
                height: getSize(200),
                width: getSize(200),
                child: ClipOval(
                    child: profileUpdateController.imageFile != null
                        ? GestureDetector(
                            onTap: () {
                              Get.to(ImageViewScreen(
                                fileImage: File(
                                    profileUpdateController.imageFile!.path),
                              ));
                            },
                            child: Image.file(
                              File(profileUpdateController.imageFile!.path),
                              fit: BoxFit.fill,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Get.to(ImageViewScreen(
                                networkImage: GeneralGetxController
                                    .instance.currentUserModel!.imageUrl,
                              ));
                            },
                            child: GeneralGetxController
                                    .instance.currentUserModel!.imageUrl.isEmpty
                                ? Container(
                                    color: primaryColor,
                                  )
                                : Image.network(
                                    GeneralGetxController
                                        .instance.currentUserModel!.imageUrl,
                                    fit: BoxFit.fill,
                                  ),
                          )),
              ),
              Positioned(
                  right: 0,
                  bottom: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: primaryColor)),
                    child: GestureDetector(
                      onTap: () {
                        profileUpdateController.picImage();
                      },
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        size: 20,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
