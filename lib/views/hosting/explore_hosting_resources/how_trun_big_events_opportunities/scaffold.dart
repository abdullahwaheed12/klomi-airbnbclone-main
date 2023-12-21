import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class HowTurnBigEventsOpportunity extends StatelessWidget {
  const HowTurnBigEventsOpportunity({super.key});

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
              "How to turn big events into opportunities to earn money".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Get details on setting your price, opening your calendar, and more."
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              watchingMatchImagePath,
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
                    "After being paused for COVID-19, crowd magnets like concerts, conventions, and sports championships are making a comeback. As big events return worldwide, they’re creating opportunities to earn money as a Host."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "In fact, Klomi got started when two San Francisco roommates opened their home to guests during a design conference. To help pay their rent, Brian Chesky and Joe Gebbia turned the apartment they shared into the first Klomi stay."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "Whether you’re hosting for the first time, occasionally, or year-round, you can benefit from travelers drawn to your area by a local event. Here’s how to make the most of hosting during these busy periods."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Plan ahead'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "If you aren’t already tracking events in your area, now’s a great time to do some research and think strategically about hosting when demand is high. Steps you can take include:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Find out what’s coming. You can gather info about local events from various sources, including regional news outlets, tourism bureaus, chambers of commerce, universities, social media and community groups, and event ticketing sites."
                      .tr(),
                  "Check the going rates. It’s a good idea to gauge what hotels in your area are charging for the dates around big events, so you can consider offering competitive pricing. You may want to assess any package deals offered through the event organizer’s website too."
                      .tr(),
                ]),
                Text(
                    "When Miami was home to a big tennis tournament in March 2019, local Hosts earned over \$7 million USD.*"
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Update your listing'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Using the local event and pricing info you’ve collected, you can update your listing to reflect what you think will appeal to guests in your area.”"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Make dates available. After you’ve noted potentially busy times, check your availability to host on those dates and open your calendar for potential bookings as early as possible. Some guests like to secure a place to stay well in advance of a big event."
                      .tr(),
                  "Adjust your nightly price. You can customize your nightly price to offer a rate that’s competitive in your area. Some guests are willing to pay more to book specific dates, especially for lodging near the event venues."
                      .tr(),
                  "Allow shorter stays. If you normally host longer stays, try decreasing or eliminating your minimum stay requirement around major events. Or, if you find your space available shortly before a big event, consider changing your calendar availability to let guests book with less advance notice than usual."
                      .tr(),
                  "Share info with guests. Add big local events and their dates to your listing description or guidebook. If you’ve picked up brochures, calendars, or other free info from local sources, try placing those where guests can easily find them."
                      .tr(),
                ]),
                const DynamicVerticalSpace(12),
                Text(
                  'Host with confidence'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "Klomi has policies, protections, and resources in place to support Hosts during big events. We aim to give you peace of mind by helping you:"
                        .tr()),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Prevent unexpected guests. Klomi’s party and events policy prohibits all gatherings of more than 16 people and disruptive get-togethers of any size. Our reservation screening technology also helps reduce the chance of disruptive parties and property damage."
                      .tr(),
                  "Apply for reimbursement. Host damage protection, a part of AirCover for Hosts, provides Hosts with protection in the rare event your place or belongings are damaged by a guest during an Klomi stay."
                      .tr(),
                  "Choose the right cancellation policy for you. Your cancellation policy applies to all new reservations, except in extenuating circumstances, such as when you or a guest is sick with COVID-19."
                      .tr(),
                  "Connect with other Hosts. If you have questions about hosting, there’s a good chance other Hosts have insights into what works and what doesn’t. You can join your local Host Club or start a conversation in the Community Center to connect with other Hosts."
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
