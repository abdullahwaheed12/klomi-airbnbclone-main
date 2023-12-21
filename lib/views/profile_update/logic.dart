import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/enums/gender.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:image_picker/image_picker.dart';

import '../../helper/app_toast.dart';

class ProfileUpdateLogic extends GetxController {
  XFile? imageFile;
  picImage() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  XFile? idPhoto;
  picIdPhoto() async {
    idPhoto = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  Future<String?> _imageUploadAndGetUrl(String localPath) async {
    UploadTask uploadTask;

    try {
      final String imageReference =
          "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
      Reference ref = FirebaseStorage.instance.ref().child(imageReference);
      uploadTask = ref.putFile(File(localPath));
      return await (await uploadTask).ref.getDownloadURL();
    } catch (e) {
      log('error while upload to firebase storage:--> $e');
      return null;
    }
  }

  updateProfile({
    required String email,
    required String firstName,
    required String lastName,
    required Gender? gender,
    required String phoneNo,
  }) async {
    try {
      String? imageProfileUrl;
      //if image is selected and not null the simply upload image to firebase storage and give back
      //image url and if not selected and then should be null then just give this null image url to user copy constructor
      //it will understand if the whole story
      if (imageFile != null) {
        imageProfileUrl = await _imageUploadAndGetUrl(imageFile!.path);
      }
      String? imageIDUrl;
      if (idPhoto != null) {
        imageIDUrl = await _imageUploadAndGetUrl(idPhoto!.path);
        debugPrint('imageIDUrl:-->> $imageIDUrl');
      }
      var userModelRef = Get.find<GeneralGetxController>().currentUserModelRef;
      userModelRef.reference.update(userModelRef
          .data()!
          .copyWith(
              idCardPhotoUrl: imageIDUrl,
              email: email,
              firstName: firstName,
              lastName: lastName,
              imageUrl: imageProfileUrl,
              gender: gender,
              phoneNumber: phoneNo)
          .toMap());
      AppToast.showToast(message: 'Updated'.tr());
      Get.find<GeneralGetxController>().getCurrentUserData();
      return true;
    } on FirebaseAuthException catch (exc) {
      AppToast.showToast(
          message: exc.message ?? 'Some error in storing your data'.tr());
      Get.back();

      return false;
    } on FirebaseException catch (exc) {
      AppToast.showToast(
          message: exc.message ?? 'Some error in storing your data'.tr());
      Get.back();

      return false;
    } catch (e) {
      debugPrint('error: ${e.toString()}');
      AppToast.showToast(message: 'Some error in storing your data'.tr());
      Get.back();

      return false;
    }
  }
}
