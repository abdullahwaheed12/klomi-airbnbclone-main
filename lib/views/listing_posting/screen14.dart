import 'package:klomi/views/listing_posting/screen15.dart';

import 'package:klomi/views/listing_posting/widgets/next_back.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../contstant/image_path.dart';
import '../../contstant/text_styles.dart';

class FinishPublishStep extends StatelessWidget {
  const FinishPublishStep({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 400, width: 400, child: Image.asset(houseImagePath)),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Step 3'.tr(),
                style: smallTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Finish up and publish'.tr(),
                style: largeTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  "Finally, you'll choose if you'd like to start with an experienced guest, then you'll set your nightly price. Answer a few quick questions and publish when you're ready."
                      .tr()),
              const Spacer(),
              NextBack(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChooseFirstReservation(
                        allPreviousArgu: allPreviousArgu),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
