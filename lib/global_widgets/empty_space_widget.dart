import 'package:flutter/material.dart';

import '../utiles/math_utils.dart';

class VerticalSpace25px extends StatelessWidget {
  const VerticalSpace25px({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(25),
    );
  }
}

class DynamicVerticalSpace extends StatelessWidget {
  const DynamicVerticalSpace(
    this.px, {
    super.key,
  });
  final double px;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(px),
    );
  }
}

class DynamicHorizontalSpace extends StatelessWidget {
  const DynamicHorizontalSpace(
    this.px, {
    super.key,
  });
  final double px;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(px),
    );
  }
}
