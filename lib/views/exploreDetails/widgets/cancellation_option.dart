// import 'package:flutter/material.dart';

// import '../../../contstant/text_styles.dart';

// class CancellationOption extends StatelessWidget {
//   const CancellationOption(this.title, this.desc, this.isSelect, {super.key});
//   final String title;
//   final String desc;
//   final bool isSelect;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   title,
//                   style: mediumDesc,
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   desc,
//                   style: smallDesc,
//                 ),
//               ],
//             ),
//             isSelect
//                 ? Container(
//                     height: 22,
//                     width: 22,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black, width: 6),
//                         shape: BoxShape.circle),
//                   )
//                 : const Icon(
//                     Icons.circle_outlined,
//                     color: Colors.black38,
//                   )
//           ],
//         ));
//   }
// }
