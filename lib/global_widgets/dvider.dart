import 'package:flutter/material.dart';

class DviderApp extends StatelessWidget {
  const DviderApp({super.key, this.thickness = 0.5});
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black26,
      thickness: thickness,
    );
  }
}
