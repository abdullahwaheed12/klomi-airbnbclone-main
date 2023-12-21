import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';
import 'package:klomi/views/exploreDetails/report_listing/we_got_your_report.dart';

import '../../../../utiles/math_utils.dart';

class WhatIsMisldeading extends StatefulWidget {
  const WhatIsMisldeading({super.key});

  @override
  State<WhatIsMisldeading> createState() => _WhatIsMisldeadingState();
}

class _WhatIsMisldeadingState extends State<WhatIsMisldeading> {
  WhatIsMisldeadingModel whatIsMisldeadingModel = WhatIsMisldeadingModel();
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
              "What is misleading?".tr(),
              style: largeTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                WhereDidTheyAdvertiseContainer(
                  title: 'Photos'.tr(),
                  isSelected: whatIsMisldeadingModel.isPhotos,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isPhotos =
                          !whatIsMisldeadingModel.isPhotos;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'Description'.tr(),
                  isSelected: whatIsMisldeadingModel.isDescription,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isDescription =
                          !whatIsMisldeadingModel.isDescription;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'House rules'.tr(),
                  isSelected: whatIsMisldeadingModel.isHosueRules,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isHosueRules =
                          !whatIsMisldeadingModel.isHosueRules;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'Title'.tr(),
                  isSelected: whatIsMisldeadingModel.isTitle,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isTitle =
                          !whatIsMisldeadingModel.isTitle;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'Location'.tr(),
                  isSelected: whatIsMisldeadingModel.isLocation,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isLocation =
                          !whatIsMisldeadingModel.isLocation;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'Price'.tr(),
                  isSelected: whatIsMisldeadingModel.isPrice,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isPrice =
                          !whatIsMisldeadingModel.isPrice;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'Amenities'.tr(),
                  isSelected: whatIsMisldeadingModel.isAmenties,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isAmenties =
                          !whatIsMisldeadingModel.isAmenties;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'Bedroooms'.tr(),
                  isSelected: whatIsMisldeadingModel.isBedRooms,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isBedRooms =
                          !whatIsMisldeadingModel.isBedRooms;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'Bathrooms'.tr(),
                  isSelected: whatIsMisldeadingModel.isBathRooms,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isBathRooms =
                          !whatIsMisldeadingModel.isBathRooms;
                    });
                  },
                ),
                WhereDidTheyAdvertiseContainer(
                  title: 'Something else'.tr(),
                  isSelected: whatIsMisldeadingModel.isSomethingElse,
                  onTap: () {
                    setState(() {
                      whatIsMisldeadingModel.isSomethingElse =
                          !whatIsMisldeadingModel.isSomethingElse;
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
    if (whatIsMisldeadingModel.isPhotos ||
        whatIsMisldeadingModel.isDescription ||
        whatIsMisldeadingModel.isHosueRules ||
        whatIsMisldeadingModel.isTitle ||
        whatIsMisldeadingModel.isLocation ||
        whatIsMisldeadingModel.isPrice ||
        whatIsMisldeadingModel.isAmenties ||
        whatIsMisldeadingModel.isBedRooms ||
        whatIsMisldeadingModel.isBathRooms ||
        whatIsMisldeadingModel.isSomethingElse) {
      return true;
    } else {
      return false;
    }
  }
}

class WhereDidTheyAdvertiseContainer extends StatelessWidget {
  const WhereDidTheyAdvertiseContainer({
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

class WhatIsMisldeadingModel {
  bool isPhotos;
  bool isDescription;
  bool isHosueRules;
  bool isTitle;
  bool isLocation;
  bool isPrice;
  bool isAmenties;
  bool isBedRooms;
  bool isBathRooms;
  bool isSomethingElse;
  WhatIsMisldeadingModel({
    this.isPhotos = false,
    this.isDescription = false,
    this.isHosueRules = false,
    this.isTitle = false,
    this.isLocation = false,
    this.isPrice = false,
    this.isAmenties = false,
    this.isBedRooms = false,
    this.isBathRooms = false,
    this.isSomethingElse = false,
  });

  WhatIsMisldeadingModel copyWith({
    bool? isPhotos,
    bool? isDescription,
    bool? isHosueRules,
    bool? isTitle,
    bool? isLocation,
    bool? isPrice,
    bool? isAmenties,
    bool? isBedRooms,
    bool? isBathRooms,
    bool? isSomethingElse,
  }) {
    return WhatIsMisldeadingModel(
      isPhotos: isPhotos ?? this.isPhotos,
      isDescription: isDescription ?? this.isDescription,
      isHosueRules: isHosueRules ?? this.isHosueRules,
      isTitle: isTitle ?? this.isTitle,
      isLocation: isLocation ?? this.isLocation,
      isPrice: isPrice ?? this.isPrice,
      isAmenties: isAmenties ?? this.isAmenties,
      isBedRooms: isBedRooms ?? this.isBedRooms,
      isBathRooms: isBathRooms ?? this.isBathRooms,
      isSomethingElse: isSomethingElse ?? this.isSomethingElse,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isPhotos': isPhotos});
    result.addAll({'isDescription': isDescription});
    result.addAll({'isHosueRules': isHosueRules});
    result.addAll({'isTitle': isTitle});
    result.addAll({'isLocation': isLocation});
    result.addAll({'isPrice': isPrice});
    result.addAll({'isAmenties': isAmenties});
    result.addAll({'isBedRooms': isBedRooms});
    result.addAll({'isBathRooms': isBathRooms});
    result.addAll({'isSomethingElse': isSomethingElse});

    return result;
  }

  factory WhatIsMisldeadingModel.fromMap(Map<String, dynamic> map) {
    return WhatIsMisldeadingModel(
      isPhotos: map['isPhotos'] ?? false,
      isDescription: map['isDescription'] ?? false,
      isHosueRules: map['isHosueRules'] ?? false,
      isTitle: map['isTitle'] ?? false,
      isLocation: map['isLocation'] ?? false,
      isPrice: map['isPrice'] ?? false,
      isAmenties: map['isAmenties'] ?? false,
      isBedRooms: map['isBedRooms'] ?? false,
      isBathRooms: map['isBathRooms'] ?? false,
      isSomethingElse: map['isSomethingElse'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory WhatIsMisldeadingModel.fromJson(String source) =>
      WhatIsMisldeadingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WhatIsMisldeadingModel(isPhotos: $isPhotos, isDescription: $isDescription, isHosueRules: $isHosueRules, isTitle: $isTitle, isLocation: $isLocation, isPrice: $isPrice, isAmenties: $isAmenties, isBedRooms: $isBedRooms, isBathRooms: $isBathRooms, isSomethingElse: $isSomethingElse)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WhatIsMisldeadingModel &&
        other.isPhotos == isPhotos &&
        other.isDescription == isDescription &&
        other.isHosueRules == isHosueRules &&
        other.isTitle == isTitle &&
        other.isLocation == isLocation &&
        other.isPrice == isPrice &&
        other.isAmenties == isAmenties &&
        other.isBedRooms == isBedRooms &&
        other.isBathRooms == isBathRooms &&
        other.isSomethingElse == isSomethingElse;
  }

  @override
  int get hashCode {
    return isPhotos.hashCode ^
        isDescription.hashCode ^
        isHosueRules.hashCode ^
        isTitle.hashCode ^
        isLocation.hashCode ^
        isPrice.hashCode ^
        isAmenties.hashCode ^
        isBedRooms.hashCode ^
        isBathRooms.hashCode ^
        isSomethingElse.hashCode;
  }
}
