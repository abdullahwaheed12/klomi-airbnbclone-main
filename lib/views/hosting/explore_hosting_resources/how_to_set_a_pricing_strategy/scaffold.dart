import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class HowToSetAPrice extends StatelessWidget {
  const HowToSetAPrice({super.key});

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
              "How to set a pricing strategy".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "The right price can help attract guests and boost your earnings on Klomi."
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              girlOpenLaptopImagePath,
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
                    "Price is one of the main things guests consider when choosing where to stay. No matter how wonderful your space is, if it’s priced higher than comparable places nearby, there’s a good chance you’ll miss out on bookings."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "In 2022, listings with prices that were updated at least four times had over 30% more nights booked than those that didn’t.* Try these tips to figure out a pricing strategy that works for you."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Know your area'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Start by searching Klomi for the nightly prices of similar listings in your area. Consider what you offer, including:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Your property type: house, apartment, etc.".tr(),
                  "How much space guests will have: entire place, private room, etc."
                      .tr(),
                  "How many guests your place sleeps comfortably: number of beds and bedrooms you provide"
                      .tr(),
                  "Your top amenities: wifi, kitchen, pets allowed, etc.".tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                    "When comparing prices, choose dates a few months in the future to fully understand what’s out there. Properties still available in the next week or two may not be booked because they’re priced too high."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Observing what other Hosts charge at different times of the year can help you adjust prices seasonally, on weekends, and for special events or holidays. Guest travel trends in your area are highlighted in your Opportunities hub."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Offer the best value'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                  'The nightly price you set isn’t the total price guests will pay. The total price also includes any optional fees (for cleaning, extra guests, or pets) you might add, plus Klomi’s service fee.'
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Guests can choose to display total prices up front in locations where local rules don’t already require it. Competitive pricing can help your listing stand out and rank higher in search results, which prioritize total price and the quality of a listing compared to similar listings in the area."
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Some costs you’re including in your price may not be obvious to guests. Do you offer extras, like a full breakfast, luxury bath products, or streaming services? Make that clear in your listing description to help guests find value in your price."
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                Text(
                  "Try these pricing tools".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Discounts and promotions let you offer lower prices under certain conditions without changing your regular nightly price. These tools support different situations, such as welcoming your first guests or hosting longer stays."
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Longer stays: Offering weekly and monthly discounts can lead to higher occupancy, lower turnover, and less work for you. Reservations of a week or longer made up 46% of nights booked on Klomi in 2022."
                      .tr(),
                  "New listings: Promoting a brand-new listing with a 20% discount off your nightly price can help entice your first three guests to book. Klomi data shows that Hosts who offer this promotion during the first 30 days a listing is active get their initial booking faster."
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                    "The discounts and promotions available for your listing can be set from your hosting calendar."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "Preview what guests pay".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "You can check how any changes you make affect the final price guests pay, including all fees and taxes. This tool is especially useful if you add a discount or promotion."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "To use the tool, go to your pricing settings and select “Preview what guests pay.” Enter the details of the stay, such as the number of guests and nights in the reservation, and get a breakdown of the guest’s total price and your payout."
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
