import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/helper/authentication_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helper/date_time_helper.dart';

class AddYourInfo extends StatefulWidget {
  const AddYourInfo(
      {super.key,
      required this.userId,
      required this.userPhoneNumber,
      required this.userEmail,
      required this.imageUrl,
      this.isFromSocialMedia = false});

  final String userId, userPhoneNumber, userEmail, imageUrl;
  final bool isFromSocialMedia;
  @override
  State<AddYourInfo> createState() => _AddYourInfoState();
}

class _AddYourInfoState extends State<AddYourInfo> with WidgetsBindingObserver {
  var _dateOfBirth = 'Birthday';
  bool _showPassword = false;
  final DateTimeHelper _dateTimeHelper = DateTimeHelper();

  TextEditingController firstNametextEditingController =
      TextEditingController();
  TextEditingController surNametextEditingController = TextEditingController();
  TextEditingController dateOfBirthtextEditingController =
      TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController passwordtextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    emailtextEditingController.text = widget.userEmail;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    firstNametextEditingController.dispose();
    surNametextEditingController.dispose();
    dateOfBirthtextEditingController.dispose();
    emailtextEditingController.dispose();
    passwordtextEditingController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      FirebaseAuth.instance.signOut();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Icon(Icons.keyboard_backspace),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Add your info'.tr(),
                  style: mediumTitle,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      controller: firstNametextEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'First name'.tr(),
                        hintStyle: const TextStyle(fontSize: 14),
                        isDense: true,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      controller: surNametextEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Surname'.tr(),
                          hintStyle: const TextStyle(fontSize: 14),
                          isDense: true),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('Make user it matches with your government ID'.tr()),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    _dateOfBirth =
                        await _dateTimeHelper.openDatePicker(context);
                    dateOfBirthtextEditingController.text = _dateOfBirth;
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _dateOfBirth,
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    "To sign up, you need to be at least 18. Other people who use Klomi won't see your birthday."
                        .tr()),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      onChanged: (value) {},
                      textInputAction: TextInputAction.next,
                      controller: emailtextEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email'.tr(),
                          hintStyle: const TextStyle(fontSize: 14),
                          isDense: true),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("We'll email you a reservation confirmation.".tr()),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: TextField(
                    onChanged: (value) {},
                    controller: passwordtextEditingController,
                    obscureText: _showPassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password'.tr(),
                      hintStyle: const TextStyle(fontSize: 14),
                      isDense: true,
                      contentPadding: const EdgeInsets.only(
                        top: 10,
                        left: 4,
                        // bottom: 18,
                      ),
                      constraints: const BoxConstraints(
                        maxHeight: 40,
                        minHeight: 40,
                      ),
                      suffixIcon: TextButton(
                        child: Text(
                          'Show'.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            // height: 2,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(
                    text: "By selecting ".tr(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: 'Agree and continue'.tr(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      const TextSpan(
                        text: "I agree to Klomi's",
                      ),
                      TextSpan(
                          text: 'Terms of Service, Payments Terms of Service '
                              .tr(),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      TextSpan(
                        text: 'and '.tr(),
                      ),
                      TextSpan(
                          text: 'Nondiscrimination Policy,'.tr(),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      TextSpan(
                        text: ' and acknowledge the '.tr(),
                      ),
                      TextSpan(
                          text: 'Privacy Policy.'.tr(),
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    AuthenticationHelper.addUserInfo(
                        context: context,
                        userId: widget.userId,
                        phoneNumber: widget.userPhoneNumber,
                        dateOfBirth: dateOfBirthtextEditingController.text,
                        email: emailtextEditingController.text,
                        firstName: firstNametextEditingController.text,
                        lastName: surNametextEditingController.text,
                        password: passwordtextEditingController.text,
                        isFromSocialMedia: widget.isFromSocialMedia);
                  },
                  style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(
                        Size(double.infinity, 50)),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'Agree and continue'.tr(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
