import 'package:klomi/utiles/math_utils.dart';
import 'package:klomi/views/allViews/all_views.dart';
import 'package:klomi/views/feedback/scaffold.dart';
import 'package:klomi/views/login/login_screen.dart';
import 'package:klomi/views/profile/profile_if_not_login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';

import '../../../utiles/kyes.dart';
import '../../listing_posting/screen1.dart';
import '../../notifications/scaffold.dart';
import '../../profile/widgets/profile_item.dart';
import '../../profile_update/scaffold.dart';
import '../../reviews_ratings/scaffold.dart';
import '../explore_hosting_resources/scaffold.dart';
import 'widgets/ad_list.dart';

class HostMenu extends StatefulWidget {
  const HostMenu({Key? key}) : super(key: key);

  @override
  State<HostMenu> createState() => _HostMenuState();
}

class _HostMenuState extends State<HostMenu> {
  var isLogin = FirebaseAuth.instance.currentUser != null;
  @override
  Widget build(BuildContext context) {
    if (!isLogin) {
      return const ProfileIfNotLogin();
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding:
                const EdgeInsets.only(top: 50, right: 25, left: 25, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Menu'.tr(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5)),
                const SizedBox(height: 30),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'HOSTING'.toUpperCase().tr(),
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                const AdListing(),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const GetStartedListing());
                  },
                  child: ProfileItem(
                    text: 'Create a new listing'.tr(),
                    iconData: Icons.house_sharp,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ACCOUNT'.toUpperCase().tr(),
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const ProfileUpdate());
                  },
                  child: ProfileItem(
                    text: 'Your profile'.tr(),
                    iconData: Icons.person,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // InkWell(
                //   onTap: () {},
                //   child: ProfileItem(
                //     text: 'Settings'.tr(),
                //     iconData: Icons.settings,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // InkWell(
                //   onTap: () async {
                //     String url = 'https://www.google.com/';
                //     await launchUrlString(url);
                //   },
                //   child: ProfileItem(
                //     text: 'Visit the Help Center'.tr(),
                //     iconData: Icons.question_mark_rounded,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // InkWell(
                //   onTap: () async {
                //     String url = 'https://www.google.com/';
                //     await launchUrlString(url);
                //   },
                //   child: ProfileItem(
                //     text: 'Get help with a safety issue'.tr(),
                //     iconData: Icons.safety_check,
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const ExploreHostingResources());
                  },
                  child: ProfileItem(
                    text: 'Explore hosting resources'.tr(),
                    iconData: Icons.calendar_month_outlined,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // InkWell(
                //   onTap: () {},
                //   child: ProfileItem(
                //     text: 'Connect with Host near you'.tr(),
                //     iconData: Icons.group,
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                InkWell(
                  onTap: () {
                    Get.to(() => const FeedBack());
                  },
                  child: ProfileItem(
                    text: 'Give us feedback'.tr(),
                    iconData: Icons.edit,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const ReviewsRatings());
                  },
                  child: const ProfileItem(
                    text: 'Rattings and Reviews',
                    iconData: Icons.reviews,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const Notifications());
                  },
                  child: const ProfileItem(
                    text: 'Notifications',
                    iconData: Icons.notifications_outlined,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Container(
                //   height: 50,
                //   width: size.width,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //       border: Border.all(),
                //       borderRadius: BorderRadius.circular(12)),
                //   child: Text('Manage Experiences'.tr()),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                InkWell(
                  onTap: () {
                    GetStorage().write(AppKeys.isSwitchToHostKey, false);

                    Get.offAll(() => const AllViews());
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text('Switch to travelling'.tr()),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        title: Text('log out'.tr()),
                        content: Text(
                            'are you sure you want to logout of Klomi?'.tr()),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('no'.tr())),
                          TextButton(
                              onPressed: () {
                                Get.offAll(() => const LogIn());
                                FirebaseAuth.instance.signOut();
                              },
                              child: Text('yes'.tr())),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      'Log out'.tr(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            )),
      );
    }
  }
}
