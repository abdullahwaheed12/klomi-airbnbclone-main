import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../../../controllers/adpost_controller.dart';

class RoomsAndBeds extends StatelessWidget {
  const RoomsAndBeds({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Rooms and beds".tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Bedrooms'.tr()),
              )),
          const SizedBox(
            height: 20,
          ),
          //bedroom count
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 10,
            child: ListView.builder(
              itemCount: 15,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      controller.bedroomCount = null;
                      controller.update();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: controller.bedroomCount == null
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: controller.bedroomCount != null
                              ? Colors.black
                              : Colors.white,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Any'.tr(),
                        style: TextStyle(
                          color: controller.bedroomCount != null
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      controller.bedroomCount = index;
                      controller.update();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.all(3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.bedroomCount == index
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: controller.bedroomCount != index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          color: controller.bedroomCount != index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Beds'.tr()),
              )),
          const SizedBox(
            height: 20,
          ),
          //Bedsrooms count
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 10,
            child: ListView.builder(
              itemCount: 15,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      controller.bedsCount = null;
                      controller.update();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: controller.bedsCount == null
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: controller.bedsCount != null
                              ? Colors.black
                              : Colors.white,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Any'.tr(),
                        style: TextStyle(
                          color: controller.bedsCount != null
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      controller.bedsCount = index;
                      controller.update();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.all(3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.bedsCount == index
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: controller.bedsCount != index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          color: controller.bedsCount != index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Bathrooms'.tr()),
              )),
          const SizedBox(
            height: 20,
          ),
          //bathrooms count
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width - 10,
            child: ListView.builder(
              itemCount: 15,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () {
                      controller.bathRoomsCount = null;
                      controller.update();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: controller.bathRoomsCount == null
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: controller.bathRoomsCount != null
                              ? Colors.black
                              : Colors.white,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Any'.tr(),
                        style: TextStyle(
                          color: controller.bathRoomsCount != null
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                } else {
                  return InkWell(
                    onTap: () {
                      controller.bathRoomsCount = index;
                      controller.update();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.all(3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.bathRoomsCount == index
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: controller.bathRoomsCount != index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          color: controller.bathRoomsCount != index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      );
    });
  }
}
