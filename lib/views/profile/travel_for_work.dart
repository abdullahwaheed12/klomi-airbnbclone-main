import 'package:klomi/contstant/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TravelForWork extends StatefulWidget {
  const TravelForWork({super.key});

  @override
  State<TravelForWork> createState() => _TravelForWorkState();
}

class _TravelForWorkState extends State<TravelForWork> {
  var textEController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Travel for work'.tr(),
                    style: smallTitle,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Try Klomi for Work'.tr(),
                style: mediumTitle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  'Add your work email to unlock extra perks for buiness trips.'
                      .tr()),
              const SizedBox(
                height: 50,
              ),
              Text('Work email'.tr()),
              TextField(
                controller: textEController,
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    suffixIcon: InkWell(
                        onTap: () {
                          textEController.clear();
                          setState(() {});
                        },
                        child: const Icon(Icons.cancel))),
              ),
              const Spacer(),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: Size(size.width, 50)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Add Work Email'.tr()))
            ],
          ),
        ),
      ),
    );
  }
}
