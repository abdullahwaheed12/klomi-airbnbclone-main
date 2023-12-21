import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class DoOrNoSelfCheckIn extends StatelessWidget {
  const DoOrNoSelfCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "The do’s and don’ts of providing self check-in".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Guests want self check-in—here’s how to set it up and create a seamless welcome."
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              girlEnteringImagePath,
              fit: BoxFit.fill,
            ),
          ),
          const DynamicVerticalSpace(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Hosts are adapting their routines to accommodate guests’ needs as travel returns, and adding self check-in is one easy way to make your space more appealing to travelers."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "If you don’t already offer the convenience of self check-in, don’t worry: We’ll walk you through the different options and share some great tips from Hosts who have already embraced this method of virtual hosting."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Do offer a simple way for your guests to get inside'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Three popular self check-in options include lockboxes, smart locks, and keypads. Here’s what you need to know about each:"
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Lockboxes—storage devices for keys—are simple to set up. Generally an affordable solution, many lockboxes allow guests to enter a code manually to access a physical key. You can hide the lockbox or install it on a door or a wall, and change the code between stays."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Smart locks—which guests can open with a mobile app or keypad—do the work for you. Host Derek of Chattanooga, Tennessee, uses smart locks on all the properties he manages: “We’ve had great success with Schlage Connect touchscreen locks,” he says. “We automate guest code creation—the last four digits of their phone number—with Samsung SmartThings and a third-party automation software. It’s seamless for guests [and makes for] a 5-star check-in experience.”*"
                        .tr()
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "You can also sync your smart lock with your Klomi account using third-party software. “We have an electronic door lock from NUKI that’s linked to Klomi,” says Host Pascal of Brunswick, Germany. “The guest automatically receives an email with the code and an authorization during the stay time.”*"
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Keypads—when guests open the door with a code—eliminate the need for a key at all. You can share keypad codes with guests before they check in, and they can use the same code for the entirety of their stay. Some Hosts offer a keypad as a backup: Though Pascal has a smart lock, he also provides “a numeric pad for those who wish to use it.”"
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "Don’t forget to set up check-in instructions on the Klomi app"
                      .tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "It’s easy to tell your guests exactly where to find your lockbox or how to use your smart lock or keypad—simply add your instructions directly in our app."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "Do make communication with guests easier and more effective"
                      .tr(),
                  style: mediumTitle,
                ),
                Text(
                    "Many Hosts around the world already use self check-in. Here are two Host tips for connecting with guests beforehand:"
                        .tr()),
                UnorderedList([
                  "Overcommunicate with guests, so they know what to expect before arriving. Mary Ellen of Merrimack, New Hampshire, sends guests an “extensive check-in message” with the lockbox code a couple days before their reservation begins—and a bonus tip. “We warn them to write all of this down, because they may not get a great signal on the way up to the condo,” she says."
                      .tr(),
                  "Create scheduled messages and message templates with check-in info to save time. Katrina of Saskatchewan, Canada, sends all her guests the same message before their stay, letting them know she’s always available if any issues arise. She also reminds them of where they can find information about self-check-in—in the reservation page in their Klomi account."
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Do create a secure self check-in process".tr(),
                  style: mediumTitle,
                ),
                Text(
                    "Providing self check-in can simplify things for guests, but Hosts are responsible for creating a safe process. If you use a lockbox, you should update the combination between stays and be sure no one else has access to the keys during the reservation."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "If you use a smart lock or keypad, it’s important that you change the code after every reservation. Like Derek in Tennessee, some Hosts use the last four digits of guests’ phone numbers as the combination. This makes it easier for everyone to remember."
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Don’t miss out on adding self check-in to your listing".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Once you’ve picked a self check-in option, remember to add this amenity to your listing. Guests can filter search results by the amenities in a listing, so it's important to include everything you offer."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Above all, remember that self check-in can help you save time — and provide great hospitality from a safe distance."
                        .tr()),
                const DynamicVerticalSpace(12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts, {super.key});
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• "),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}
