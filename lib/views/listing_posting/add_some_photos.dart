// import 'package:klomi/views/listing_posting/widgets/next_back.dart';
// import 'package:flutter/material.dart';

// import 'screen11.dart';

// class AddSomePhotos extends StatelessWidget {
//   const AddSomePhotos({super.key});

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
//               const Text(
//                 'Add some photos of your castle',
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 "You'll need 5 photos to get started. You can add more or make changes later.",
//                 style: TextStyle(color: Colors.grey),
//               ),
//               const SizedBox(
//                 height: 35,
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//                 decoration: BoxDecoration(
//                     color: const Color(0xffF7F7F7),
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Row(
//                   children: const [
//                     Icon(Icons.add),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text('Add photos')
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//                 decoration: BoxDecoration(
//                     color: const Color(0xffF7F7F7),
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Row(
//                   children: const [
//                     Icon(Icons.camera_alt),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text('Take new photos')
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               NextBack(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => CabinTitle(
//                       allPreviousArgu: {},
//                     ),
//                   ));
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
