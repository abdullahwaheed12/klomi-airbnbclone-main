// ignore_for_file: prefer_const_constructors

import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/views/listing_posting/screen2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/text_styles.dart';
import 'logic.dart';

class GetStartedListing extends StatelessWidget {
  const GetStartedListing({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.put(ListingLogic());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "It's easy to get started on Klomi".tr(),
                style: largeTitle,
              ),
              const SizedBox(
                height: 40,
              ),
              InfoStepsContainer(
                sr: '1',
                title: 'Tell us about your place'.tr(),
                content:
                    'Share some basic info, like where it is and how many guests can stay.'
                        .tr(),
                imageUrl: bedImagePath,
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 30,
              ),
              InfoStepsContainer(
                sr: '2',
                title: 'Make it stand out'.tr(),
                content:
                    "Add 5 or more plus photos and title,discription - we'll help you out."
                        .tr(),
                imageUrl: imageFrameImagePath,
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 30,
              ),
              InfoStepsContainer(
                sr: '3',
                title: 'Finish up and publish'.tr(),
                content:
                    "Choose if you'd like to start with an experienced guest, set a starting price and publish your listing."
                        .tr(),
                imageUrl: finishPublishImagePath,
              ),
              Spacer(),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: Size(size.width, 50)),
                  onPressed: () {
                    Get.to(() => TellUsAboutYourPlace());
                  },
                  child: Text('Get started'.tr()))
            ],
          ),
        ),
      ),
    );
  }
}

class InfoStepsContainer extends StatelessWidget {
  const InfoStepsContainer(
      {super.key,
      required this.content,
      required this.imageUrl,
      required this.sr,
      required this.title});
  final String sr;
  final String title;
  final String content;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
            width: 30,
            child: Text(
              sr,
              style: mediumTitle,
            )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: mediumTitle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(content),
            ],
          ),
        ),
        SizedBox(width: 80, height: 80, child: Image.asset(imageUrl)),
      ],
    );
  }
}
