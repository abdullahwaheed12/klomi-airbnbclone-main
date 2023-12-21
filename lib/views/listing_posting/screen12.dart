// import 'package:klomi/models/describe_your_castle_mode.dart';
// import 'package:klomi/views/listing_posting/widgets/next_back.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' hide Trans;

// import 'screen13.dart';

// class ChooseHighlights extends StatefulWidget {
//   const ChooseHighlights({super.key, required this.allPreviousArgu});
//   final Map allPreviousArgu;

//   @override
//   State<ChooseHighlights> createState() => _ChooseHighlightsState();
// }

// class _ChooseHighlightsState extends State<ChooseHighlights> {
//   DescripYourCastleModel descripYourCastleModel = DescripYourCastleModel();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               Text(
//                 "Next, let's describe \nyour castle".tr(),
//                 style:
//                     const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Text(
//                 "Choose up to 2 highlights. We'll use these to get your description started."
//                     .tr(),
//                 style: const TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               Row(
//                 children: [
//                   ChooseCastleCard(
//                     icon: Icons.diamond_outlined,
//                     title: 'Rare'.tr(),
//                     onTap: () {
//                       descripYourCastleModel.isRare =
//                           !descripYourCastleModel.isRare;
//                       setState(() {});
//                     },
//                     isSelected: descripYourCastleModel.isRare,
//                   ),
//                   ChooseCastleCard(
//                     icon: Icons.holiday_village_outlined,
//                     title: 'Rustic'.tr(),
//                     onTap: () {
//                       descripYourCastleModel.isRustic =
//                           !descripYourCastleModel.isRustic;
//                       setState(() {});
//                     },
//                     isSelected: descripYourCastleModel.isRustic,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   ChooseCastleCard(
//                     icon: Icons.nature_outlined,
//                     title: 'In nature'.tr(),
//                     onTap: () {
//                       descripYourCastleModel.isInNature =
//                           !descripYourCastleModel.isInNature;
//                       setState(() {});
//                     },
//                     isSelected: descripYourCastleModel.isInNature,
//                   ),
//                   ChooseCastleCard(
//                     icon: Icons.filter_frames,
//                     title: 'Memorable'.tr(),
//                     onTap: () {
//                       descripYourCastleModel.isMemorable =
//                           !descripYourCastleModel.isMemorable;
//                       setState(() {});
//                     },
//                     isSelected: descripYourCastleModel.isMemorable,
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   ChooseCastleCard(
//                     icon: Icons.heat_pump,
//                     title: 'Romantic'.tr(),
//                     onTap: () {
//                       descripYourCastleModel.isRomantic =
//                           !descripYourCastleModel.isRomantic;
//                       setState(() {});
//                     },
//                     isSelected: descripYourCastleModel.isRomantic,
//                   ),
//                   ChooseCastleCard(
//                     icon: Icons.delete_outlined,
//                     title: 'Historic'.tr(),
//                     onTap: () {
//                       descripYourCastleModel.isHistoric =
//                           !descripYourCastleModel.isHistoric;
//                       setState(() {});
//                     },
//                     isSelected: descripYourCastleModel.isHistoric,
//                   ),
//                 ],
//               ),
//               const Spacer(),
//               NextBack(
//                 onPressed: () {
//                   Get.to(
//                     () => DescriptionScreen(
//                       allPreviousArgu: widget.allPreviousArgu,
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ChooseCastleCard extends StatelessWidget {
//   const ChooseCastleCard(
//       {super.key,
//       required this.icon,
//       required this.title,
//       required this.isSelected,
//       required this.onTap});
//   final String title;
//   final IconData icon;
//   final bool isSelected;
//   final void Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         margin: const EdgeInsets.only(right: 10),
//         decoration: BoxDecoration(
//             color: const Color(0xffF7F7F7),
//             border: Border.all(
//               width: isSelected ? 2 : 1,
//               color: isSelected ? Colors.black : Colors.grey,
//             ),
//             borderRadius: BorderRadius.circular(30)),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon),
//             const SizedBox(
//               width: 5,
//             ),
//             Text(title),
//           ],
//         ),
//       ),
//     );
//   }
// }
