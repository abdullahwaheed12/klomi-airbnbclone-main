import 'package:klomi/contstant/colors.dart';
import 'package:klomi/utiles/kyes.dart';
import 'package:klomi/views/confirm_order/select_dates.dart';
import 'package:klomi/views/confirm_order/widgets/bottom_sheet_for_add_phone_number.dart';
import 'package:klomi/views/confirm_order/widgets/bottom_sheet_for_guest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../controllers/ad_apply_controller.dart';
import '../../contstant/text_styles.dart';
import '../../helper/main_helper.dart';
import '../../models/explore_model.dart';
import '../../models/user.dart';
import 'logic.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder(
      {super.key, required this.exploreModel, required this.hostData});
  final ExploreModel exploreModel;
  final UserModel hostData;

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  void initState() {
    super.initState();
    Get.put(OrderController(widget.exploreModel));
  }

  DateTime? selectedDateStart;
  DateTime? selectedDateEnd;

  selectDateRange() async {
    var a = await Get.to<Map>(() => SelectDates(
        selectedDates: widget.exploreModel.selectedDates,
        min: widget.exploreModel.start,
        max: widget.exploreModel.end));
    if (a == null) return;
    selectedDateStart = a[AppKeys.availibilityStartKey];
    selectedDateEnd = a[AppKeys.availibilityEndKey];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var days =
        widget.exploreModel.end.difference(widget.exploreModel.start).inDays;
    var serviceFee = 40.0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<OrderController>(builder: (controller) {
            return SingleChildScrollView(
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
                        Text(
                          'Confirm And Pay'.tr(),
                          style: mediumTitle,
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          SizedBox(
                              height: 100,
                              width: 150,
                              child: Image.network(
                                widget.exploreModel.images[0],
                                fit: BoxFit.fill,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.exploreModel.bestDescribeYourPlaceEnum
                                      .name.capitalizeFirst!,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Text(widget.exploreModel.title),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Spacer(),
                                // Row(
                                //   children: const [
                                //     Icon(
                                //       Icons.star,
                                //       size: 15,
                                //       color: Colors.black,
                                //     ),
                                //     Text('4.83 (48)')
                                //   ],
                                // )
                              ],
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text.rich(TextSpan(
                      text: 'Your booking is protected by '.tr(),
                      children: [
                        const TextSpan(
                            text: 'klomi',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'cover'.tr(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ])),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 5,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Your trip'.tr(),
                      style: mediumTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dates'.tr(),
                          style: smallTitle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${DateFormat('MMMM').format(DateTime(0, widget.exploreModel.start.month))} ${widget.exploreModel.start.day} - ${widget.exploreModel.end.day}',
                          style: const TextStyle(
                            fontFamily: 'ManropeRegular',
                            color: Colors.black87,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () => selectDateRange(),
                      child: Text(
                        'Edit'.tr(),
                        style: smallTitle.copyWith(
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guests'.tr(),
                          style: smallTitle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            '${widget.exploreModel.hostModel.guests}${"guest".tr()}'),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {
                        _showBottomSheet(false);
                      },
                      child: Text(
                        'Edit'.tr(),
                        style: smallTitle.copyWith(
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 5,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Price detail'.tr(),
                      style: mediumTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                            '\$${widget.exploreModel.price}x$days${"nights".tr()}'),
                        const Spacer(),
                        Text(
                            '\$${int.parse(widget.exploreModel.price) * days}'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text('Service fee'.tr()),
                        const Spacer(),
                        Text('\$$serviceFee'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text.rich(TextSpan(
                            text: 'Total'.tr(),
                            style: smallTitle,
                            children: [
                              TextSpan(
                                text: '(USD)'.tr(),
                                style: smallTitle.copyWith(
                                    decoration: TextDecoration.underline),
                              )
                            ])),
                        const Spacer(),
                        Text(
                          '\$${int.parse(widget.exploreModel.price) * days + serviceFee}',
                          style: smallTitle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 5,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Required for your trip'.tr(),
                      style: mediumTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Message the Host'.tr(),
                          style: smallTitle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            "Let the Host know why you're traveling and when you'll check in."
                                .tr()),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {
                        sendMessage(widget.exploreModel,
                            widget.exploreModel.adId, context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          'Add'.tr(),
                          style: smallTitle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String data = snapshot.data!.get('phoneNumber');
                          if (data.isEmpty) {
                            return ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Phone number'.tr(),
                                    style: smallTitle,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "Add and confirm your phone number to get trip updates."
                                          .tr()),
                                ],
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  _showBottomSheet(true);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Text(
                                    'Add'.tr(),
                                    style: smallTitle,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        }
                        return const SizedBox();
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 5,
                    color: Colors.grey,
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child: Text(
                  //     'Cancellation policy'.tr(),
                  //     style: mediumTitle,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child: Text(
                  //     'This reservation is non-refundable.'.tr(),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // const Divider(
                  //   thickness: 5,
                  //   color: Colors.grey,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (widget.hostData.hostSettings.preBookMessage.isNotEmpty)
                    const Text('Pre Book Message:'),
                  if (widget.hostData.hostSettings.preBookMessage.isNotEmpty)
                    TextField(
                      enabled: false,
                      controller: TextEditingController(
                          text: widget.hostData.hostSettings.preBookMessage),
                      maxLines: 5,
                      maxLength: 400,
                    ),
                  if (!widget.hostData.hostSettings.isInstantBook)
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "Your reservation won't be confirmed until the Host accepts your request (within 24 hours). You won't be charged until then."
                                .tr(),
                            style: smallTitle,
                          ),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width, 50)),
                      onPressed: () {
                        if (selectedDateStart != null &&
                            selectedDateEnd != null) {
                          widget.exploreModel.start = selectedDateStart!;
                          widget.exploreModel.end = selectedDateEnd!;
                        }
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Alert!'.tr()),
                            content: Text('Do you want to book?'.tr()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.find<AdApplyController>().apply(
                                      widget.exploreModel,
                                      serviceFee,
                                      days,
                                      widget.hostData);
                                },
                                child: Text('Yes'.tr()),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('No'.tr()),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text('Request to book'.tr()))
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  double cornerRadius = 35;

  _showBottomSheet(bool isForAddPhoneNumber) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cornerRadius),
              topRight: Radius.circular(cornerRadius))),
      builder: (context) {
        if (isForAddPhoneNumber) {
          return const AddPhoneNumber();
        }
        return const GuestIncrement();
      },
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
