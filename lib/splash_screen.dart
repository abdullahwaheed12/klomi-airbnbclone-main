// import 'package:klomi/views/login/login_screen.dart';
// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   static String id = 'splash_screen';

//   const SplashScreen({super.key});
//   @override
//   SplashScreenState createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const LogIn()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFC65201),
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: FractionalOffset.topLeft,
//                 end: FractionalOffset.bottomRight,
//                 colors: [
//                   Color(0xFFC65201),
//                   Color(0xFFC65201),
//                 ],
//                 //stops: [0.2, 2],
//               ),
//             ),
//           ),
//           Center(
//               child: Image.asset(
//             "assets/images/logo1.png",
//             scale: 5, // To reduce more size
//           )),
//         ],
//       ),
//     );
//   }
// }
