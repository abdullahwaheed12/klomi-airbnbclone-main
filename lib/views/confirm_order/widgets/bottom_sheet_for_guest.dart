import 'package:klomi/views/confirm_order/logic.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../listing_posting/screen7.dart';

class GuestIncrement extends StatefulWidget {
  const GuestIncrement({super.key});

  @override
  State<GuestIncrement> createState() => _GuestIncrementState();
}

class _GuestIncrementState extends State<GuestIncrement> {
  var count = Get.find<OrderController>().exploreModel.hostModel.guests;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.clear)),
              const SizedBox(
                width: 20,
              ),
              Text('Guests'.tr())
            ],
          ),
          const Divider(),
          Text('This place has a maximum of 5 guests'.tr()),
          const SizedBox(
            height: 20,
          ),
          SelectionWidget(
            decreament: () {
              if (Get.find<OrderController>().exploreModel.hostModel.guests ==
                  0) {
                return;
              }
              setState(() {
                count--;
              });
            },
            increament: () {
              if (Get.find<OrderController>().exploreModel.hostModel.guests <
                  count + 1) {
                return;
              }
              setState(() {
                count++;
              });
            },
            count: count,
            title: 'Guests'.tr(),
          ),
          const Spacer(),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel'.tr(),
                  style: const TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                    Get.find<OrderController>().exploreModel.hostModel.guests =
                        count;
                    Get.find<OrderController>().update();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Save'.tr()),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
