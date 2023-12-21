import 'package:flutter/cupertino.dart';
import 'package:klomi/controllers/adpost_controller.dart';
import 'package:klomi/contstant/colors.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/enums/best_describe_your_place_enum.dart';
import 'package:klomi/views/explore/mapsview.dart';
import 'package:klomi/views/explore/widgets/explore_item.dart';
import 'package:klomi/views/explore/widgets/filters/filters.dart';
import 'package:klomi/views/explore/widgets/tabs.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rive/rive.dart';

import '../../contstant/image_path.dart';
import '../../models/explore_model.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 22, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                searchField(),
                ExploreTabs(
                  tabController: _tabController!,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      typeOfExploreItem(BestDescribeYourPlaceEnum.house),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.apartment),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.barn),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.breakfast),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.boat),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.cabin),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.camper),
                      typeOfExploreItem(
                          BestDescribeYourPlaceEnum.casaParticular),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.castle),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.cave),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.container),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.cycladicHome),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.dome),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.farm),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.guesthouse),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.hotel),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.tent),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.tinyHome),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.tower),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.treeHouse),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.windmill),
                      typeOfExploreItem(BestDescribeYourPlaceEnum.yurt),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const MapsView();
                    },
                    fullscreenDialog: true));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(20),
                    color: secondaryColor),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.map,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'map'.tr(),
                      style: const TextStyle(
                          fontFamily: 'ManropeBold',
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Container(
      height: 55,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: decoration(),
      alignment: Alignment.center,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.search_sharp,
              size: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'where to?'.tr(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                'anywhere, Any time, Add guests'.tr(),
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 12,
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => const Filters());
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1,
                      color: Get.find<AdController>().isFilter
                          ? Colors.black
                          : Colors.grey)),
              child: const Icon(
                Icons.menu,
                size: 15,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget labelText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'where to?'.tr(),
          style: const TextStyle(
            fontFamily: 'ManropeRegular',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Text(
          'anywhere, Any time, Add guests'.tr(),
          style: const TextStyle(
            fontFamily: 'ManropeRegular',
            color: Colors.black45,
            fontSize: 12,
          ),
        )
      ],
    );
  }

  Decoration? decoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: secondaryColor),
      borderRadius: BorderRadius.circular(40),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300]!,
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    );
  }

  Widget typeOfExploreItem(
      BestDescribeYourPlaceEnum bestDescribeYourPlaceEnum) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: GetBuilder<AdController>(
        builder: (controller) {
          if (controller.adpostModel == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ExploreModel>? adpostModel = [];

          for (var element in controller.adpostModel!) {
            if (element.bestDescribeYourPlaceEnum ==
                bestDescribeYourPlaceEnum) {
              adpostModel.add(element);
            }
          }
          if (adpostModel.isEmpty) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: RiveAnimation.asset(notfoundAnimation)),
                  // Image.asset(imageNotFound),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'No ad at the moment'.tr(),
                    style: largeTitle,
                  )
                ],
              ),
            );
          }
          RefreshController refreshController =
              RefreshController(initialRefresh: false);

          void onRefresh() async {
            // monitor network fetch
            await Future.delayed(const Duration(milliseconds: 1000));
            // if failed,use refreshFailed()
            refreshController.refreshCompleted();
          }

          void onLoading() async {
            // monitor network fetch
            // await Future.delayed(const Duration(milliseconds: 1000));
            // if failed,use loadFailed(),if no data return,use LoadNodata()
            Get.find<AdController>().fetchAds();
            if (mounted) {
              setState(() {});
            }
            refreshController.loadComplete();
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = const Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = const CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = const Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = const Text("release to load more");
                } else {
                  body = const Text("No more Data");
                }
                return SizedBox(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: refreshController,
            onRefresh: onRefresh,
            onLoading: onLoading,
            child: ListView.builder(
              itemCount: adpostModel.length,
              itemBuilder: (context, index) {
                return ExploreItem(exploreModel: adpostModel[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
