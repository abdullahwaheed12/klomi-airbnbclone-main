import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class BestAmenitiesOffer extends StatelessWidget {
  const BestAmenitiesOffer({super.key});

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
              "The best amenities to offer right now".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "From reliable wifi to a pet-friendly space, here’s what guests care about most."
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              kitchenImagePath,
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
                    "According to new Klomi data,* guests often filter their search results to find 10 top amenities. If you have any of these popular amenities, make sure you include them in your listing so guests can find you when they search."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Here’s how to provide the right amenities, set up a dedicated workspace, and promote your space."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'What guests want most right now'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text("A home away from home".tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Guest search results worldwide show that the top 10 amenities guests want right now are:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "A pool".tr(),
                  "Wifi".tr(),
                  "A kitchen".tr(),
                  "Free parking".tr(),
                  "A jacuzzi".tr(),
                  "A washer or dryer".tr(),
                  "Air conditioning or heating".tr(),
                  "Self check-in".tr(),
                  "Laptop-friendly workspace".tr(),
                  "Pets allowed".tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                    "Here’s what you can do to ensure some of these amenities are as guest-friendly as possible:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Wifi: Double-check that it’s working and that guests know how to log on. Consider placing a laminated, easy-to-clean sign somewhere in your space with helpful instructions."
                      .tr(),
                  "Air conditioning: We know that central air conditioning isn’t common in some regions. If you have it, let guests know where to find the controls and how to use them—a laminated sign with instructions may be useful here, too. If you don’t have it, consider offering a portable unit for hot summer months."
                      .tr(),
                  "Kitchen: Guests may want to cook their own meals during their stay, so make sure to supply dishware, pots and pans, and cooking utensils. It’s a good idea to mention these items in your listing description."
                      .tr(),
                  "Parking: If you have a parking spot for guests, remember to provide any instructions before they arrive, and don’t forget to select parking as an amenity on your listing."
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Outdoor spaces".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Many guests want to stay in places with things to do outside. If your area offers great hiking trails and other outdoor activities, let guests know about them either in your guidebook or house manual."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Another way to help them enjoy a little fresh air is to spruce up the outdoor areas of your space. Keep the landscaping well-groomed, and consider adding (or updating) the following amenities:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Patio furniture".tr(),
                  "A barbecue grill".tr(),
                  "Outdoor cups and plates".tr(),
                  "Games and other entertainment".tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Cleaning supplies".tr(),
                  style: mediumTitle,
                ),
                Text(
                    "Many guests will appreciate the chance to keep things clean. It’s a good idea to stock up on:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Paper towels".tr(),
                  "Disposable gloves".tr(),
                  "Multi-surface cleaner".tr(),
                  "Disinfectant wipes or spray".tr(),
                  "Antibacterial hand sanitizer".tr(),
                  "Hand soap".tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "If you offer any of these amenities, make sure you include them in your listing so guests can find you when they search."
                      .tr(),
                  style: largeDesc,
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Who’s traveling—and how to meet their expectations".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Families with kids".tr(),
                  style: smallTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "You can help parents with small children feel more comfortable in your space by stocking some of the things they need most, such as:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Cribs".tr(),
                  "High chairs".tr(),
                  "Baby gates".tr(),
                  "Kids’ cups, plates, and utensils".tr(),
                  "Changing table".tr(),
                  "Baby monitors".tr(),
                  "Outlet covers".tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Who’s traveling—and how to meet their expectations".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "You should also make sure you have enough essentials to go around, such as:"
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Soap".tr(),
                  "Shampoo".tr(),
                  "Toilet paper".tr(),
                  "Extra bedding and towels".tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Pet parents".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Many guests want to bring their four-legged family members with them on trips. We know that it’s not possible for some Hosts to offer a pet-friendly space. But if you can, now’s a great time to do so."
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Guests traveling with pets may want to know what to expect in your space, like whether you have a fenced-in yard or a private patio. You may also want to provide pet-friendly amenities such as:"
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Bowls for food and water".tr(),
                  "Furniture covers".tr(),
                  "Designated towels to wipe off paws at the door".tr(),
                  "Extra cleaning supplies".tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "It’s also a good idea to update your house rules. You can let guests know things like how many pets you allow per stay, what types of pets you accept, and whether it’s OK to leave a pet unattended in your space."
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Remote workers".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Many people continue to do their jobs remotely and may decide to work while traveling. You can help them stay productive by including the following amenities:"
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Fast wifi: Guests have higher expectations for fast internet now that so many of them are working remotely. You can test your wifi speed using your Klomi app—and, if your results are slow, consider upgrading to faster service."
                      .tr(),
                  "A laptop-friendly workspace: Locate a desk or table near a power source, with a comfortable chair (even better if it’s ergonomic). Want to go the extra mile? Add a stapler, a stack of sticky notes, and a cup full of brand-new pens. If you have a printer or a copy machine, make sure to highlight those in your listing description."
                      .tr(),
                  "Coffee maker and tea kettle: These guests are likely to appreciate a little help powering through their busy days."
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  "Remember to update your listing".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Don’t forget to showcase the changes you’ve made by updating your amenities, listing description, and photos. Adding just a few sought-after items can go a long way toward making guests feel more comfortable in your space—and could lead to a great review."
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
