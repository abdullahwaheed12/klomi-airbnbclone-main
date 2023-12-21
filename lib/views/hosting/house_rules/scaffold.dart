import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';
import 'package:klomi/utiles/math_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import 'logic.dart';

class HouseRules extends StatefulWidget {
  const HouseRules({super.key});

  @override
  State<HouseRules> createState() => _HouseRulesState();
}

class _HouseRulesState extends State<HouseRules> {
  late HouseRulesLogic houseRulesLogic;
  @override
  void initState() {
    houseRulesLogic = Get.put(HouseRulesLogic());
    super.initState();
  }

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
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Set your House Rules'.tr(),
                    style: largeTitle,
                  )),
              const VerticalSpace25px(),
              Text(
                  'Guests are expected to follow your rules and can be removed form Klomi if they cause issues.'
                      .tr()),
              //1
              const DynamicVerticalSpace(50),
              ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Pets allowed'.tr(),
                    ),
                  ),
                  subtitle: Text(
                      "You can refuse pets, but must reasonably accommodate assistance animals."
                          .tr()),
                  trailing: HouseRulesCheckCross(
                    isSelected: houseRulesLogic.isPetAllowed,
                    crossOnTab: () {
                      setState(() {
                        houseRulesLogic.isPetAllowed = false;
                      });
                    },
                    checkOnTab: () {
                      setState(() {
                        houseRulesLogic.isPetAllowed = true;
                      });
                    },
                  )),

              const DynamicVerticalSpace(5),
              const DviderApp(),
              //2
              const DynamicVerticalSpace(5),

              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Events Allowed'.tr(),
                  ),
                ),
                trailing: HouseRulesCheckCross(
                  isSelected: houseRulesLogic.isEventAllowed,
                  crossOnTab: () {
                    setState(() {
                      houseRulesLogic.isEventAllowed = false;
                    });
                  },
                  checkOnTab: () {
                    setState(() {
                      houseRulesLogic.isEventAllowed = true;
                    });
                  },
                ),
              ),
              const DynamicVerticalSpace(5),

              const DviderApp(),
              //3
              const DynamicVerticalSpace(5),

              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Smoking, vaping, e-cigarettes allowed'.tr(),
                  ),
                ),
                trailing: HouseRulesCheckCross(
                  isSelected: houseRulesLogic.isSmokingVapingAllowed,
                  crossOnTab: () {
                    setState(() {
                      houseRulesLogic.isSmokingVapingAllowed = false;
                    });
                  },
                  checkOnTab: () {
                    setState(() {
                      houseRulesLogic.isSmokingVapingAllowed = true;
                    });
                  },
                ),
              ),
              const DynamicVerticalSpace(5),

              const DviderApp(),
              //4
              const DynamicVerticalSpace(5),

              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Quiet hours'.tr(),
                  ),
                ),
                trailing: HouseRulesCheckCross(
                  isSelected: houseRulesLogic.isSetQuietHours,
                  crossOnTab: () {
                    setState(() {
                      houseRulesLogic.isSetQuietHours = false;
                    });
                  },
                  checkOnTab: () {
                    setState(() {
                      houseRulesLogic.isSetQuietHours = true;
                    });
                  },
                ),
              ),
              if (houseRulesLogic.isSetQuietHours != null &&
                  houseRulesLogic.isSetQuietHours!)
                const DynamicVerticalSpace(5),
              if (houseRulesLogic.isSetQuietHours != null &&
                  houseRulesLogic.isSetQuietHours!)
                const QuietHours(),
              const DynamicVerticalSpace(5),

              const DviderApp(),
              //5
              const DynamicVerticalSpace(5),

              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Commercial photography and filming allowed'.tr(),
                  ),
                ),
                trailing: HouseRulesCheckCross(
                  isSelected:
                      houseRulesLogic.isCommercialPhotographyFilmingAllowed,
                  crossOnTab: () {
                    setState(() {
                      houseRulesLogic.isCommercialPhotographyFilmingAllowed =
                          false;
                    });
                  },
                  checkOnTab: () {
                    setState(() {
                      houseRulesLogic.isCommercialPhotographyFilmingAllowed =
                          true;
                    });
                  },
                ),
              ),
              const DynamicVerticalSpace(60)
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
                  onPressed: () {
                    houseRulesLogic.updateHouseRules();
                  },
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

class HouseRulesCheckCross extends StatefulWidget {
  const HouseRulesCheckCross(
      {super.key,
      required this.isSelected,
      required this.crossOnTab,
      required this.checkOnTab});
  final bool? isSelected;
  final void Function()? crossOnTab;
  final void Function()? checkOnTab;
  @override
  State<HouseRulesCheckCross> createState() => _HouseRulesCheckCrossState();
}

class _HouseRulesCheckCrossState extends State<HouseRulesCheckCross> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      InkWell(
        onTap: widget.crossOnTab,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: widget.isSelected != null
                ? widget.isSelected!
                    ? Colors.white
                    : Colors.black
                : Colors.white,
            border: Border.all(),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.clear,
            color: widget.isSelected != null
                ? widget.isSelected!
                    ? Colors.black
                    : Colors.white
                : Colors.black,
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      InkWell(
        onTap: widget.checkOnTab,
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: widget.isSelected != null
                ? widget.isSelected!
                    ? Colors.black
                    : Colors.white
                : Colors.white,
            border: Border.all(),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check_outlined,
            color: widget.isSelected != null
                ? widget.isSelected!
                    ? Colors.white
                    : Colors.black
                : Colors.black,
          ),
        ),
      )
    ]);
  }
}

class QuietHours extends StatefulWidget {
  const QuietHours({super.key});

  @override
  State<QuietHours> createState() => _QuietHoursState();
}

class _QuietHoursState extends State<QuietHours> {
  late HouseRulesLogic houseRulesLogic;
  @override
  void initState() {
    houseRulesLogic = Get.find<HouseRulesLogic>();
    super.initState();
  }

  String convertDateTime(int hour) {
    if (hour < 12) {
      return 'AM';
    } else {
      return 'PM';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              var newTime = await showTimePicker(
                  context: context, initialTime: houseRulesLogic.from);
              //if 'CANCEl' => null
              if (newTime == null) return;
              //if 'OK' => TimeOfDay
              setState(() {
                houseRulesLogic.from = newTime;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From'.tr(),
                        style: smallDesc,
                      ),
                      Text(
                          '${houseRulesLogic.from.hourOfPeriod.toString().padLeft(2, '0')}:${houseRulesLogic.from.minute.toString().padLeft(2, '0')} ${convertDateTime(houseRulesLogic.from.hour)}'),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: InkWell(
            onTap: () async {
              var newTime = await showTimePicker(
                  context: context, initialTime: houseRulesLogic.to);
              //if 'CANCEl' => null
              if (newTime == null) return;
              //if 'OK' => TimeOfDay
              setState(() {
                houseRulesLogic.to = newTime;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'To'.tr(),
                        style: smallDesc,
                      ),
                      Text(
                          '${houseRulesLogic.to.hourOfPeriod.toString().padLeft(2, '0')}:${houseRulesLogic.to.minute.toString().padLeft(2, '0')} ${convertDateTime(houseRulesLogic.to.hour)}'),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
