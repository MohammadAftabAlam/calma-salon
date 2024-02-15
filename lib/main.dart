import 'package:calma/splash_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  // debugPrint("Firebase has been initiialiszze");
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
    return MaterialApp(
      title: "Calma",
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch:Colors.pink, backgroundColor: AppColor.mainBackgroundColor)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),

    );
  }
}

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
