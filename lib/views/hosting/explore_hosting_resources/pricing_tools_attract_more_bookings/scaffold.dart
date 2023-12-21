import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class PricingToolsAtrractMoreBookings extends StatelessWidget {
  const PricingToolsAtrractMoreBookings({super.key});

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
              "Pricing tools you can use to attract more bookings".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Preview the price guests will pay and set discounts for longer stays."
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              girlPhoneKitchenImagePath,
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
                    "Your nightly price should do two things: meet your financial goals as a Host and offer value to guests. These Klomi tools can help you set a price that does both."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Price preview'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Guests want to find a great place and a good value. To keep your rate competitive, it’s important to understand how your price shows up for guests as they search for places to stay."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "The price preview tool lets you check how much your guests will pay depending on their travel plans. You can select any number of guests and pets for any range of dates, and preview your price for that potential reservation. You’ll get a breakdown of the total price, including fees and discounts, and your earnings."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "To use the tool, go to your hosting calendar. Select one or more dates your listing has available, and then tap “Edit.” If you’re using Klomi in a browser, skip “Edit”—there’s no button. Next, tap or click the nightly price box, then go to “Preview what guests pay.”"
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "With the price preview tool, you actually know what guests are paying versus just what you’re receiving out of that,” says Jake, a Superhost in Big Bear, California."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "As a Host, you always control your price, and you can update it whenever you’d like. Any changes you make won’t affect pending or confirmed reservations."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Discounts for longer stays'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Weekly and monthly discounts often lead to higher occupancy, lower turnover, and less work for you. You choose the percentage of your nightly price you want to offer as a discount."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Weekly discounts apply to all bookings of seven nights or more. Monthly discounts apply to all bookings of 28 nights or more. If you offer both, the monthly discount overrides the weekly one."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "The discounts tool automatically calculates the amount and applies it to the guest’s total. Your discounted price is shown next to your original price (with a strike through it) in guest search results. It also shows up this way in the price breakdown on your listing page."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Our rental is in a weekend recreation area where guests rarely stay outside the Friday-to-Monday window,” says Casey, a Host in Leawood, Kansas. “We benefit by offering a discount of 14.3% or higher, which is equal to one night’s stay or more, to entice people to stay a week. If someone stays seven nights, it’s still more than we would normally expect to make that week."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Before you offer a discount, be sure to read the Host discount policy."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "You can also find these tools in the Booking settings (for mobile) or Pricing and availability settings (for desktop) of your listing."
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
