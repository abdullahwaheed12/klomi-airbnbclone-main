import 'package:klomi/utiles/kyes.dart';
import 'package:klomi/views/listing_posting/widgets/next_back.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../contstant/text_styles.dart';
import 'screen18.dart';

class AddAvailability extends StatefulWidget {
  const AddAvailability({Key? key, required this.allPreviousArgu})
      : super(key: key);
  final Map allPreviousArgu;

  @override
  State<AddAvailability> createState() => _AddAvailabilityState();
}

class _AddAvailabilityState extends State<AddAvailability> {
  final DateRangePickerController _cont = DateRangePickerController();
  DateTime? start;
  DateTime? end;

  void selectionChanges(DateRangePickerSelectionChangedArgs args) {
    if (args.value.startDate != null && args.value.endDate != null) {
      setState(() {
        start = args.value.startDate;
        end = args.value.endDate;
      });
      debugPrint(end.toString());
      debugPrint(start.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(children: [
          SizedBox(
              width: width,
              height: height,
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: width,
                  alignment: Alignment.center,
                  child: Text(
                    "Select the availability duration of place".tr(),
                    style: largeTitle,
                  ),
                ),
                Container(
                  height: height * 0.666,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SfDateRangePicker(
                      initialDisplayDate: DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      enablePastDates: false,
                      selectionMode: DateRangePickerSelectionMode.range,
                      controller: _cont,
                      monthFormat: "yyyy-MM-dd",
                      onSelectionChanged: selectionChanges,
                    ),
                  ),
                ),
                const Spacer(),
                NextBack(
                  onPressed: () {
                    if (start != null && end != null) {
                      Get.to(() => JustLastOne(
                            allPreviousArgu: {
                              AppKeys.availibilityStartKey: start,
                              AppKeys.availibilityEndKey: end,
                              ...widget.allPreviousArgu
                            },
                          ));
                    } else {}
                  },
                )
              ])),
        ]),
      ),
    ));
  }
}
