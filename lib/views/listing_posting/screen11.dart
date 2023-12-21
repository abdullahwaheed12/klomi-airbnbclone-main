import 'package:klomi/utiles/kyes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/text_styles.dart';
import 'screen13.dart';
import 'widgets/next_back.dart';

class CabinTitle extends StatefulWidget {
  const CabinTitle({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;

  @override
  State<CabinTitle> createState() => _CabinTitleState();
}

class _CabinTitleState extends State<CabinTitle> {
  var cabinTitle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Now, let's give your cabin a title".tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                  "Short titles work best. Have fun with it ---you can always change it later."
                      .tr()),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: cabinTitle,
                maxLines: 5,
                maxLength: 32,
                decoration: const InputDecoration(),
              ),
              const Spacer(),
              NextBack(
                onPressed: () {
                  if (cabinTitle.text.isNotEmpty) {
                    var allPreviousArgu = {
                      AppKeys.cabinTitleKey: cabinTitle.text,
                      ...widget.allPreviousArgu
                    };
                    Get.to(
                      () => DescriptionScreen(
                        allPreviousArgu: allPreviousArgu,
                      ),
                    );
                  } else {
                    Get.snackbar(
                        'Empty'.tr(), 'Please give a title to your cabin'.tr());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
