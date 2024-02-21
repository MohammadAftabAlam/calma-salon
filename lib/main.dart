import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/splash_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  // }
  @override
  Widget build(BuildContext context) {

    debugPrint(MediaQuery.sizeOf(context).height.toString());
    debugPrint(MediaQuery.sizeOf(context).width.toString());
    // This code is written for removing the black color of system
      SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
       );
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    //   SystemUiOverlay.bottom,
    // ]);
    return MaterialApp(
      title: "Calma",
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch:Colors.pink, backgroundColor: AppColor.mainBackgroundColor)),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),

    );
  }
}















//***********************************************************************************************************************************
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.green),
//       home: Material(
//         child: Center(
//           child: SvgPicture.asset(
//             'assets/icons/bell.svg',
//             semanticsLabel: 'My SVG Image',
//             height: 100,
//             width: 70,
//           ),
//         ),
//       ),
//     );
//   }
// }

















// ****************************************************************************************************************************************************
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});


//   @override
//   Widget build(BuildContext context) {
//     // debugPrint(MediaQuery.sizeOf(context).height.toString());
//     // debugPrint(MediaQuery.sizeOf(context).width.toString());

//
//     return GetMaterialApp(
//       title: "Calma",
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }
