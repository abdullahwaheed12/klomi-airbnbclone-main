import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/views/login/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../../../models/explore_model.dart';
import '../../confirm_order/view.dart';

class BottomBarReserve extends StatefulWidget {
  const BottomBarReserve({super.key, required this.exploreModel});
  final ExploreModel exploreModel;
  @override
  State<BottomBarReserve> createState() => _BottomBarReserveState();
}

class _BottomBarReserveState extends State<BottomBarReserve> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 1, color: Colors.black12))),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\$${widget.exploreModel.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: '  night'.tr(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '${DateFormat('MMMM').format(DateTime(0, widget.exploreModel.start.month))} ${widget.exploreModel.start.day} - ${widget.exploreModel.end.day}',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          if (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.uid !=
                  widget.exploreModel.hostId)
            InkWell(
              onTap: () async {
                if (FirebaseAuth.instance.currentUser == null) {
                  Get.to(() => const LogIn());
                } else {
                  var hostUser = await Get.find<GeneralGetxController>()
                      .getUserData(widget.exploreModel.hostId);
                  Get.to(() => ConfirmOrder(
                        exploreModel: widget.exploreModel,
                        hostData: hostUser,
                      ));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Text(
                  'reserve'.tr(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
