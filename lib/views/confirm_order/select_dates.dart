import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../controllers/ad_apply_controller.dart';
import '../../contstant/text_styles.dart';
import '../../utiles/kyes.dart';

class SelectDates extends StatefulWidget {
  const SelectDates(
      {Key? key,
      required this.min,
      required this.max,
      required this.selectedDates})
      : super(key: key);
  final DateTime min;
  final DateTime max;
  final List<DateTime> selectedDates;
  @override
  State<SelectDates> createState() => _SelectDatesState();
}

class _SelectDatesState extends State<SelectDates> {
  final DateRangePickerController _cont = DateRangePickerController();
  DateTime? start;
  DateTime? end;

  void selectionChanges(DateRangePickerSelectionChangedArgs args) {
    if (args.value.startDate != null && args.value.endDate != null) {
      Get.find<AdApplyController>().selectedStartDate = args.value.startDate;
      Get.find<AdApplyController>().selectedEndDate = args.value.endDate;
      setState(() {
        start = args.value.startDate;
        end = args.value.endDate;
      });
      debugPrint(end.toString());
      debugPrint(start.toString());
    }
  }

  @override
  void initState() {
    start = widget.min;
    end = widget.max;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(children: [
              SizedBox(
                width: width,
                height: height,
                child: Column(children: [
                  Container(
                    width: width,
                    alignment: Alignment.center,
                    child: Text(
                      "Select the reservation date range".tr(),
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
                        minDate: widget.min,
                        maxDate: widget.max,
                        enablePastDates: false,
                        monthViewSettings: DateRangePickerMonthViewSettings(
                            blackoutDates: widget.selectedDates),
                        selectionMode: DateRangePickerSelectionMode.range,
                        controller: _cont,
                        monthFormat: "yyyy-MM-dd",
                        onSelectionChanged: selectionChanges,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          onPressed: () {
                            Get.back(result: {
                              AppKeys.availibilityStartKey: start,
                              AppKeys.availibilityEndKey: end
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Select'.tr()),
                          )),
                    ],
                  ),
                ]),
              ),
            ]),
          ),
        ));
  }
}
