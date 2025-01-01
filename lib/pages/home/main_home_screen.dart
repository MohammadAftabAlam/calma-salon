import 'package:calma/pages/Appointments/main_appointment_pg.dart';
import 'package:calma/pages/Profile/profile_manager.dart';
import 'package:calma/pages/home/favourite_screen.dart';
import 'package:calma/pages/home/search_screen.dart';
import 'package:calma/provider/nearest_salon_provider.dart';
import 'package:calma/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'home_screen.dart';

class MainHomeScreen extends ConsumerStatefulWidget {
  const MainHomeScreen({super.key});

  @override
  ConsumerState<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends ConsumerState<MainHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _currentWidget = <Widget>[
    HomeScreen(),
    SearchPage(),
    FavouriteScreen(),
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

  // ScrollController scrollController = ScrollController();
  // bool isNavigationBarVisible = true;

  // void _scrollListener() {
  //   if (scrollController.position.userScrollDirection ==
  //       ScrollDirection.reverse) {
  //     if (isNavigationBarVisible) {
  //       setState(() {
  //         isNavigationBarVisible = false;
  //       });
  //     }
  //   } else {
  //     if (!isNavigationBarVisible) {
  //       setState(() {
  //         isNavigationBarVisible = true;
  //       });
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // scrollController.addListener(_scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    final nearestSalonList = ref.watch(nearestSalonProvider);
    Widget alternateContent = SizedBox(
      // height: screenHeight,
      child: const Center(
        child: Text(
          "Unfortunately, Our Services are not available at your location, Thank you for giving us an opportunity to server you",
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return PopScope(
      canPop: true,
      child: Scaffold(
        // extendBody: true,
        // appBar:AppBar(),
        body: nearestSalonList.isNotEmpty ? _currentWidget.elementAt(_selectedIndex) : alternateContent,
        bottomNavigationBar:  nearestSalonList.isNotEmpty ? bottomNavigationBar: null,
      ),
    );
  }

  Widget get bottomNavigationBar {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30),
        ),
        border: Border.all(color: const Color(0xffAEAEAE)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30), topLeft: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels : false,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: const Color(0xffEFDDDB),
          backgroundColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontFamily: "Inter",
            fontSize: 0,
            fontWeight: FontWeight.w400,
            color: AppColor.mainBlackColor,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: "Inter",
            fontSize: 0,
            fontWeight: FontWeight.w400,
            color: AppColor.mainBlackColor,
          ),

          items: [
            BottomNavigationBarItem(
              tooltip: "Home",
              activeIcon: Column(
                children: [
                  SvgPicture.asset("asset/icons/home-icon.svg",),
                  const SizedBox(height: 5,),
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.iconColor,
                      // shape: BoxShape.rectangle
                    ),
                  )
                ],
              ),
              icon: SvgPicture.asset("asset/icons/home-icon.svg",
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: "Home",
            ),

            BottomNavigationBarItem(
              tooltip: "Search",
              activeIcon: Column(
                children: [
                  SvgPicture.asset("asset/icons/search-icon.svg", height: 28),
                  const SizedBox(height: 5,),
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.iconColor,
                      // shape: BoxShape.rectangle
                    ),
                  )
                ],
              ),
              icon: SvgPicture.asset("asset/icons/search-icon.svg",
                  colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: "Search",
            ),

             BottomNavigationBarItem(
              tooltip: "Favourites",
              activeIcon: Column(
                children: [
                  const Icon(Iconsax.heart, color: AppColor.textColor2,size: 32,),
                  const SizedBox(height: 5,),
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.iconColor,
                      // shape: BoxShape.rectangle
                    ),
                  )
                ],
              ),
              icon: const Icon(Iconsax.heart,color: Colors.grey, size: 32,),
              label: "Favourites",
            ),

            BottomNavigationBarItem(
              tooltip: "Appointment",
              activeIcon: Column(
                children: [
                  SvgPicture.asset("asset/icons/appointment-icon.svg",height: 26,),
                  const SizedBox(height: 5,),
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.iconColor,
                      // shape: BoxShape.rectangle
                    ),
                  )
                ],
              ),
              icon: SvgPicture.asset("asset/icons/appointment-icon.svg",
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: "Appointments",
            ),

            BottomNavigationBarItem(
              tooltip: "Profile Manager",
              activeIcon: Column(
                children: [
                  SvgPicture.asset(
                    "asset/icons/userAvatar.svg",
                    height: 30,
                    width: 24,
                    colorFilter: const ColorFilter.mode(AppColor.iconColor, BlendMode.srcIn),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    width: 10,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.iconColor,
                      // shape: BoxShape.rectangle
                    ),
                  )
                ],
              ),
              icon: SvgPicture.asset(
                "asset/icons/userAvatar.svg",
                height: 30,
                width: 24,
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  //
  // Widget get bottomNavigationBar {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 10, left: 20, right: 15),
  //     child: Container(
  //       height: 70,
  //       decoration: BoxDecoration(
  //         // border: Border.all(color: const Color(0xffAEAEAE)),
  //         // borderRadius: BorderRadius.circular(30),
  //         // boxShadow: const [
  //         //   BoxShadow(
  //         //       color: Color.fromRGBO(103, 161, 171, 0.43),
  //         //       spreadRadius: 0.2,
  //         //       blurRadius: 10),
  //         //   BoxShadow(
  //         //       color: Color.fromRGBO(103, 161, 171, 0.25),
  //         //       spreadRadius: 0.2,
  //         //       blurRadius: 10),
  //         // ],
  //       ),
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(30),
  //         child: BottomNavigationBar(
  //           showSelectedLabels: false,
  //           showUnselectedLabels : false,
  //           currentIndex: _selectedIndex,
  //           onTap: _onItemTapped,
  //           type: BottomNavigationBarType.fixed,
  //           selectedFontSize: 12,
  //           unselectedFontSize: 12,
  //           // backgroundColor: const Color(0xffEFDDDB),
  //           backgroundColor: Colors.white,
  //           selectedLabelStyle: const TextStyle(
  //             fontFamily: "Inter",
  //             fontSize: 12,
  //             fontWeight: FontWeight.w400,
  //             color: AppColor.mainBlackColor,
  //           ),
  //           unselectedLabelStyle: const TextStyle(
  //             fontFamily: "Inter",
  //             fontSize: 12,
  //             fontWeight: FontWeight.w400,
  //             color: AppColor.mainBlackColor,
  //           ),
  //
  //           items: [
  //             BottomNavigationBarItem(
  //               activeIcon: const Icon(Iconsax.home_25, size: 32,color: AppColor.textColor2,),
  //                 tooltip: "Home",
  //                 icon: SvgPicture.asset("asset/icons/home-icon.svg"),
  //                 label: "Home",
  //             ),
  //
  //             BottomNavigationBarItem(
  //                 tooltip: "Search",
  //                 activeIcon: SvgPicture.asset("asset/icons/selected_search.svg", height: 28),
  //                 icon: SvgPicture.asset("asset/icons/search-icon.svg"),
  //                 label: "Search",
  //             ),
  //
  //             const BottomNavigationBarItem(
  //                 tooltip: "Favourites",
  //                 activeIcon: Icon(Icons.favorite, color: AppColor.textColor2,size: 32,),
  //                 // icon: SvgPicture.asset("asset/icons/icon"),
  //               icon: Icon(Icons.favorite_border,color: AppColor.textColor2,size: 32,),
  //                 label: "Favourites",
  //             ),
  //
  //             BottomNavigationBarItem(
  //               tooltip: "Appointment",
  //                 activeIcon: SvgPicture.asset("asset/icons/selected_appnt.svg",height: 26,),
  //                 icon: SvgPicture.asset("asset/icons/appointment-icon.svg"),
  //                 label: "Appointments",
  //             ),
  //
  //             BottomNavigationBarItem(
  //               tooltip: "Profile Manager",
  //               activeIcon: const Icon(Iconsax.profile_circle5, color: AppColor.textColor2, size: 32,),
  //               icon: SvgPicture.asset(
  //                 "asset/icons/userAvatar.svg",
  //                 height: 30,
  //                 width: 24,
  //               ),
  //               label: "Profile",
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

/*PopScope(
      canPop: true,
      child: Scaffold(
        // extendBody: true,
        // appBar:AppBar(),
        body: SingleChildScrollView(
          controller: scrollController,
          child: _currentWidget.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(seconds: 10),
          child: isNavigationBarVisible ? bottomNavigationBar : null
        ),
      ),
    );
 */

/*Container(height: 50, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.transparent, border: Border.all(color: Colors.black)), child: IconButton(onPressed: (){}, icon: Icon(Icons.add))),*/


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