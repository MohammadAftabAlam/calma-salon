import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataStoring extends StatelessWidget{
  const SharedPreferencesDataStoring({super.key});


  sharedPreferences(String phoneNumber) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isLogin', false);
    sharedPreferences.setString('phoneNumber',phoneNumber );
    debugPrint("Phone Number: " +sharedPreferences.getString('phoneNumber')!);
  }

  @override
  Widget build(BuildContext context){
    return Text("");
  }
}
