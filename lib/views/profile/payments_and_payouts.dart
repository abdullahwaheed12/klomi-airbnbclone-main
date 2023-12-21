import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'widgets/profile_item.dart';

class PaymentsAndPayOuts extends StatelessWidget {
  const PaymentsAndPayOuts({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.035,
            right: width * 0.035,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payments & payouts'.tr(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5),
              ),
              SizedBox(height: height * 0.03),
              Text(
                'Traveling'.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ProfileItem(
                text: 'Payment methods'.tr(),
                iconData: Icons.payment,
                showDivider: true,
              ),
              ProfileItem(
                text: 'Your payments'.tr(),
                iconData: Icons.wallet,
                showDivider: true,
              ),
              ProfileItem(
                text: 'Credits & coupons'.tr(),
                iconData: Icons.credit_score_outlined,
                showDivider: true,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black26,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                'Hosting'.tr(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ProfileItem(
                text: 'Payout methods'.tr(),
                iconData: Icons.credit_score_outlined,
                showDivider: true,
              ),
              ProfileItem(
                text: 'Tax info'.tr(),
                iconData: Icons.tab,
                showDivider: true,
              ),
              ProfileItem(
                text: 'Donations'.tr(),
                iconData: Icons.rice_bowl,
                showDivider: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
