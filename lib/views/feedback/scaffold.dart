import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/text_styles.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    var textEditingController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back)),
              const Divider(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Share your \nfeedback'.tr(),
                        style: largeTitle,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                          "Thanks for sending us your ideas, issues, or appreciations. We can't respond individually, but we'll pass it on to the teams who are working to help make Klomi better for everyone."
                              .tr()),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                          "If you do have a specific question, or need help resolving a problem, you can visit our Help Center or contact us to connect with our support team."
                              .tr()),
                      const SizedBox(
                        height: 30,
                      ),
                      Text("What's your feedback about?".tr()),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Add details'.tr()),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        controller: textEditingController,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        maxLines: 5,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Spacer(),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          if (textEditingController.text.isEmpty) {
                            Get.snackbar(
                                'Alert!'.tr(), 'Please enter some detail'.tr());

                            return;
                          } else {
                            Navigator.pop(context);

                            Get.snackbar('Alert!'.tr(),
                                'Your feedback has been posted'.tr());
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Submit'.tr(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
