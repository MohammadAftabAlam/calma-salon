import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;


import 'package:calma/screens/Appointments/main_appointment_pg.dart';
import 'package:calma/screens/profile/location_screen.dart';
import 'package:calma/screens/profile/profile_manager.dart';
import 'package:calma/screens/home/home_page_body.dart';
import 'package:calma/screens/home/notifications.dart';
import 'package:calma/screens/home/search_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    // scrollController.addListener(_scrollListener);
  }
  /*Asking user current location STARTS here*/

  final apiKey = '----PLACE YOUR API KEY HERE----'; // Replace with your Google Maps Geocoding API key
  loc.Location location = loc.Location();
  bool _serviceEnabled = false;
  loc.LocationData? _currentLocation;
  loc.PermissionStatus _permissionGranted = loc.PermissionStatus.denied;
  String? _areaName = "";

  Future<void> _checkLocationPermission() async {
    //if user denied to give their location permission then this line of code continuously ask
    //to enable the location services for this application

    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    } else {
      return;
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        // _permissionGranted = await location.requestPermission();
        return;
      }
      // if(_permissionGranted == PermissionStatus.granted){
      //   return;
      // }
    }
    _getLocation();
  }

  Future<void> _getLocation() async {
    try {
      _currentLocation = await location.getLocation();
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        _currentLocation!.latitude!,
        _currentLocation!.longitude!,
      );
      Placemark placeMark = placeMarks.first;
      // setState(() async {
      // _areaName = "${placeMark.street} ${placeMark.subLocality!} ${placeMark.subAdministrativeArea!}" ;
      // _areaName = placeMark.subLocality ?? placeMark.locality!;
      //_areaName = await getAreaNameFromCoordinates(_currentLocation!.latitude!, _currentLocation!.longitude!);
      _areaName = await getAddressFromLatLng(
          _currentLocation!.latitude!, _currentLocation!.longitude!);
      // });
      setState(() {});
    } catch (e) {
      // print(e);
    }
  }

  Future<String?> getAddressFromLatLng(double lat, double lng) async {
    String host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$host?key=$apiKey&language=en&latlng=$lat,$lng';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      String formattedAddress = data["results"][0]["formatted_address"];
      // print("response ==== $formattedAddress");
      // _areaName = formattedAddress;
      return formattedAddress;
    } else {
      return null;
    }
  }

  /*Asking user current location ENDS here*/

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // debugPrint(_areaName);
    return Scaffold(
      body: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* ***************** Starts Location and Notification ************ */
          Container(
            width: screenWidth,
            margin: EdgeInsets.only(
              top: screenHeight * 0.04 /*35.6*/,
              bottom: screenHeight * 0.005, /*5*/
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.036, //15
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
      
                    /// Formatted Address, Navigation to Address Screen
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.036 /*15*/),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Home Text and Downward Icon
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ShowLocationPage(),
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const BigText(
                                  text: "Home",
                                  fontSize: 16,
                                  fontFamilyName: "Inter",
                                  fontWeightName: FontWeight.w900,
                                ),
      
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 10),
                                  child: SvgPicture.asset(
                                    "asset/icons/arrow_downward.svg",
                                    height: 8,
                                    width: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
      
                          /* ************ Getting User location and showing on the screen STARTS here ********* */
                          /* ****** If user location is null show progress indicator ***** */
                          Row(
                            children: [
                              SvgPicture.asset(
                                "asset/icons/Vector.svg",
                                // alignment: Alignment.bottomLeft,
                                // color: Colors.black,
                                theme: const SvgTheme(currentColor: Colors.black),
                                height: 11,
                                width: 7,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
      
                              /// Showing Formatted Address
                              _areaName!.isEmpty
                                  ? const Row(
                                      children: [
                                        SmallText(
                                          text: "Fetching location...",
                                          fontSize: 10,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 10,
                                          height: 10,
                                          child: CircularProgressIndicator(
                                            color: AppColor.quoteColor,
                                            strokeWidth: 2,
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(
                                      width: 260,
                                      child: Text(
                                        _areaName!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.mainBlackColor,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          /* ************ Getting User location and showing on the screen ENDS here ********* */
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.bottomCenter,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const NotificationScreen(),
                        ),
                    );
                  },
                  icon: SvgPicture.asset(
                    "asset/icons/bell.svg",
                    height: 26,
                  ),
                ),
              ],
            ),
          ),
          /* ***************** Ends Location and Notification ************ */
      
          /* *********** Starts Body of Home Page ****************** */
          const Expanded(child: SingleChildScrollView(child: HomePageBody())),
      
          // Expanded(child: SingleChildScrollView(child: _currentWidget.elementAt(_selectedIndex))),
          /* *********** Ends Body of Home Page ******************* */
        ],
      ),
    );

    // bottomNavigationBar: BottomNavigationBar(items: [
    //   BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: "Home"),
    //   BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: "Home"),
    //   BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: "Home"),
    //   BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: "Home"),
    // ],
    //   currentIndex: _selectedIndex,
    //   onTap: _onItemTapped,
    // ),
    /* *********** Starts  BottomNavigation Bar****************** */
    // bottomNavigationBar: bottomNavigationBar,
    /* *********** Ends BottomNavigation Bar****************** */
    //  );
  }
}

// class BottomNavigationBarContent extends StatelessWidget {
//   final double screenHeight;
//   const BottomNavigationBarContent({super.key, required this.screenHeight});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         BottomNavigationIcon(
//           onPress: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const HomeScreen()));
//           },
//           pic: SvgPicture.asset("asset/icons/home-icon.svg"),
//           text: "Home",
//         ),
//         BottomNavigationIcon(
//           onPress: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const SearchPage()));
//           },
//           pic: SvgPicture.asset("asset/icons/search-icon.svg"),
//           text: "Search",
//         ),
//         BottomNavigationIcon(
//           onPress: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const appointments()));
//           },
//           pic: SvgPicture.asset("asset/icons/appointment-icon.svg"),
//           text: "appointments",
//         ),
//         BottomNavigationIcon(
//           onPress: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const ProfileManager()));
//           },
//           pic: SvgPicture.asset(
//             "asset/icons/userAvatar.svg",
//             height: 30,
//             width: 24,
//           ),
//           text: "profile",
//         ),
//       ],
//       // ),
//     );
//   }
// }

/* ****************************Starts BottomNavigationIcon Widget Creation ************************************ */
// class BottomNavigationIcon extends StatelessWidget {
//   // final IconData iconData;
//   final SvgPicture pic;
//   final VoidCallback onPress;
//   final String text;
//   const BottomNavigationIcon({
//     super.key,
//     required this.onPress,
//     required this.pic,
//     required this.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPress,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           // IconButton(
//           //   onPressed: onPress,
//           //   iconSize: 20, //30,
//           //   // icon: Icon(iconData),
//           //   icon: pic,
//           //   hoverColor: Colors.teal,
//           // ),
//           pic,
//           SmallText(text: text)
//           // Text(text)
//         ],
//       ),
//     );
//   }
// }
/* ****************************Ends BottomNavigationIcon Widget Creation ************************************ */

/*BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          ],
        ),*/

/*BottomNavigationBar(
        unselectedItemColor: Colors.red,
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        backgroundColor: Colors.transparent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "appointments"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
*/

//Working scaffold
/*return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* ***************** Starts location and Notification ************ */
          Container(
            width: screenWidth,
            margin: EdgeInsets.only(
              top: screenHeight * 0.04 /*35.6*/,
              bottom: screenHeight * 0.005, /*5*/
            ),
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.036, //15
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /* ********************* Starts User location Accessing ***************** */
                    // Container(
                    //   // height: screenHeight * 0.053, //40
                    //   // width: screenHeight * 0.053, //40
                    //   height: 35,
                    //   width: 35,
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: AppColor.iconColor,
                    //   ),
                    //   child: IconButton(
                    //     onPressed: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const ShowLocationPage()),
                    //       ); // There is another page which is dedicated for map
                    //     },
                    //     icon: SvgPicture.asset(
                    //       "asset/icons/location.svg",
                    //       // color: Colors.black,
                    //       theme: const SvgTheme(currentColor: Colors.black),
                    //       height: 20,
                    //       width: 20,
                    //     ),
                    //   ),
                    // ),
                    /* ********************* Ends User location Accessing ***************** */

                    Padding(
                      padding:
                          EdgeInsets.only(left: screenWidth * 0.036 /*15*/),
                      child: SizedBox(
                        width: 260,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const BigText(
                                  text: "HOME",
                                  fontSize: 16,
                                  fontFamilyName: "Inter",
                                  fontWeightName: FontWeight.w900,
                                ),
                            InkWell(
                              onTap: (){
                                showModalBottomSheet(context: context, builder: (ctx)=>Container(child: Center(child: Text("show modal bottom"),),));
                              },
                              child: SvgPicture.asset(
                                        "asset/icons/arrow_downward.svg",
                                    ),
                            ),
                                // ),
                              ],
                            ),

                            /* ************ Getting User location and showing on the screen STARTS here ********* */
                            /* ****** If user location is null show progress indicator ***** */
                            Row(
                              children: [
                                SvgPicture.asset(
                                    "asset/icons/Vector.svg",
                                    // alignment: Alignment.bottomLeft,
                                    // color: Colors.black,
                                    theme: const SvgTheme(currentColor: Colors.black),
                                    height: 11,
                                    width: 7,
                                  ),
                                const SizedBox(width: 10,),
                                _areaName!.isEmpty
                                    ? const Row(
                                        children: [
                                          SmallText(
                                            text: "Fetching location...",
                                            fontSize: 10,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: CircularProgressIndicator(
                                              color: AppColor.quoteColor,
                                              strokeWidth: 2,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        _areaName!,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.mainBlackColor,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                              ],
                            ),
                            /* ************ Getting User location and showing on the screen ENDS here ********* */
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.bottomCenter,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const NotificationScreen()));
                  },
                  icon: SvgPicture.asset(
                    "asset/icons/bell.svg",
                    height: 26,
                  ),
                ),
              ],
            ),
          ),
          /* ***************** Ends location and Notification ************ */

          /* *********** Starts Body of Home Page ****************** */
          const Expanded(
            child: SingleChildScrollView(
              // controller: ,
              child: HomePageBody(),
            ),
          ),

          // Expanded(child: SingleChildScrollView(child: _currentWidget.elementAt(_selectedIndex))),
          /* *********** Ends Body of Home Page ******************* */
        ],
      ),
    );
*/

// Previous location icon and Formatted Address
/*
/* ********************* Starts User location Accessing ***************** */

          // Container(
          //   // height: screenHeight * 0.053, //40
          //   // width: screenHeight * 0.053, //40
          //   height: 35,
          //   width: 35,
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: AppColor.iconColor,
          //   ),
          //   child: IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const ShowLocationPage()),
          //       ); // There is another page which is dedicated for map
          //     },
          //     icon: SvgPicture.asset(
          //       "asset/icons/location.svg",
          //       // color: Colors.black,
          //       theme: const SvgTheme(currentColor: Colors.black),
          //       height: 20,
          //       width: 20,
          //     ),
          //   ),
          // ),
    /* ********************* Ends User location Accessing ***************** */
*/