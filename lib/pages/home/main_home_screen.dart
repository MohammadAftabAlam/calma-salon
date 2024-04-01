import 'package:calma/pages/Appointments/main_appointment_pg.dart';
import 'package:calma/pages/Profile/profile_manager.dart';
import 'package:calma/pages/home/search_page.dart';
import 'package:calma/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _currentWidget = <Widget>[
    HomeScreen(),
    SearchPage(),
    Appointments(),
    ProfileManager(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      //   onWillPop: () async{
      //      bool? value =  await showDialog<bool>(context: context, builder: (context){
      //        return AlertDialog(
      //          title: Text("Are you sure want to go back"),
      //          actions: [
      //            TextButton(onPressed: (){Navigator.of(context).popUntil ;}, child: Text("No")),
      //            TextButton(onPressed: (){Navigator.of(context).pop(true);}, child: Text("Yes Exit")),
      //          ],
      //        );
      //      });
      //      if(value != null){
      //        return Future.value(value);
      //      }else{
      //        return Future.value(false);
      //      }
      //     },
      // DateTime pre_backpress = DateTime.now();
      // return WillPopScope(
      //   onWillPop: () async{
      //     final timegap = DateTime.now().difference(pre_backpress);
      //     final cantExit = timegap >= Duration(seconds: 2);
      //     pre_backpress = DateTime.now();
      //     if(cantExit){
      //       //show snackbar
      //       final snack = SnackBar(content: Text('Press Back button again to Exit'),duration: Duration(seconds: 2),);
      //       ScaffoldMessenger.of(context).showSnackBar(snack);
      //       return false;
      //     }else{
      //       return true;
      //     }
      //   },
      //   child: Scaffold(
      child: Scaffold(
        // backgroundColor: AppColor.mainBackgroundColor,
        body: _currentWidget.elementAt(_selectedIndex),
        bottomNavigationBar: bottomNavigationBar,
        // ),
      ),
    );
  }

  Widget get bottomNavigationBar {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: const Color(0xffEFDDDB),
          selectedLabelStyle: const TextStyle(
              fontFamily: "Inter",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.mainBlackColor),
          unselectedLabelStyle: const TextStyle(
              fontFamily: "Inter",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.mainBlackColor),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("asset/icons/home-icon.svg"),
                label: "Home"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("asset/icons/search-icon.svg"),
                label: "Search"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("asset/icons/appointment-icon.svg"),
                label: "Appointments"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "asset/icons/userAvatar.svg",
                  height: 30,
                  width: 24,
                ),
                label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
