import 'package:klomi/utiles/kyes.dart';
import 'package:klomi/views/listing_posting/widgets/next_back.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../contstant/text_styles.dart';
import 'screen17.dart';

class SetPrice extends StatefulWidget {
  const SetPrice({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;

  @override
  State<SetPrice> createState() => _SetPriceState();
}

class _SetPriceState extends State<SetPrice> {
  int count = 25;
  bool isBookedFaster = true;
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
                height: 15,
              ),
              Text(
                'Now, set your price'.tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 5,
              ),
              Text('You can change it anytime.'.tr()),
              const SizedBox(
                height: 20,
              ),
              //1
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //minus
                          InkWell(
                            onTap: () {
                              if (count == 0) {
                                return;
                              }
                              setState(() {
                                count--;
                              });
                            },
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
                          //count
                          Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12)),
                              alignment: Alignment.center,
                              child: Text(
                                "US \$${count.toString()}",
                                style: mediumTitle,
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          //plus
                          InkWell(
                            onTap: () {
                              setState(() {
                                count++;
                              });
                            },
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
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('per night'.tr()),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Places like yours in your area \nusually range from 32 to 54 Dollars'
                              .tr()),
                      const Icon(Icons.info_outlined),
                    ],
                  )),
              // const SizedBox(
              //   height: 15,
              // ),
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              //   decoration: BoxDecoration(
              //       color: const Color(0xffF7F7F7),
              //       border: Border.all(color: Colors.grey),
              //       borderRadius: BorderRadius.circular(12)),
              //   alignment: Alignment.center,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Row(
              //         children: [
              //           Text('Get booked faster'.tr()),
              //           const Spacer(),
              //           Checkbox(
              //             value: isBookedFaster,
              //             onChanged: (value) {
              //               setState(() {
              //                 isBookedFaster = !isBookedFaster;
              //               });
              //             },
              //           )
              //         ],
              //       ),
              //       Text(
              //           'Offer 20% off to your first 3 guests to help your place stand out.'
              //               .tr()),
              //       const SizedBox(
              //         height: 20,
              //       ),
              //       Text(
              //         'Learn more'.tr(),
              //         style: const TextStyle(
              //             decoration: TextDecoration.underline,
              //             fontWeight: FontWeight.w600),
              //       )
              //     ],
              //   ),
              // ),

              const Spacer(),
              NextBack(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddAvailability(allPreviousArgu: {
                      AppKeys.fareKey: count,
                      ...widget.allPreviousArgu
                    }),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
