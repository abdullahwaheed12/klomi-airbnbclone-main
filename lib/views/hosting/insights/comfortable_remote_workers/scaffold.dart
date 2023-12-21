import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class ComfortableRemoteWorkers extends StatelessWidget {
  const ComfortableRemoteWorkers({super.key});

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
              "How to make your space comfortable for remote workers".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Amenities like fast wifi and a dedicated workspace can attract guests."
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              oldMenSitingChairImagePath,
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
                    "As remote work becomes more common in many places, we’ve noticed major changes in how and why people travel. This could lead to more guests interested in spaces that help them do their jobs anywhere."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Here’s how to provide the right amenities, set up a dedicated workspace, and promote your space."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Offer fast and reliable wifi'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "An internet connection is a must for remote workers seeking fast, reliable wifi to support video calls and other tasks."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "You can verify your listing’s wifi speed without leaving the Klomi app by using the wifi speed test. This tool allows you to test the speed of your property’s wifi, then display it directly on your listing page—helping you to attract more guests who require a speedy connection."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "If certain areas of your space have a weak signal, wifi boosters and extenders can improve their performance. It might also be helpful to learn how to check your router remotely to monitor your wifi."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "Set up a dedicated workspace".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Guests are searching for dedicated workspaces as a key amenity—and creating one is easier than you might think. To add this amenity to your listing, you’ll need to offer a table or desk that’s used just for working, access to a power outlet, and a comfortable chair."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Because couples working remotely may need separate spaces, consider setting up two work areas. You can let guests know about these features by selecting Dedicated workspace in the Amenities section of your listing, and by highlighting any workspaces in your listing description, photos, and captions."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Hosts who don’t have room for a dedicated workspace can still accommodate remote workers. When a guest needs to work remotely, “I replace one of the kitchen table chairs with a cushioned wheely office armchair,” says Emilia, a Superhost in Orono, Maine. “I think the chair alone makes a big difference.”"
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "Consider other useful amenities".tr(),
                  style: mediumTitle,
                ),
                Text(
                    "Beyond a dedicated workspace, guests also value extra touches that can make remote work more pleasant and productive."
                        .tr()),
                const DynamicVerticalSpace(12),
                const Text("Here are some options to consider for your space:"),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Alternate workspaces. The living room, dining room, or patio can offer a refreshing change of scenery—and allow multiple people to work at the same time."
                      .tr(),
                  "Ergonomic support. A laptop stand, an ergonomic office chair, and an adjustable footrest can help make long workdays more comfortable."
                      .tr(),
                  "Good lighting. While windows or glass doors that provide natural light are ideal, a desk lamp can help brighten a workspace."
                      .tr(),
                  "Coffee maker and tea kettle. Many guests appreciate a caffeine fix to help them get going. You can even provide tea and coffee—and to go that extra step, lifestyle blogger Elsie, a Superhost in Nashville, Tennessee, suggests offering multiple brewing options, like a French press and an automatic coffee maker."
                      .tr(),
                  "Office supplies. Simple items like fresh pens and notepads often come in handy, while access to a printer can help set your listing apart."
                      .tr(),
                  "Tech support. A computer monitor, smart speakers, and extra phone chargers can take your workspace to the next level."
                      .tr(),
                  "Video conferencing backdrop. Interesting wallpaper, plants, or art situated in the background of a workspace can appeal to guests who are frequently on video calls."
                      .tr(),
                  "Noise reduction. Textiles like curtains, rugs, blankets, and pillows can help soften noisy distractions."
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Promote your work-friendly space".tr(),
                  style: mediumTitle,
                ),
                Text(
                    "Once you’ve made your space comfortable for remote workers, it’s important to update your listing description, amenities, and photos to let guests know you have a work-friendly place."
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Take advantage of search filters. When browsing listings, many guests apply filters to find spaces with the amenities they want, so be sure to check off Dedicated workspace and anything else you offer."
                      .tr(),
                  "Update your photos and captions. Because guests may check out your listing photos before reading the description, make sure your images include any workspaces you provide. Learn how to take great photos",
                  "Let guests imagine themselves in your space. Make sure your listing description reflects how your space accommodates guests working remotely. If you really want to stand out, you can include that info in your listing title."
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "It can also be helpful to message guests before they arrive. By reminding them if you offer things like coffee or a computer monitor, you can help them plan accordingly."
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "We hope these tips help you create a welcoming space. By keeping your guests’ needs in mind, you’ll be able to offer a comfortable—and productive—stay for remote workers."
                      .tr(),
                ),
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
