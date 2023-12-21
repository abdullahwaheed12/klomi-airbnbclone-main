import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/views/hosting/insights/tabs.dart';
import 'package:klomi/views/hosting/insights/widgets/opportunities.dart';
import 'package:klomi/views/hosting/insights/widgets/stats.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Insights extends StatefulWidget {
  const Insights({super.key});

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Insights'.tr(),
              style: largeTitle,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InsightsTabs(tabController: _tabController),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: const [
              Opportunities(),
              Stats(),
            ],
          ))
        ]),
      ),
    );
  }
}
