import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../controllers/adpost_controller.dart';

class HostLanguage extends StatelessWidget {
  const HostLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var logic = Get.find<AdController>();

    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10.0),
            child: Text(
              'Host language'.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            title: Text("English".tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: logic.isEnglish,
              onChanged: (bool? value) {
                logic.isEnglish = value!;
                logic.update();
              },
            ),
          ),
          ListTile(
            title: Text("French".tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: logic.isFrench,
              onChanged: (bool? value) {
                logic.isFrench = value!;
                logic.update();
              },
            ),
          ),
          ListTile(
            title: Text("German".tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: logic.isGerman,
              onChanged: (bool? value) {
                logic.isGerman = value!;
                logic.update();
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, right: 10.0),
          //   child: InkWell(
          //     onTap: () {
          //       logic.isAnimitiesExpand = !logic.isAnimitiesExpand;
          //       logic.update();
          //     },
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text(
          //           logic.isAnimitiesExpand
          //               ? 'show less'.tr()
          //               : 'show more'.tr(),
          //           style:
          //               const TextStyle(decoration: TextDecoration.underline),
          //         ),
          //         Icon(
          //           logic.isAnimitiesExpand
          //               ? Icons.expand_less
          //               : Icons.expand_more,
          //           size: 20,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      );
    });
  }
}
