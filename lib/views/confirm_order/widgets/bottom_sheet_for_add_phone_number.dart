import 'package:klomi/contstant/text_styles.dart';
import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../helper/in_app_notification_helper.dart';
import 'confirm_number_screen.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({super.key});

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {
  Country? _selectedCountry;
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  bool isPhoneOtp = true;

  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  bool numbervalidated = false;

  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;

    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.clear)),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Add phone number'.tr(),
                style: smallTitle,
              )
            ],
          ),
          const Divider(),
          Text('For notifications, reminders, and help logging in.'.tr()),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
              ),
              height: 100,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        country == null
                            ? Container()
                            : Row(
                                children: <Widget>[
                                  Image.asset(
                                    country.flag,
                                    package: countryCodePackageName,
                                    width: 32,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '${country.callingCode} ${country.name} (${country.countryCode})',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                        GestureDetector(
                            child:
                                const Icon(Icons.keyboard_arrow_down_rounded),
                            onTap: () {
                              _onPressedShowBottomSheet();
                            })
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.black, height: 1, width: double.infinity),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      onChanged: (value) {
                        if (value.length > 4) {
                          numbervalidated = true;
                          setState(() {});
                        } else {
                          setState(() {});
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: phoneNumberTextEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'phone Number'.tr(),
                          hintStyle: const TextStyle(fontSize: 14),
                          isDense: true),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "we'll text you to confirm your number, Standard message and data rates apply."
                  .tr(),
              style: const TextStyle(
                  fontSize: 12, color: Colors.black, letterSpacing: 0.4),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(size.width, 50),
                backgroundColor: numbervalidated == false
                    ? Colors.grey
                    : Theme.of(context).primaryColor,
              ),
              onPressed: () {
                sendCode(
                    context: context,
                    phoneNumber: phoneNumberTextEditingController.text);
              },
              child: Text('Continue'.tr()))
        ],
      ),
    );
  }

  double cornerRadius = 35;

  _showBottomSheet(String phoneNumber, String verificationId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cornerRadius),
              topRight: Radius.circular(cornerRadius))),
      builder: (context) {
        return ConfirmNumberAddPhoneNumber(
          phoneNumber: phoneNumber,
          verificationId: verificationId,
        );
      },
    );
  }

  void sendCode(
      {required BuildContext context, required String phoneNumber}) async {
    if (phoneNumber.isEmpty) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Enter Phone Number'.tr());
      return;
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+92$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        InAppNotificationHelper.snackBarNotification(
            context: context, message: e.message.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        // authenticationController.setVerificationId = verificationId;
        InAppNotificationHelper.snackBarNotification(
            context: context, message: 'Code Sent'.tr());
        _showBottomSheet(phoneNumber, verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // authenticationController.setVerificationId = verificationId;
      },
      timeout: const Duration(seconds: 60),
    );
  }
}
