import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../contstant/image_path.dart';

class SafetyProperty extends StatelessWidget {
  const SafetyProperty({super.key});

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
                height: 46,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      width: 80,
                    ),
                  ],
                ),
              ),
              const VerticalSpace25px(),
              Text(
                'Safety & property'.tr(),
                style: largeTitle,
              ),
              const VerticalSpace25px(),
              Text(
                  "Avoid surprises by looking over these important details about your Host's property."
                      .tr()),
              const DynamicVerticalSpace(60),
              Text(
                'Safety devices'.tr(),
                style: mediumTitle,
              ),
              const VerticalSpace25px(),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      carbanMonoxideAlarmImagePath,
                      color: Colors.grey,
                    ),
                  ),
                  const DynamicHorizontalSpace(12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Carban monoxide alarm not reported'.tr(),
                          style: mediumDesc,
                        ),
                        const DynamicVerticalSpace(10),
                        Text(
                            "The host has't repoted a carbon monoxide alarm on the property. We suggest bringing a portable dectector for your trip."
                                .tr())
                      ],
                    ),
                  ),
                ],
              ),
              const VerticalSpace25px(),
              const DviderApp(),
              const VerticalSpace25px(),
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      smokeAlarmImagePath,
                      color: Colors.grey,
                    ),
                  ),
                  const DynamicHorizontalSpace(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Smoke alarm not reported'.tr(),
                          style: mediumDesc,
                        ),
                        const DynamicVerticalSpace(10),
                        Text(
                            "The host has't repoted a smoke alarm on the property. We suggest bringing a portable dectector for your trip."
                                .tr())
                      ],
                    ),
                  ),
                ],
              ),
              const VerticalSpace25px(),
            ],
          ),
        ),
      ),
    );
  }
}
