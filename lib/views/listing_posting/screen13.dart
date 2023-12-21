import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/utiles/kyes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import 'screen14.dart';
import 'widgets/next_back.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Next, let\'s describe your experience'.tr(),
                style: largeTitle,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                'What you and your guests do?'.tr(),
                style: mediumDesc,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '\u2022 ${"Provide specific plans from start to finish, not multiple ideas or options".tr()}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    '\u2022 ${"Describe what makes your experience special - something that guests wouldn't do on their own".tr()}'),
              ),
              const SizedBox(
                height: 35,
              ),
              TextField(
                maxLines: 5,
                controller: descController,
                decoration: const InputDecoration(),
              ),
              const Spacer(),
              NextBack(
                onPressed: () {
                  if (descController.text.isNotEmpty) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FinishPublishStep(allPreviousArgu: {
                        AppKeys.descriptionKey: descController.text,
                        ...widget.allPreviousArgu
                      }),
                    ));
                  } else {
                    Get.snackbar('Empty'.tr(), 'Empty Description'.tr());
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
