import 'package:klomi/contstant/image_path.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyTripsHost extends StatelessWidget {
  const EmptyTripsHost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: SizedBox(
                height: 200,
                child: Lottie.asset(
                  noDataAnimation,
                )),
          ),
        ),
      ),
    );
  }
}
