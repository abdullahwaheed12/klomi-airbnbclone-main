import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:flutter/material.dart';

class CancellationPolicy extends StatelessWidget {
  const CancellationPolicy({super.key});

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
                'Cancellation policy'.tr(),
                style: largeTitle,
              ),
              const VerticalSpace25px(),
              Text(
                  "Before you book, make sure you're comfortable with this Host's cancellation policy. Keep in mind that klomi's Extenuating Circumstances policy does't cover cancellations due to illness or travel disruptions caused by COVID-19."
                      .tr()),
              const DynamicVerticalSpace(60),
              // Text(
              //   'Cancel by',
              //   style: mediumTitle,
              // ),
              // const VerticalSpace25px(),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: Column(
              //         children: [
              //           Text(
              //             'Feb 16',
              //             style: mediumTitle,
              //           ),
              //           Text(
              //             '3.00 PM',
              //             style: smallDesc,
              //           ),
              //         ],
              //       ),
              //     ),
              //     const Expanded(
              //       flex: 3,
              //       child: Text('Full refund. Get back 100% of what you paid.'),
              //     ),
              //   ],
              // ),
              // const VerticalSpace25px(),
              // const DviderApp(),
              // const VerticalSpace25px(),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: Column(
              //         children: [
              //           Text(
              //             'Feb 17',
              //             style: mediumTitle,
              //           ),
              //           Text(
              //             '3.00 PM',
              //             style: smallDesc,
              //           ),
              //         ],
              //       ),
              //     ),
              //     const Expanded(
              //       flex: 3,
              //       child: Text(
              //           'Partial refund: Get back every night but the first one. No refund of the first night or the service fee.'),
              //     ),
              //   ],
              // ),

              const VerticalSpace25px(),
            ],
          ),
        ),
      ),
    );
  }
}
