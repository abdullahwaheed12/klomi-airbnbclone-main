import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NextBack extends StatelessWidget {
  const NextBack({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Back'.tr(),
            style: const TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Next'.tr()),
            )),
      ],
    );
  }
}
