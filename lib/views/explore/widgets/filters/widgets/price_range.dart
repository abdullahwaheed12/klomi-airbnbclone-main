import 'package:klomi/controllers/adpost_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({super.key});

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  final SfRangeValues _initialValues = const SfRangeValues(10, 30);

  final List<Data> _chartData = <Data>[];
  @override
  void initState() {
    var logic = Get.find<AdController>();
    for (var i = logic.min; i < logic.max; i++) {
      _chartData.add(Data(x: i, y: 0 + i));
    }
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdController>(builder: (controller) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "price range".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "the average nighly price".tr(),
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ))),
          SizedBox(
            height: 200,
            width: 300,
            child: SfRangeSelector(
              activeColor: Colors.black,
              onChanged: (value) {
                controller.minimumPriceController.text =
                    "\$${value.start.toInt()}";
                controller.maximumPriceController.text =
                    "\$${value.end.toInt()}";
                controller.update();
              },
              min: controller.min,
              max: controller.max,
              initialValues: _initialValues,
              interval: 10,
              showLabels: true,
              showTicks: true,
              numberFormat: NumberFormat("\$"),
              child: SizedBox(
                height: 100,
                child: SfCartesianChart(
                  borderColor: Colors.transparent,
                  margin: const EdgeInsets.all(0),
                  primaryXAxis: NumericAxis(
                    isVisible: false,
                    minimum: controller.min,
                    maximum: controller.max,
                  ),
                  primaryYAxis:
                      NumericAxis(isVisible: false, maximum: controller.max),
                  plotAreaBorderWidth: 0,
                  plotAreaBackgroundColor: Colors.transparent,
                  series: <ColumnSeries<Data, double>>[
                    ColumnSeries<Data, double>(
                        dataSource: _chartData,
                        color: Colors.black,
                        xValueMapper: (Data sales, int index) => sales.x,
                        yValueMapper: (Data sales, int index) => sales.y)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                width: 120,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.minimumPriceController,
                  decoration: InputDecoration(
                      labelText: "minimum".tr(),
                      labelStyle:
                          const TextStyle(fontSize: 12, color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                width: 10,
                child: Container(
                  width: 10,
                  height: 1,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 50,
                width: 120,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextFormField(
                  controller: controller.maximumPriceController,
                  decoration: InputDecoration(
                      labelText: "maximum".tr(),
                      labelStyle:
                          const TextStyle(fontSize: 12, color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

class Data {
  Data({required this.x, required this.y});
  final double x;
  final double y;
}
