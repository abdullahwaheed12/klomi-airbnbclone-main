import 'package:klomi/models/explore_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../contstant/text_styles.dart';
import '../../../../helper/app_toast.dart';
import '../controller.dart';

class EditAboutYourPlace extends StatefulWidget {
  const EditAboutYourPlace({super.key, required this.exploreModel});
  final ExploreModel exploreModel;
  @override
  State<EditAboutYourPlace> createState() => _EditAboutYourPlaceState();
}

class _EditAboutYourPlaceState extends State<EditAboutYourPlace> {
  var guestCount = 4;
  var bedroomsCount = 1;
  var bedsCount = 1;
  var bathroomsCount = 1;
  var privateBathrooms = 1;
  @override
  void initState() {
    super.initState();
    guestCount = widget.exploreModel.hostModel.guests;
    bedroomsCount = widget.exploreModel.hostModel.bedRoom;
    bedsCount = widget.exploreModel.hostModel.bed;
    bathroomsCount = widget.exploreModel.hostModel.sharedBath.toInt();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Update basics about your place'.tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 20,
              ),
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
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            widget.exploreModel.hostModel.guests = guestCount;
            widget.exploreModel.hostModel.bedRoom = bedroomsCount;
            widget.exploreModel.hostModel.bed = bedsCount;
            widget.exploreModel.hostModel.sharedBath = bathroomsCount;
            FirebaseFirestore.instance
                .collection('posts')
                .doc(widget.exploreModel.adId)
                .update(widget.exploreModel.toMap())
                .then((value) {
              AppToast.showToast(message: 'updated'.tr());
              Get.find<ListingStatusController>().update();
            }).catchError((e) {
              debugPrint('--->>>>>>  error  $e');
              AppToast.showToast(message: 'error while updating'.tr());
            });

            Get.back();
          },
          child: Text(
            'Save'.tr(),
            style: const TextStyle(color: Colors.white),
          )),
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
