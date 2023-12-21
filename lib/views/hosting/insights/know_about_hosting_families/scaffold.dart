import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class KnowAboutHostingAndFamilies extends StatelessWidget {
  const KnowAboutHostingAndFamilies({super.key});

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
              "What you need to know about hosting families".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Thoughtfully prepare your space and update your listing to widen your audience."
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              mohterDoughterImagePath,
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
                    "With many offices, schools, and daycare centers closed around the world, parents now have more flexibility with where they live and work. Many are interested in traveling more often—even temporarily relocating their families—to places with more space and access to the outdoors."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "While catering to children might not be safe in some spaces, here’s what you should know if you are open to welcoming them into your space."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'It pays off to plan ahead for hosting families'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "If you’re unsure about welcoming guests with children into your space, there are a number of steps you can take to feel more at ease."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Communicate in advance about what is—and isn’t available—in your space."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Help parents pack accordingly by detailing all the family-friendly amenities you already have on hand. Your guidebook can also include recommendations for where to pick up or replenish supplies."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "To help you transition to hosting families, here’s how you can prepare your space over time:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Opt for sturdy and safe furniture, and avoid glass, if possible"
                      .tr(),
                  "Make cleanup easier by avoiding clutter and unnecessary decorations"
                      .tr(),
                  "Move breakables and sharp objects out of a child’s reach"
                      .tr(),
                  "Prevent broken dishes by stocking your kitchen with reusable plastic cups and plates"
                      .tr(),
                  "Consider adding latches to cabinets and protective covers to power outlets"
                      .tr(),
                  "Choose durable, easy-to-clean fabrics, like the materials used for outdoor pillows"
                      .tr(),
                  "Cover hardwood floors with washable rugs".tr()
                ]),
                Text(
                    "Take basic safety precautions to help protect your guests and your home."
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Help put everyone’s mind at ease by installing a smoke and carbon monoxide alarm and fire extinguisher near the kitchen cooktop"
                      .tr(),
                  "Remember to check off these amenities on your listing, and don’t forget to regularly replace batteries"
                      .tr(),
                  "Include local emergency numbers in your house manual and on a quick reference card for guests"
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Consider requiring a cleaning fee.".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Many Hosts include a cleaning fee* to offset the cost of supplies or a professional cleaning service. Here's more on how to charge a cleaning fee if you don't already have one."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "Know what to do if there’s an issue.".tr(),
                  style: mediumTitle,
                ),
                Text(
                    "No matter how prepared you are, accidents may still happen—but there are a few ways you can help protect yourself when hosting on Klomi."
                        .tr()),
                UnorderedList([
                  "Request money through the Resolution Center: You can go through the Resolution Center for missing or damaged items, extra services, or other trip-related issues—like losing a house key. You can also send money to a guest to help compensate for issues like if your space wasn’t ready at check-in.",
                  "Get to know KlomiCover for Hosts: KlomiCover for Hosts includes Host damage protection and Host liability insurance. It’s always included and always free."
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Amenities can make everyone more comfortable".tr(),
                  style: mediumTitle,
                ),
                Text(
                    "If you’re interested in attracting travelers with families, thoughtful touches can help you stand out as the ideal Host. To make their stay feel more like home, be prepared to provide commonly requested items, such as extra towels and sheets. It’s also helpful to stock up on toilet paper and pantry items like salt, black pepper, and other cooking essentials."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "Make sure guests know what you offer".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "After you’ve gone through these steps of getting your space ready for families, it’s time to showcase your space by refreshing your listing details and updating your amenities."
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Having an up-to-date listing title and description can help you attract the right type of travelers—and set clear expectations"
                      .tr(),
                  "Guests who’ll be traveling with children can use search filters to narrow down their options, so you’ll want to remember to also update your amenities. (If you have more than one listing, you can make updates to your amenities across all of your spaces from the Listings page.) A crib and a high chair are the must-have amenities for guests with infants."
                      .tr(),
                  "Include amenities like air conditioning, a washer/dryer, and a kitchen if your space has them"
                      .tr(),
                  "If you offer a washer, mention whether you provide laundry detergent and if there are any additional charges"
                      .tr(),
                  "Tubs make bathing children easier—be sure to mention if you have a bathtub in your listing, and include a photo in your image gallery"
                      .tr(),
                  "Double-check that your photos convey everything that you’ve described. Check out our step-by-step photography tutorial to learn how to highlight all the ways you’re meeting travelers’ needs right now."
                      .tr(),
                ]),
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
