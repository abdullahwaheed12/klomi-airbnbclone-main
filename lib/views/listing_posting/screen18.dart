import 'package:klomi/views/listing_posting/screen19.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../contstant/text_styles.dart';

class JustLastOne extends StatefulWidget {
  const JustLastOne({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;

  @override
  State<JustLastOne> createState() => _JustLastOneState();
}

class _JustLastOneState extends State<JustLastOne> {
  var isSecurityCamera = false;
  var isWeapons = false;
  var isDangeroursAnimals = false;

  @override
  Widget build(BuildContext context) {
    debugPrint('data is ${widget.allPreviousArgu}');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Just one last step!".tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Does your place have any of these?'.tr()),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.info_outline)
                ],
              ),
              CheckboxListTile(
                value: isSecurityCamera,
                onChanged: (value) {
                  setState(() {
                    isSecurityCamera = value ?? false;
                  });
                },
                title: Text('Security camera(s)'.tr()),
              ),
              CheckboxListTile(
                value: isWeapons,
                onChanged: (value) {
                  setState(() {
                    isWeapons = value ?? false;
                  });
                },
                title: Text('Weapons'.tr()),
              ),
              CheckboxListTile(
                value: isDangeroursAnimals,
                onChanged: (value) {
                  setState(() {
                    isDangeroursAnimals = value ?? false;
                  });
                },
                title: Text('Dangerous animals'.tr()),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Important things to know'.tr(),
                style: smallTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  "Be sure to comply with your local laws and review Klomi nondiscrimination policy and guest and Host fees."
                      .tr()),
              const Spacer(),
              Row(
                children: [
                  Text(
                    'Back'.tr(),
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () async {
                        var allPreviousArgu = <String, dynamic>{
                          'uid': FirebaseAuth.instance.currentUser!.uid,
                          ...widget.allPreviousArgu
                        };
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ReviewYourListing(
                              allPreviousArgu: allPreviousArgu),
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Next'.tr()),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
