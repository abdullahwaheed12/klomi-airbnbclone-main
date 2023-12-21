import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/utiles/kyes.dart';
import 'package:klomi/views/feedback/scaffold.dart';
import 'package:klomi/views/hosting/all_views/hosting_all_views.dart';
import 'package:klomi/views/list_your_space/list_your_space.dart';
import 'package:klomi/views/login/login_screen.dart';
import 'package:klomi/views/notifications/scaffold.dart';
import 'package:klomi/views/profile/payments_and_payouts.dart';
import 'package:klomi/views/profile_update/scaffold.dart';
import 'package:klomi/views/profile/profile_if_not_login.dart';
import 'package:klomi/views/profile/translation_view/scaffold.dart';
import 'package:klomi/views/profile/widgets/profile_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../contstant/text_styles.dart';
import '../listing_posting/screen1.dart';
import '../reviews_ratings/scaffold.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var isLogin = FirebaseAuth.instance.currentUser != null;
  @override
  Widget build(BuildContext context) {
    if (!isLogin) {
      return const ProfileIfNotLogin();
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: 100, right: 25, left: 25, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('your profile'.tr(),
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5)),
                const SizedBox(height: 30),
                profile(),
                accountSetting(),
                hosting(),
                support(),
                legal(),
                logOut(),
              ],
            )),
      );
    }
  }

  Widget titles(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
      child: Text(text, style: mediumTitle),
    );
  }

  Widget profile() {
    return GetBuilder<GeneralGetxController>(
      builder: (controller) {
        if (controller.currentUserModel != null) {
          var userModel = controller.currentUserModel!;
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfileUpdate(),
              ));
            },
            child: ProfileItem(
              text: '${userModel.firstName} ${userModel.lastName}',
              isProfileSection: false,
              description: 'show profile'.tr(),
              image: userModel.imageUrl,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  Widget accountSetting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titles('account Setting'.tr()),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfileUpdate(),
            ));
          },
          child: ProfileItem(
            text: 'personal information'.tr(),
            iconData: Icons.supervised_user_circle_outlined,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const PaymentsAndPayOuts(),
            ));
          },
          child: ProfileItem(
            text: 'payments and payouts'.tr(),
            iconData: Icons.payments_outlined,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TranslationView(),
            ));
          },
          child: ProfileItem(
            text: 'translations'.tr(),
            iconData: Icons.language_sharp,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const Notifications(),
            ));
          },
          child: ProfileItem(
            text: 'notifications'.tr(),
            iconData: Icons.notifications_none_sharp,
          ),
        ),
        // InkWell(
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => const PrivacyAndSharing(),
        //     ));
        //   },
        //   child: ProfileItem(
        //     text: 'privacy and sharing'.tr(),
        //     iconData: Icons.lock_outline,
        //   ),
        // ),
        // InkWell(
        //   onTap: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => const TravelForWork(),
        //     ));
        //   },
        //   child: ProfileItem(
        //     text: 'travel for work'.tr(),
        //     iconData: Icons.card_travel_outlined,
        //   ),
        // ),
      ],
    );
  }

  Widget hosting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titles('hosting'.tr()),
        InkWell(
          onTap: () {
            Get.to(() => const ListYourSpace());
          },
          child: ProfileItem(
            text: "list your space".tr(),
            iconData: Icons.add_home_work_outlined,
          ),
        ),
        InkWell(
          onTap: () {
            GetStorage().write(AppKeys.isSwitchToHostKey, true).then((value) {
              var v = GetStorage().read(AppKeys.isSwitchToHostKey);
              print('Switch to hosting $v');
            });
            Get.to(() => const HostingAllViews());
          },
          child: const ProfileItem(
            text: "Switch to hosting",
            iconData: Icons.sync_alt,
          ),
        ),
        ProfileItem(
          text: 'learn about hosting'.tr(),
          iconData: Icons.houseboat_outlined,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const GetStartedListing(),
            ));
          },
          child: ProfileItem(
            text: 'host an Experience'.tr(),
            iconData: Icons.gite,
          ),
        ),
      ],
    );
  }

  Widget support() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titles('support'.tr()),
        InkWell(
          onTap: () async {
            String url = 'https://www.google.com/';
            await launchUrlString(url);
          },
          child: ProfileItem(
            text: 'how Klomi works'.tr(),
            iconData: Icons.abc,
          ),
        ),
        InkWell(
          onTap: () async {
            String url = 'https://www.google.com/';
            await launchUrlString(url);
          },
          child: ProfileItem(
            text: 'safety Center'.tr(),
            iconData: Icons.safety_check,
            description:
                'get the support, tools, and information vou need to be safe'
                    .tr(),
          ),
        ),
        // InkWell(
        //   onTap: () async {
        //     String url = 'https://www.google.com/';
        //     await launchUrlString(url);
        //   },
        //   child: ProfileItem(
        //     text: 'contact Neighborhood Support'.tr(),
        //     iconData: Icons.headphones,
        //     description:
        //         'let our team know about concerns related to home sharing activity in your area.'
        //             .tr(),
        //   ),
        // ),
        // InkWell(
        //   onTap: () async {
        //     String url = 'https://www.google.com/';
        //     await launchUrlString(url);
        //   },
        //   child: ProfileItem(
        //     text: 'get help'.tr(),
        //     iconData: Icons.question_mark_rounded,
        //   ),
        // ),
        InkWell(
          onTap: () {
            Get.to(() => const FeedBack());
          },
          child: ProfileItem(
            text: 'give us feedback'.tr(),
            iconData: Icons.edit_outlined,
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
      ],
    );
  }

  Widget legal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titles('legal'.tr()),
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
      ],
    );
  }

  Widget logOut() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: Text('log out'.tr()),
                  content:
                      Text('are you sure you want to logout of Klomi?'.tr()),
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
            child: Text(
              'log out'.tr(),
              style: underLineText,
            ),
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.black26,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
          child: Text(
            'version 22.45.1'.tr(),
            style: smallDesc,
          ),
        ),
      ],
    );
  }
}
