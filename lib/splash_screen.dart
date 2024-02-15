import 'dart:async';

import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/pages/validation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    isLogin();
  }

  void isLogin() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     bool login = sharedPreferences.getBool('isLogin') ?? false;
    if(login){
      Timer(const Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
      });

    }else{
      Timer(const Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
      }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5EDEC),
      body:  Center(child: Text("Splash Screen"),),
    );
  }
}
