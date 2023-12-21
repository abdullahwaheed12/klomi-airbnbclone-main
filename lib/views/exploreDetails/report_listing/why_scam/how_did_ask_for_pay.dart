import 'dart:convert';

import 'package:klomi/views/exploreDetails/report_listing/we_got_your_report.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/dvider.dart';

import '../../../../utiles/math_utils.dart';

class HowDidTheyAskYouToPay extends StatefulWidget {
  const HowDidTheyAskYouToPay({super.key});

  @override
  State<HowDidTheyAskYouToPay> createState() => _HowDidTheyAskYouToPayState();
}

class _HowDidTheyAskYouToPayState extends State<HowDidTheyAskYouToPay> {
  HowDidTheyAskYouToPayModel howDidTheyAskYouToPayModel =
      HowDidTheyAskYouToPayModel();
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
              "How did they ask you to pay?".tr(),
              style: largeTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                HowDidTheyAskYouToPayContainer(
                  title: 'Bank or wire transfer'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isBankOrWire,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isBankOrWire =
                          !howDidTheyAskYouToPayModel.isBankOrWire;
                    });
                  },
                ),
                HowDidTheyAskYouToPayContainer(
                  title: 'Credit or debit card'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isCreditOrDebit,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isCreditOrDebit =
                          !howDidTheyAskYouToPayModel.isCreditOrDebit;
                    });
                  },
                ),
                HowDidTheyAskYouToPayContainer(
                  title: 'Cash'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isCash,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isCash =
                          !howDidTheyAskYouToPayModel.isCash;
                    });
                  },
                ),
                HowDidTheyAskYouToPayContainer(
                  title: 'PayPal'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isPayPal,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isPayPal =
                          !howDidTheyAskYouToPayModel.isPayPal;
                    });
                  },
                ),
                HowDidTheyAskYouToPayContainer(
                  title: 'MoneyGram'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isMoneyGram,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isMoneyGram =
                          !howDidTheyAskYouToPayModel.isMoneyGram;
                    });
                  },
                ),
                HowDidTheyAskYouToPayContainer(
                  title: 'Western Union'.tr(),
                  isSelected: howDidTheyAskYouToPayModel.isWesternUnion,
                  onTap: () {
                    setState(() {
                      howDidTheyAskYouToPayModel.isWesternUnion =
                          !howDidTheyAskYouToPayModel.isWesternUnion;
                    });
                  },
                ),
                HowDidTheyAskYouToPayContainer(
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
    if (howDidTheyAskYouToPayModel.isBankOrWire ||
        howDidTheyAskYouToPayModel.isCash ||
        howDidTheyAskYouToPayModel.isCreditOrDebit ||
        howDidTheyAskYouToPayModel.isMoneyGram ||
        howDidTheyAskYouToPayModel.isPayPal ||
        howDidTheyAskYouToPayModel.isSomethingElse ||
        howDidTheyAskYouToPayModel.isWesternUnion) {
      return true;
    } else {
      return false;
    }
  }
}

class HowDidTheyAskYouToPayContainer extends StatelessWidget {
  const HowDidTheyAskYouToPayContainer({
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

class HowDidTheyAskYouToPayModel {
  bool isBankOrWire;
  bool isCreditOrDebit;
  bool isCash;
  bool isPayPal;
  bool isMoneyGram;
  bool isWesternUnion;
  bool isSomethingElse;
  HowDidTheyAskYouToPayModel({
    this.isBankOrWire = false,
    this.isCreditOrDebit = false,
    this.isCash = false,
    this.isPayPal = false,
    this.isMoneyGram = false,
    this.isWesternUnion = false,
    this.isSomethingElse = false,
  });

  HowDidTheyAskYouToPayModel copyWith({
    bool? isBankOrWire,
    bool? isCreditOrDebit,
    bool? isCash,
    bool? isPayPal,
    bool? isMoneyGram,
    bool? isWesternUnion,
    bool? isSomethingElse,
  }) {
    return HowDidTheyAskYouToPayModel(
      isBankOrWire: isBankOrWire ?? this.isBankOrWire,
      isCreditOrDebit: isCreditOrDebit ?? this.isCreditOrDebit,
      isCash: isCash ?? this.isCash,
      isPayPal: isPayPal ?? this.isPayPal,
      isMoneyGram: isMoneyGram ?? this.isMoneyGram,
      isWesternUnion: isWesternUnion ?? this.isWesternUnion,
      isSomethingElse: isSomethingElse ?? this.isSomethingElse,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'isBankOrWire': isBankOrWire});
    result.addAll({'isCreditOrDebit': isCreditOrDebit});
    result.addAll({'isCash': isCash});
    result.addAll({'isPayPal': isPayPal});
    result.addAll({'isMoneyGram': isMoneyGram});
    result.addAll({'isWesternUnion': isWesternUnion});
    result.addAll({'isSomethingElse': isSomethingElse});

    return result;
  }

  factory HowDidTheyAskYouToPayModel.fromMap(Map<String, dynamic> map) {
    return HowDidTheyAskYouToPayModel(
      isBankOrWire: map['isBankOrWire'] ?? false,
      isCreditOrDebit: map['isCreditOrDebit'] ?? false,
      isCash: map['isCash'] ?? false,
      isPayPal: map['isPayPal'] ?? false,
      isMoneyGram: map['isMoneyGram'] ?? false,
      isWesternUnion: map['isWesternUnion'] ?? false,
      isSomethingElse: map['isSomethingElse'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory HowDidTheyAskYouToPayModel.fromJson(String source) =>
      HowDidTheyAskYouToPayModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HowDidTheyAskYouToPayModel(isBankOrWire: $isBankOrWire, isCreditOrDebit: $isCreditOrDebit, isCash: $isCash, isPayPal: $isPayPal, isMoneyGram: $isMoneyGram, isWesternUnion: $isWesternUnion, isSomethingElse: $isSomethingElse)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HowDidTheyAskYouToPayModel &&
        other.isBankOrWire == isBankOrWire &&
        other.isCreditOrDebit == isCreditOrDebit &&
        other.isCash == isCash &&
        other.isPayPal == isPayPal &&
        other.isMoneyGram == isMoneyGram &&
        other.isWesternUnion == isWesternUnion &&
        other.isSomethingElse == isSomethingElse;
  }

  @override
  int get hashCode {
    return isBankOrWire.hashCode ^
        isCreditOrDebit.hashCode ^
        isCash.hashCode ^
        isPayPal.hashCode ^
        isMoneyGram.hashCode ^
        isWesternUnion.hashCode ^
        isSomethingElse.hashCode;
  }
}
