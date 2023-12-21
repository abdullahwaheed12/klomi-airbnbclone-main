import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyTripsTraveller extends StatelessWidget {
  const EmptyTripsTraveller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),

              const Divider(),
              Text(
                "No trips booked...yet!".tr(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Time to dust off your bags and start planning your next adventure"
                    .tr(),
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () {
              //     print('login000000');
              //     Get.to(() => const AllViews(
              //           selectedIndex: 0,
              //         ));
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.symmetric(
              //         horizontal: 20, vertical: 16),
              //     decoration: BoxDecoration(
              //         border: Border.all(),
              //         borderRadius: BorderRadius.circular(6)),
              //     child: const Text(
              //       'Start searching',
              //       style:
              //           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(
                  text: "Can't find your reservatin here?  ".tr(),
                  children: [
                    TextSpan(
                        text: 'Visit the Help Center'.tr(),
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold))
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
