import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back)),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Notifications'.tr(),
              style: mediumTitle,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 35,
              width: 300,
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0),
                  width: 0.7,
                ),
              )),
              child: TabBar(
                labelPadding: const EdgeInsets.only(right: 4, left: 0),
                labelStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: Colors.black),

                    // borderSide: BorderSide(width: 2.0, color: KThemeColor),
                    insets: EdgeInsets.all(-1)),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Offers and updates'.tr(),
                  ),
                  Tab(
                    text: 'Account'.tr(),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              height: 0,
              color: Colors.grey.withOpacity(0.5),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // first tab bar view widget
                  OffersAndUpdates(),

                  // second tab bar view widget
                  Account(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class OffersAndUpdates extends StatelessWidget {
  const OffersAndUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Hosting insights and rewards'.tr(),
              style: mediumTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Learn about best hosting practices, and get access to exclusive hosting perks.'
                    .tr()),
            const SizedBox(
              height: 30,
            ),
            //1
            ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recognition and achievements'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //2
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Insights and tips'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //3
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pricing trends and suggestions'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit',
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //4
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hosting perks'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Hosting updates'.tr(),
              style: mediumTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Get updates about programs, features, and \nregulations.'
                .tr()),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('News and updates'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Local laws and regulations'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Travel tips and offers'.tr(),
              style: mediumTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Inspire your next trip with personalized recommendations and special offers.'
                    .tr()),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Inspiration and offers'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trip planning'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Klomi updates'.tr(),
              style: mediumTitle,
            ),

            const SizedBox(
              height: 10,
            ),
            Text(
                'Stay up to date on the latest news from Klomi, and let us know how we can improve.'
                    .tr()),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('News and programs'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Feedback'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Travel regulations'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Unsubscribe from all offers and updates'.tr(),
              style: mediumTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                "You'll continue to get notifications about your account activity."
                    .tr()),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('All offers and updates'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Account activity and policies'.tr(),
              style: mediumTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Confirm your booking and account activity, and learn about important Klomi policies.'
                    .tr()),
            const SizedBox(
              height: 30,
            ),
            //1
            ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account activity'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //2
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Listing activity'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //3
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Guest policies'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //4
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Host policies'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Reminders'.tr(),
              style: mediumTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Get important reminders about your reservations, listings, and account activity.'
                    .tr()),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Reminders'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Guest and Host messages'.tr(),
              style: mediumTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Keep in touch with your Host or guests before and during your trip.'
                    .tr()),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Messages'.tr()),
                  Text('On: Email and Push'.tr()),
                ],
              ),
              trailing: Text(
                'Edit'.tr(),
                style:
                    smallTitle.copyWith(decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
