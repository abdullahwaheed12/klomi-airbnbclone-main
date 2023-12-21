import 'package:klomi/utiles/kyes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rolling_switch/rolling_switch.dart';

import '../../../main.dart';

class TranslationView extends StatefulWidget {
  const TranslationView({super.key});

  @override
  State<TranslationView> createState() => _TranslationViewState();
}

class _TranslationViewState extends State<TranslationView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.035,
            right: width * 0.035,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Translation'.tr(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5),
              ),
              SizedBox(height: height * 0.01),
              Text(
                "Automatically translate the reviews, description, and messages written by guests and Hosts to English. Turn this feature off if you'd like to show the original language."
                    .tr(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text(
                  'Translation'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
                trailing: RollingSwitch.icon(
                  initialState:
                      GetStorage().read(AppKeys.isTranslationKey) ?? false,
                  circularColor: Colors.white,
                  onChanged: (bool state) {
                    if (state) {
                      setState(() {
                        context.setLocale(const Locale('en', 'US'));
                      });
                    } else {
                      setState(() {
                        context.setLocale(const Locale('fr', 'FR'));
                      });
                    }
                    // Get.offAll(() => const AllViews());
                    GetStorage().write(AppKeys.isTranslationKey, state);
                    RestartWidget.restartApp(context);
                  },
                  onTap: () {},
                  rollingInfoRight: const RollingIconInfo(
                    icon: Icons.check,
                    iconColor: Colors.black,
                    // text: Text('Flag'),
                  ),
                  rollingInfoLeft: const RollingIconInfo(
                    icon: Icons.cancel,
                    backgroundColor: Colors.grey,
                    // text: Text('Check'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
