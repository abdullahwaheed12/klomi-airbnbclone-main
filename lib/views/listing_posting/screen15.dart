import 'package:klomi/utiles/kyes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../contstant/text_styles.dart';
import 'screen16.dart';

class ChooseFirstReservation extends StatefulWidget {
  const ChooseFirstReservation({super.key, required this.allPreviousArgu});
  final Map allPreviousArgu;

  @override
  State<ChooseFirstReservation> createState() => _ChooseFirstReservationState();
}

class _ChooseFirstReservationState extends State<ChooseFirstReservation> {
  var isExperienced = true;
  var isAny = false;

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
                height: 50,
              ),
              Text(
                "Choose who to welcome for your first reservation".tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "After your first guest, anyone can book your place. "
                        .tr()),
                // TextSpan(
                //     text: 'Learn more'.tr(),
                //     style: const TextStyle(
                //         fontWeight: FontWeight.bold,
                //         decoration: TextDecoration.underline)),
              ])),
              const SizedBox(
                height: 20,
              ),
              //1
              CardPlace(
                onTap: () {
                  setState(() {
                    isExperienced = false;
                    isAny = true;
                  });
                },
                isSelected: isAny,
                title: 'Any klomi guest'.tr(),
                subTitle:
                    'Get reservations faster when you welcome any from the Klomi community.'
                        .tr(),
                icon: Icons.circle_outlined,
              ),
              const SizedBox(
                height: 10,
              ),
              //2
              CardPlace(
                onTap: () {
                  setState(() {
                    isExperienced = true;
                    isAny = false;
                  });
                },
                isSelected: isExperienced,
                title: 'An experienced guest'.tr(),
                subTitle:
                    'For your first guest, welcome someone with a good track record on klomi who can offer tips for how to be a great Host.'
                        .tr(),
                icon: Icons.circle_outlined,
              ),
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
                      onPressed: () {
                        var allPreviousArgu = {
                          AppKeys.isAnyklomiGuestKey: isAny,
                          AppKeys.isExperienceGuestKey: isExperienced,
                          ...widget.allPreviousArgu
                        };
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SetPrice(allPreviousArgu: allPreviousArgu),
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

class CardPlace extends StatelessWidget {
  const CardPlace(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isSelected,
      required this.onTap,
      required this.icon});
  final String title;
  final String subTitle;
  final IconData icon;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
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
                    height: 5,
                  ),
                  Text(subTitle),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
                flex: 1,
                child: isSelected
                    ? Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.black),
                      )
                    : Icon(
                        icon,
                        size: 30,
                      ))
          ],
        ),
      ),
    );
  }
}
