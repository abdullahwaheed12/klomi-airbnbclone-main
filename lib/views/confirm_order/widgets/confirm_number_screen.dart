import 'package:klomi/contstant/firebsae_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;

import '../../../helper/in_app_notification_helper.dart';

class ConfirmNumberAddPhoneNumber extends StatefulWidget {
  const ConfirmNumberAddPhoneNumber(
      {super.key, required this.phoneNumber, required this.verificationId});

  final String phoneNumber;
  final String verificationId;

  @override
  State<ConfirmNumberAddPhoneNumber> createState() =>
      _ConfirmNumberAddPhoneNumberState();
}

class _ConfirmNumberAddPhoneNumberState
    extends State<ConfirmNumberAddPhoneNumber> {
  final TextEditingController verificationCodeTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: Text(
          'Confirm your number'.tr(),
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 0.91,
                child: Text(
                  '${"Enter the code we sent over the SMS to".tr()} ${widget.phoneNumber}:',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 0.74,
                child: TextField(
                  controller: verificationCodeTextEditingController,
                  style: const TextStyle(
                    color: Colors.black12,
                    letterSpacing: 30,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 6) {
                      // FocusScope.of(context).unfocus();
                    }
                  },
                  inputFormatters: [
                    // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: '──────',
                    // hintStyle: const TextStyle(
                    //   color: Colors.black12,
                    //   letterSpacing: 30,
                    // ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text.rich(
                TextSpan(
                  text: "Didn't get a code? ".tr(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  children: [
                    TextSpan(
                      text: 'Send again'.tr(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      verifyCode(
                          context: context,
                          verificationId: widget.verificationId,
                          verificationCode:
                              verificationCodeTextEditingController.text,
                          phoneNumber: widget.phoneNumber);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                          Size(width * 0.28, height * 0.06)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      'Continue'.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void verifyCode({
  required BuildContext context,
  required String verificationId,
  required String verificationCode,
  required String phoneNumber,
}) async {
  if (verificationCode.isEmpty) {
    InAppNotificationHelper.snackBarNotification(
        context: context, message: 'Enter OTP Code'.tr());
  }
  try {
    var authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: verificationCode);
    if (authCredential.smsCode == verificationCode) {
      FirebaseFirestore.instance
          .collection(userCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((doc) {
        if (doc.exists) {
          doc.reference.update({"phoneNumber": phoneNumber});
          Get.back();
          Get.back();
        } else {
          InAppNotificationHelper.snackBarNotification(
              context: context, message: 'Invalid OTP'.tr());
        }
      });
    }
  } catch (e) {
    FocusScope.of(context).unfocus();
    InAppNotificationHelper.snackBarNotification(
        context: context, message: 'Invalid OTP Code'.tr());
  }
}
