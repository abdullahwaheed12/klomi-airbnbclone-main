import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/colors.dart';

import '../../../contstant/image_path.dart';

class ExploreTabs extends StatelessWidget {
  const ExploreTabs({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 60,
          child: TabBar(
            padding: EdgeInsets.zero,
            isScrollable: true,
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
            unselectedLabelStyle: const TextStyle(
              color: Colors.black,
            ),
            indicatorWeight: 2,
            unselectedLabelColor: Colors.black45,
            indicatorColor: secondaryColor,
            controller: tabController,
            tabs: <Widget>[
              TextTabs(
                iconImageUrl: countryHouseImagePath,
                text: 'House'.tr(),
              ),
              TextTabs(
                iconImageUrl: apartmentsImagePath,
                text: 'Apartment'.tr(),
              ),
              TextTabs(
                iconImageUrl: barnImagePath,
                text: 'Barn'.tr(),
              ),
              TextTabs(
                  iconImageUrl: breakfastImagePath,
                  text: 'Bed & breakfast'.tr()),
              TextTabs(
                iconImageUrl: boatImagePath,
                text: 'Boat'.tr(),
              ),
              TextTabs(
                iconImageUrl: cabinImagePath,
                text: 'Cabin'.tr(),
              ),
              TextTabs(
                iconImageUrl: camperImagePath,
                text: 'Camper/RV'.tr(),
              ),
              TextTabs(
                iconImageUrl: casaParticularImagePath,
                text: 'Casa particular'.tr(),
              ),
              TextTabs(
                iconImageUrl: castleImagePath,
                text: 'Castle'.tr(),
              ),
              TextTabs(
                iconImageUrl: caveImagePath,
                text: 'Cave'.tr(),
              ),
              TextTabs(
                iconImageUrl: containerImagePath,
                text: 'Container'.tr(),
              ),
              TextTabs(
                iconImageUrl: cycladicHomeImagePath,
                text: 'Cycladic home'.tr(),
              ),
              TextTabs(
                iconImageUrl: domeImagePath,
                text: 'Dome'.tr(),
              ),
              TextTabs(
                iconImageUrl: farmImagePath,
                text: 'Farm'.tr(),
              ),
              TextTabs(
                iconImageUrl: guesthosueImagePath,
                text: 'Guesthouse'.tr(),
              ),
              TextTabs(
                iconImageUrl: hotelImagePath,
                text: 'Hotel'.tr(),
              ),
              TextTabs(
                iconImageUrl: tentImagePath,
                text: 'Tent'.tr(),
              ),
              TextTabs(
                iconImageUrl: tinyhomeImagePath,
                text: 'Tiny home'.tr(),
              ),
              TextTabs(
                iconImageUrl: towerImagePath,
                text: 'Tower'.tr(),
              ),
              TextTabs(
                iconImageUrl: treehosueImagePath,
                text: 'Treehouse'.tr(),
              ),
              TextTabs(
                iconImageUrl: mindmillImagePath,
                text: 'Windmill'.tr(),
              ),
              TextTabs(
                iconImageUrl: yurtImagePath,
                text: 'Yurt'.tr(),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1.5,
          thickness: 1.5,
          color: Colors.black12,
        )
      ],
    );
  }
}

class TextTabs extends StatelessWidget {
  const TextTabs({super.key, required this.iconImageUrl, required this.text});
  final String text;
  final String iconImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: <Color>[
              Color.fromARGB(255, 106, 47, 4),
              Color.fromARGB(255, 202, 106, 37),
              Color.fromARGB(255, 237, 135, 61),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: Colors.transparent)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 25,
              width: 25,
              child: Image.asset(
                iconImageUrl,
                color: Colors.white,
              )),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
                fontFamily: 'ManropeMedium', fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
