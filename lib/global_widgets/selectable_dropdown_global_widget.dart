import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SelectableDropDownGlobalWidget extends StatefulWidget {
  const SelectableDropDownGlobalWidget({
    Key? key,
    required this.items,
    required this.hintText,
    this.buttonHeight,
    this.buttonWidth,
    this.dropDownHeight,
    this.dropDownWidth,
  }) : super(key: key);

  final List<DropdownMenuItem<String>>? items;
  final String hintText;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? dropDownHeight;
  final double? dropDownWidth;

  @override
  State<SelectableDropDownGlobalWidget> createState() =>
      _SelectableDropDownGlobalWidgetState();
}

class _SelectableDropDownGlobalWidgetState
    extends State<SelectableDropDownGlobalWidget> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                widget.hintText,
                style: const TextStyle(
                  color: Colors.black38,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items,
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
        },
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        iconSize: height * 0.028,
        iconEnabledColor: Colors.black38,
        iconDisabledColor: Colors.black38,
        buttonHeight: widget.buttonHeight ?? height * 0.064,
        buttonWidth: widget.buttonWidth ?? double.infinity,
        barrierColor: Colors.black38,
        buttonPadding: EdgeInsets.symmetric(
          vertical: height * 0.006,
          horizontal: width * 0.03,
        ),
        buttonDecoration: BoxDecoration(
          border: Border.all(
            color: Colors.black38,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        itemHeight: height * 0.045,
        itemPadding: EdgeInsets.only(left: width * 0.04, right: width * 0.01),
        dropdownMaxHeight: widget.dropDownHeight ?? height * 0.2,
        dropdownWidth: widget.dropDownWidth ?? width * 0.92,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        dropdownElevation: 2,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }
}
