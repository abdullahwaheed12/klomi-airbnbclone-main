import 'package:klomi/controllers/adpost_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class TypeOfPlace extends StatelessWidget {
  const TypeOfPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Types of place".tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Entire place".tr()),
            subtitle: Text("A place all to yourself".tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: controller.isEntirePlace,
              onChanged: (bool? value) {
                controller.isEntirePlace = value!;
                controller.update();
              },
            ),
          ),
          ListTile(
            title: Text("Private room".tr()),
            subtitle: Text(
                "Your own room in a home or a hotel, plus some shared common spaces"
                    .tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: controller.isPrivateRoom,
              onChanged: (bool? value) {
                controller.isPrivateRoom = value!;
                controller.update();
              },
            ),
          ),
          ListTile(
            title: Text("shared room".tr()),
            subtitle: Text(
                "A sleeping space and common areas that may be shared with others"
                    .tr()),
            trailing: Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              fillColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              value: controller.isSharedRoom,
              onChanged: (bool? value) {
                controller.isSharedRoom = value!;
                controller.update();
              },
            ),
          ),
        ],
      );
    });
  }
}
