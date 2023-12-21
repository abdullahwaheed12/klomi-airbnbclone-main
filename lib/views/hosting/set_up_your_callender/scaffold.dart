import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/utiles/math_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SetUpYourCallendar extends StatefulWidget {
  const SetUpYourCallendar({super.key});

  @override
  State<SetUpYourCallendar> createState() => _SetUpYourCallendarState();
}

class _SetUpYourCallendarState extends State<SetUpYourCallendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Set up your calendar'.tr(),
                    style: largeTitle,
                  )),
              const VerticalSpace25px(),
              Text(
                  'Use availability settings to customize how and when you want to host.'
                      .tr()),
              const DynamicVerticalSpace(50),
              Text(
                'How long can guests stay?'.tr(),
                style: mediumTitle,
              ),
              const DynamicVerticalSpace(20),
              Text('Minimum stay'.tr()),
              const DynamicVerticalSpace(10),
              TextField(
                decoration: InputDecoration(hintText: '1 night'.tr()),
              ),
              const DynamicVerticalSpace(10),
              Text('Maximum stay'.tr()),
              const DynamicVerticalSpace(10),
              TextField(
                decoration: InputDecoration(hintText: '365 night'.tr()),
              ),
              const DynamicVerticalSpace(30),
              Text(
                'How much time do you need between booking and check-in?'.tr(),
                style: mediumTitle,
              ),
              const DynamicVerticalSpace(10),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.25,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Same day'.tr()),
                                  const DynamicVerticalSpace(30),
                                  Text("At least 1 day's notice".tr()),
                                  const DynamicVerticalSpace(20),
                                  Text("At least 2 day's notice".tr()),
                                  const DynamicVerticalSpace(20),
                                  Text("At least 3 day's notice".tr()),
                                  const DynamicVerticalSpace(30),
                                  Text("At least 7 day's notice".tr()),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text('Same day'.tr()),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                ),
              ),
              const DynamicVerticalSpace(10),
              Text(
                'Same day, until 8:59 AM'.tr(),
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const DynamicVerticalSpace(30),
              Text(
                'How far into the future can guests book?'.tr(),
                style: mediumTitle,
              ),
              const DynamicVerticalSpace(10),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.3,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('All future dates'.tr()),
                                  const DynamicVerticalSpace(30),
                                  Text("12 months in advance".tr()),
                                  const DynamicVerticalSpace(20),
                                  const Text("9 months in advance"),
                                  const DynamicVerticalSpace(20),
                                  const Text("6 months in advance"),
                                  const DynamicVerticalSpace(20),
                                  const Text("3 months in advance"),
                                  const DynamicVerticalSpace(30),
                                  Text("Dates unavailable by default".tr()),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text('12 months in advance'.tr()),
                      const Spacer(),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                ),
              ),
              const DynamicVerticalSpace(10),
              Text(
                "Your listing isn't available after 1 year from today.".tr(),
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const DynamicVerticalSpace(50),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        color: Colors.white,
        width: size.width,
        height: 60,
        child: Center(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 45),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Confirm'.tr(),
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
