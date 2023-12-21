import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/views/exploreDetails/report_listing/we_got_your_report.dart';

import '../../../../utiles/math_utils.dart';

class WhereDidTheyShareTheirContactInformation extends StatefulWidget {
  const WhereDidTheyShareTheirContactInformation({super.key});

  @override
  State<WhereDidTheyShareTheirContactInformation> createState() =>
      _WhereDidTheyShareTheirContactInformationState();
}

class _WhereDidTheyShareTheirContactInformationState
    extends State<WhereDidTheyShareTheirContactInformation> {
  WhereDidTheyShareTheirContactInformationModel howDidTheyAskYouToPayModel =
      WhereDidTheyShareTheirContactInformationModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Where did they share their contact information?".tr(),
              style: largeTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                WhereDidTheyShareTheirContactInformationContainer(
                  title: 'Photos'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isPhotos,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isPhotos =
                          !howDidTheyAskYouToPayModel.isPhotos;
                    });
                  },
                ),
                WhereDidTheyShareTheirContactInformationContainer(
                  title: 'Description'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isDecription,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isDecription =
                          !howDidTheyAskYouToPayModel.isDecription;
                    });
                  },
                ),
                WhereDidTheyShareTheirContactInformationContainer(
                  title: 'House rules'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isHosueRules,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isHosueRules =
                          !howDidTheyAskYouToPayModel.isHosueRules;
                    });
                  },
                ),
                WhereDidTheyShareTheirContactInformationContainer(
                  title: 'Klomi message'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isklomiMessage,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isklomiMessage =
                          !howDidTheyAskYouToPayModel.isklomiMessage;
                    });
                  },
                ),
                WhereDidTheyShareTheirContactInformationContainer(
                  title: 'Something else'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isSomethingElse,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isSomethingElse =
                          !howDidTheyAskYouToPayModel.isSomethingElse;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.white,
        width: size.width,
        height: 104,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DviderApp(),
            Center(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width, 50),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: chekSeletedAllItem()
                          ? () {
                              Get.to(() => const WeGotYourReport());
                            }
                          : null,
                      child: Text(
                        'Next'.tr(),
                        style: const TextStyle(color: Colors.white),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool chekSeletedAllItem() {
    if (howDidTheyAskYouToPayModel.isklomiMessage ||
        howDidTheyAskYouToPayModel.isDecription ||
        howDidTheyAskYouToPayModel.isHosueRules ||
        howDidTheyAskYouToPayModel.isPhotos ||
        howDidTheyAskYouToPayModel.isSomethingElse) {
      return true;
    } else {
      return false;
    }
  }
}

class WhereDidTheyShareTheirContactInformationContainer
    extends StatelessWidget {
  const WhereDidTheyShareTheirContactInformationContainer({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.black : Colors.grey,
              width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            const SizedBox(
              width: 10,
            ),
            const Icon(Icons.add)
          ],
        ),
      ),
    );
  }
}

class WhereDidTheyShareTheirContactInformationModel {
  bool isPhotos;
  bool isDecription;
  bool isHosueRules;
  bool isklomiMessage;
  bool isSomethingElse;
  WhereDidTheyShareTheirContactInformationModel({
    this.isPhotos = false,
    this.isDecription = false,
    this.isHosueRules = false,
    this.isklomiMessage = false,
    this.isSomethingElse = false,
  });

  WhereDidTheyShareTheirContactInformationModel copyWith({
    bool? isPhotos,
    bool? isDecription,
    bool? isHosueRules,
    bool? isklomiMessage,
    bool? isSomethingElse,
  }) {
    return WhereDidTheyShareTheirContactInformationModel(
      isPhotos: isPhotos ?? this.isPhotos,
      isDecription: isDecription ?? this.isDecription,
      isHosueRules: isHosueRules ?? this.isHosueRules,
      isklomiMessage: isklomiMessage ?? this.isklomiMessage,
      isSomethingElse: isSomethingElse ?? this.isSomethingElse,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isPhotos': isPhotos});
    result.addAll({'isDecription': isDecription});
    result.addAll({'isHosueRules': isHosueRules});
    result.addAll({'isklomiMessage': isklomiMessage});
    result.addAll({'isSomethingElse': isSomethingElse});

    return result;
  }

  factory WhereDidTheyShareTheirContactInformationModel.fromMap(
      Map<String, dynamic> map) {
    return WhereDidTheyShareTheirContactInformationModel(
      isPhotos: map['isPhotos'] ?? false,
      isDecription: map['isDecription'] ?? false,
      isHosueRules: map['isHosueRules'] ?? false,
      isklomiMessage: map['isklomiMessage'] ?? false,
      isSomethingElse: map['isSomethingElse'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory WhereDidTheyShareTheirContactInformationModel.fromJson(
          String source) =>
      WhereDidTheyShareTheirContactInformationModel.fromMap(
          json.decode(source));

  @override
  String toString() {
    return 'WhereDidTheyShareTheirContactInformationModel(isPhotos: $isPhotos, isDecription: $isDecription, isHosueRules: $isHosueRules, isklomiMessage: $isklomiMessage, isSomethingElse: $isSomethingElse)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WhereDidTheyShareTheirContactInformationModel &&
        other.isPhotos == isPhotos &&
        other.isDecription == isDecription &&
        other.isHosueRules == isHosueRules &&
        other.isklomiMessage == isklomiMessage &&
        other.isSomethingElse == isSomethingElse;
  }

  @override
  int get hashCode {
    return isPhotos.hashCode ^
        isDecription.hashCode ^
        isHosueRules.hashCode ^
        isklomiMessage.hashCode ^
        isSomethingElse.hashCode;
  }
}
