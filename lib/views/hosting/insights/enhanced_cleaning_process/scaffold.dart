import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:klomi/contstant/image_path.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/global_widgets/empty_space_widget.dart';

class EnhancedCleaningProcess extends StatelessWidget {
  const EnhancedCleaningProcess({super.key});

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
              "Getting started with the 5-step enhanced cleaning process".tr(),
              style: largeTitle,
            ),
          ),
          const DynamicVerticalSpace(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Learn what's covered---and why cleanliness matters more then ever."
                  .tr(),
              style: mediumDesc,
            ),
          ),
          const DynamicVerticalSpace(25),
          SizedBox(
            height: 250,
            child: Image.asset(
              girlMaskImagePath,
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
                    "The way we travel is different now, and many of you have told us you want more guidance from Klomi around how to help protect yourselves, your loved ones, and your guests from COVID-19. Government authorities are also looking at cleaning practices in the home sharing sector as they create guidelines to reopen and protect their communities."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                    "As the pandemic continues, it’s important that we all do our part to help curb the spread of COVID-19. With this in mind, we rolled out mandatory safety practices that everyone in the Klomi's community is asked to follow."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'COVID-19 Safety practices'.tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "When required by local laws or guidelines, Hosts and guests must agree to wear a mask or face covering when interacting in person and maintain 6 feet (2 meters) of distance from each other. Hosts are also required to follow Klomi's 5-step enhanced cleaning process between each stay."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "The 5-step enhanced cleaning process".tr(),
                  style: mediumTitle,
                ),
                const DynamicVerticalSpace(12),
                const Text(
                    "Hosts of accommodations must agree to follow the 5-step enhanced cleaning process. This is based on Klomi’s cleaning handbook, which was developed in partnership with leading hospitality and medical hygiene experts. To take the guesswork out of cleaning—and to help you reduce the chances of spreading disease during the COVID-19 crisis and beyond, we’ve created a process with clear steps, so you’ll know exactly what to do and when to do it."),
                const DynamicVerticalSpace(12),
                UnorderedList([
                  "Step 1: Prepare . Proper preparation can help you and your team clean more efficiently and more safely"
                      .tr(),
                  "Step 2: Clean . It’s important to start by removing dust and dirt from surfaces, such as floors and countertops"
                      .tr(),
                  "Step 3: Sanitize . Use chemical disinfectants to help reduce the number of bacteria on high-touch surfaces, such as doorknobs and TV remotes"
                      .tr(),
                  "Step 4: Check . Refer to the checklist for each room for best practices on how to clean and sanitize different spaces"
                      .tr(),
                  "Step 5: Reset .  To help prevent cross-contamination, it's important to finish cleaning and sanitizing a room and wash your hands before replacing items for the next guest."
                      .tr()
                ]),
                const DynamicVerticalSpace(12),
                Text(
                    "Once you commit to the cleaning process, guests will see your commitment to Klomi's enhanced clean on your listing page."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  "Step-by-step checklists and education".tr(),
                  style: mediumTitle,
                ),
                Text(
                    "To help you follow the 5-step process, you can refer to the cleaning handbook, which has detailed information on how you can implement each of the steps along with cleaning checklists for every room in your space. We’ve also included COVID-19-specific recommendations, like how to help protect yourself while cleaning."
                        .tr()),
                const DynamicVerticalSpace(12),
                Text(
                  'Please keep in mind that the cleaning process may be updated over time as expert guidance evolves.'
                      .tr(),
                ),
                const DynamicVerticalSpace(12),
                Text(
                    "We know this process will add time to your cleaning routine. But by committing to follow the 5-step enhanced cleaning process between each stay, you’re taking important steps toward protecting yourself, your guests, and the entire Klomi's community. And to make things easier, we've summarized what you need to know right here in the Resource Center."
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
