// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' hide Trans;

// import '../../../contstant/text_styles.dart';
// import '../../../models/explore_model.dart';
// import '../../confirm_order/view.dart';
// import 'cancellation_option.dart';

// class ExploreDetailsBottomSheet extends StatefulWidget {
//   const ExploreDetailsBottomSheet({super.key, required this.exploreModel});
//   final ExploreModel exploreModel;

//   @override
//   State<ExploreDetailsBottomSheet> createState() =>
//       _ExploreDetailsBottomSheetState();
// }

// class _ExploreDetailsBottomSheetState extends State<ExploreDetailsBottomSheet> {
//   bool isSelected1 = false;
//   bool isSelected2 = false;
//   @override
//   Widget build(BuildContext context) {
//     return StatefulBuilder(
//         builder: (BuildContext context, StateSetter setStater) {
//       return Padding(
//         padding: const EdgeInsets.all(25.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.close,
//                       color: Colors.black,
//                       size: 18,
//                     ),
//                   ),
//                   Text(
//                     'choose a cancellation policy'.tr(),
//                     style: smallTitle.copyWith(fontSize: 15),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   )
//                 ],
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 setStater(() {
//                   isSelected1 = !isSelected1;
//                   isSelected2 = false;
//                 });
//               },
//               child: CancellationOption(
//                   'non-refundable'.tr(),
//                   '\$ 333 /  ${"night".tr()} - \$ 2,003 ${"total".tr()}',
//                   isSelected1),
//             ),
//             InkWell(
//                 onTap: () {
//                   setStater(() {
//                     isSelected2 = !isSelected2;
//                     isSelected1 = false;
//                   });
//                 },
//                 child: CancellationOption(
//                     'refundable'.tr(),
//                     '\$ 370 /  ${"night".tr()} - \$ 2,254 ${"total".tr()}',
//                     isSelected2)),
//             InkWell(
//               onTap: () {
//                 Get.to(() => ConfirmOrder(
//                       exploreModel: widget.exploreModel,
//                     ));
//               },
//               child: Container(
//                 width: MediaQuery.of(context).size.width - 100,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Theme.of(context).primaryColor),
//                 alignment: Alignment.center,
//                 margin: const EdgeInsets.symmetric(vertical: 20),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                 child: Text(
//                   'continue'.tr(),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
