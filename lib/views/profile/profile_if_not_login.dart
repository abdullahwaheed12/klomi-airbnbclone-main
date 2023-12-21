import 'package:klomi/views/login/login_screen.dart';
import 'package:klomi/views/profile/widgets/profile_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:url_launcher/url_launcher_string.dart';

import '../../contstant/text_styles.dart';

class ProfileIfNotLogin extends StatefulWidget {
  const ProfileIfNotLogin({Key? key}) : super(key: key);

  @override
  State<ProfileIfNotLogin> createState() => _ProfileIfNotLoginState();
}

class _ProfileIfNotLoginState extends State<ProfileIfNotLogin> {
  var isLogin = FirebaseAuth.instance.currentUser != null;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 80, right: 25, left: 25, bottom: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('your profile'.tr(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5)),
              const SizedBox(height: 10),
              Text(
                'Login to start planning your next trip'.tr(),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width, 50),
                  ),
                  onPressed: () {
                    Get.offAll(() => const LogIn());
                  },
                  child: Text(
                    'Log in'.tr(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 30,
              ),
              Text.rich(
                TextSpan(
                  text: "Don't have an account? ".tr(),
                  children: [
                    TextSpan(
                        text: 'Sign up'.tr(),
                        style: mediumTitle.copyWith(
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.offAll(() => const LogIn())),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // ProfileItem(
              //   text: 'Settings'.tr(),
              //   iconData: Icons.settings,
              // ),
              // ProfileItem(
              //   text: 'Learn about hosting'.tr(),
              //   iconData: Icons.home,
              // ),
              InkWell(
                onTap: () async {
                  String url = 'https://www.google.com/';
                  await launchUrlString(url);
                },
                child: ProfileItem(
                  text: 'get help'.tr(),
                  iconData: Icons.question_mark_rounded,
                ),
              ),
              InkWell(
                onTap: () async {
                  String url = 'https://www.google.com/';
                  await launchUrlString(url);
                },
                child: ProfileItem(
                  text: 'terms of Services'.tr(),
                  iconData: Icons.terminal_sharp,
                ),
              ),
              InkWell(
                onTap: () async {
                  String url = 'https://www.google.com/';
                  await launchUrlString(url);
                },
                child: ProfileItem(
                  text: 'privacy Policy'.tr(),
                  iconData: Icons.terminal_sharp,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'version 22.45.1'.tr(),
                style: smallDesc,
              ),
            ],
          )),
    );
  }
}
