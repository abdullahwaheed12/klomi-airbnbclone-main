import 'package:klomi/contstant/colors.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/views/allViews/all_views.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class Congratulations extends StatelessWidget {
  const Congratulations({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: size.height * 0.7, child: Image.asset(houseImagePath)),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.black),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Congratulations!'.tr(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'From one Host to another-welcome aboard. Thank you for sharing your home and helping to create incredible experiences for our guests.'
                        .tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '-Klomi',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width, 50),
                          backgroundColor: primaryColor),
                      onPressed: () {
                        Get.off(() => const AllViews());
                      },
                      child: Text("Let's get started".tr()))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
