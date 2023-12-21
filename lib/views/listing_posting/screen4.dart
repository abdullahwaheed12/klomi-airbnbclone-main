import 'package:klomi/utiles/kyes.dart';
import 'package:klomi/views/listing_posting/screen6.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../contstant/text_styles.dart';
import 'widgets/next_back.dart';

class TypesOfPlace extends StatefulWidget {
  const TypesOfPlace({super.key, required this.allPreviousArgument});
  final Map allPreviousArgument;
  @override
  State<TypesOfPlace> createState() => _TypesOfPlaceState();
}

class _TypesOfPlaceState extends State<TypesOfPlace> {
  var isEntireRoom = true;
  var isPrivateRoom = false;
  var isSharedRoom = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                'What type of place will guests have?'.tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              //1
              InkWell(
                onTap: () {
                  setState(() {
                    isEntireRoom = true;
                    isPrivateRoom = false;
                    isSharedRoom = false;
                  });
                },
                child: TypesOfPlaceCard(
                  isSelected: isEntireRoom,
                  title: 'An entire place'.tr(),
                  subTitle: 'Guests have the whole place to themeselves.'.tr(),
                  icon: Icons.home_outlined,
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              //2
              InkWell(
                onTap: () {
                  setState(() {
                    isEntireRoom = false;
                    isPrivateRoom = true;
                    isSharedRoom = false;
                  });
                },
                child: TypesOfPlaceCard(
                  isSelected: isPrivateRoom,
                  title: 'A private room'.tr(),
                  subTitle:
                      'Guests sleep in a room or commonn area that may be shared with you or others.'
                          .tr(),
                  icon: Icons.door_front_door_outlined,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //3
              InkWell(
                onTap: () {
                  setState(() {
                    isEntireRoom = false;
                    isPrivateRoom = false;
                    isSharedRoom = true;
                  });
                },
                child: TypesOfPlaceCard(
                  isSelected: isSharedRoom,
                  title: 'An shared room'.tr(),
                  subTitle:
                      'Guests sleep in a room or commonn area that may be shared with you or others.',
                  icon: Icons.group,
                ),
              ),

              const Spacer(),
              NextBack(
                onPressed: () {
                  final String placeType;
                  if (isEntireRoom) {
                    placeType = 'entireRoom'.tr();
                  } else if (isPrivateRoom) {
                    placeType = 'privateRoom'.tr();
                  } else {
                    placeType = 'sharedRoom'.tr();
                  }

                  Get.to(() => AddYourLocation(
                        allPreviousArgument: {
                          ...widget.allPreviousArgument,
                          AppKeys.placeTypeKey: placeType
                        },
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypesOfPlaceCard extends StatelessWidget {
  const TypesOfPlaceCard(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isSelected,
      required this.icon});
  final String title;
  final String subTitle;
  final IconData icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 105,
      decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.black : Colors.grey,
              width: isSelected ? 2 : 1),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: smallTitle,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(subTitle),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
              flex: 1,
              child: Icon(
                icon,
                size: 40,
              ))
        ],
      ),
    );
  }
}
