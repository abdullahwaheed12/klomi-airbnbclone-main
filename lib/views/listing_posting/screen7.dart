import 'package:klomi/utiles/kyes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/text_styles.dart';
import 'screen8.dart';
import 'widgets/next_back.dart';

class AboutYourPlace extends StatefulWidget {
  const AboutYourPlace({super.key, required this.allPreviousArgument});

  final Map allPreviousArgument;

  @override
  State<AboutYourPlace> createState() => _AboutYourPlaceState();
}

class _AboutYourPlaceState extends State<AboutYourPlace> {
  var guestCount = 4;
  var bedroomsCount = 1;
  var bedsCount = 1;
  var bathroomsCount = 1;
  var privateBathrooms = 1;
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
                height: 50,
              ),
              Text(
                'Share some basics about your place'.tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text("You'll add more details later, like bed types.".tr()),
              const SizedBox(
                height: 20,
              ),
              SelectionWidget(
                decreament: () {
                  if (guestCount == 0) {
                    return;
                  }
                  setState(() {
                    guestCount--;
                  });
                },
                increament: () {
                  setState(() {
                    guestCount++;
                  });
                },
                count: guestCount,
                title: 'Guests'.tr(),
              ),
              const SizedBox(
                height: 20,
              ),
              SelectionWidget(
                count: bedroomsCount,
                decreament: () {
                  if (bedroomsCount == 0) {
                    return;
                  }
                  setState(() {
                    bedroomsCount--;
                  });
                },
                increament: () {
                  setState(() {
                    bedroomsCount++;
                  });
                },
                title: 'Bedrooms'.tr(),
              ),
              const SizedBox(
                height: 20,
              ),
              SelectionWidget(
                count: bedsCount,
                decreament: () {
                  if (bedsCount == 0) {
                    return;
                  }
                  setState(() {
                    bedsCount--;
                  });
                },
                increament: () {
                  setState(() {
                    bedsCount++;
                  });
                },
                title: 'Beds'.tr(),
              ),
              const SizedBox(
                height: 20,
              ),
              SelectionWidget(
                count: bathroomsCount,
                decreament: () {
                  if (bathroomsCount == 0) {
                    return;
                  }
                  setState(() {
                    bathroomsCount--;
                  });
                },
                increament: () {
                  setState(() {
                    bathroomsCount++;
                  });
                },
                title: 'Bathroooms'.tr(),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Are any of these bathrooms private?'.tr(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Yes'.tr()),
                  const Spacer(),
                  Radio(
                    value: privateBathrooms,
                    groupValue: 1,
                    onChanged: (value) {
                      privateBathrooms = 1;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("No,they're all shared".tr()),
                  const Spacer(),
                  Radio(
                    value: privateBathrooms,
                    groupValue: 2,
                    onChanged: (value) {
                      privateBathrooms = 2;
                      setState(() {});
                    },
                  ),
                ],
              ),
              const Spacer(),
              NextBack(
                onPressed: () {
                  bool isPrivateBathRooms;
                  if (privateBathrooms == 1) {
                    isPrivateBathRooms = true;
                  } else {
                    isPrivateBathRooms = false;
                  }
                  Get.to(() => MakeYourPlaceStandOut(
                        allPreviousArgument: {
                          ...widget.allPreviousArgument,
                          AppKeys.isPrivateBathroomsKey: isPrivateBathRooms,
                          AppKeys.guestCountKey: guestCount,
                          AppKeys.bedroomCountKey: bedroomsCount,
                          AppKeys.bedsCountKey: bedsCount,
                          AppKeys.bathroomsCountKey: bathroomsCount,
                        },
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionWidget extends StatelessWidget {
  const SelectionWidget({
    super.key,
    required this.title,
    required this.decreament,
    required this.increament,
    required this.count,
  });
  final String title;
  final void Function() increament;
  final void Function() decreament;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const Spacer(),
        InkWell(
          onTap: decreament,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.remove),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(count.toString()),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: increament,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
