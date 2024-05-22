import 'package:calma/Routes/routes.dart';
// import 'package:calma/pages/Appointments/Appointment_Process/payment_page.dart';
import 'package:calma/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

// ****************************************************************************************************************************************************
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    return  MaterialApp(
      title: "Calma",
      // theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch:Colors.pink, backgroundColor: AppColor.mainBackgroundColor)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: const DevelopersImage(),
      // home: PaymentScreen(date: "27/03/2004",time: "5:30AM",bookingFor: "Self",),
      routes: getRoute(),
    );
  }
}

// import 'package:flutter/material.dart';
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
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Simulating a splash screen with a delay
//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Screen1()));
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Splash Screen'),
//       ),
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
//
// class Screen1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Screen 1'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Screen2()));
//           },
//           child: Text('Go to Screen 2'),
//         ),
//       ),
//     );
//   }
// }
//
// class Screen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Screen 2'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Screen3()));
//           },
//           child: Text('Go to Screen 3'),
//         ),
//       ),
//     );
//   }
// }
//
// class Screen3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Screen 3'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
//           },
//           child: Text('Go to Home Screen'),
//         ),
//       ),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       // Prevents back button from returning to any previous screens
//       onWillPop: () async {
//         // Pop all routes off the navigator to exit the app
//         Navigator.of(context).popUntil((route) => route.isFirst);
//         return false;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Home Screen'),
//         ),
//         body: Center(
//           child: Text('Press the back button to exit the application.'),
//         ),
//       ),
//     );
//   }
// }
