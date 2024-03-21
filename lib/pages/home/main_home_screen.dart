import 'dart:convert';

import 'package:calma/pages/Appointments/main_appointment_pg.dart';
import 'package:calma/pages/Profile/location_screen.dart';
import 'package:calma/pages/Profile/profile_manager.dart';
import 'package:calma/pages/home/home_page_body.dart';
import 'package:calma/pages/home/search_page.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _selectedIndex = 0;

  // static const List<Widget> _currentWidget = <Widget>[
  //   HomePageBody(),
  //   // SearchPage(),
  //   Appointments(),
  //   ProfileManager(),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // int currentPageIndex = 0;
  // NavigationDestinationLabelBehavior labelBehavior =
  //     NavigationDestinationLabelBehavior.alwaysShow;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkLocationPermission();
  }
  /*Asking user current location STARTS here*/

  final apiKey = 'PLACE_YOUR_GOOGLE_MAP_API_KEY_HERE';
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

    debugPrint(_areaName);
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* ***************** Starts Location and Notification ************ */
          Container(
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
                    /* ********************* Starts User Location Accessing ***************** */
                    Container(
                      // height: screenHeight * 0.053, //40
                      // width: screenHeight * 0.053, //40
                      height: 35,
                      width: 35,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.iconColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShowLocationPage()),
                          ); // There is another page which is dedicated for map
                        },
                        icon: SvgPicture.asset(
                          "asset/icons/location.svg",
                          // color: Colors.black,
                          colorFilter: const ColorFilter.mode(
                              Colors.black, BlendMode.color),
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    /* ********************* Ends User Location Accessing ***************** */

                    Padding(
                      padding:
                          EdgeInsets.only(left: screenWidth * 0.036 /*15*/),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const BigText(
                                text: "HOME",
                                // fontSize: screenHeight * 0.027, //24
                                fontWeightName: FontWeight.w900,
                              ),
                              SvgPicture.asset(
                                  "asset/icons/arrow_downward.svg"),
                            ],
                          ),
                          SmallText(
                            text: _areaName!,
                            // text: _areaName!.isEmpty ?  "Khushi My Love" : _areaName!,
                            // text: "Batla House, New Delhi",
                            fontSize: 6, //16,
                            // fontSize: screenHeight * 0.0178, //16,
                            fontWeightName: FontWeight.w500,
                            color: AppColor.mainBlackColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.bottomCenter,
                  onPressed: () {},
                  // icon: Icon(Icons.notifications,
                  //     size: screenHeight * 0.043,  //38,
                  //     color: const Color(0xff648684),
                  // ),
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

      /* *********** Starts  BottomNavigation Bar****************** */
      bottomNavigationBar: Container(
        // height: screenHeight * 0.079, //70,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(screenHeight * 0.0337 /*30*/),
            topLeft: Radius.circular(screenHeight * 0.0337 /*30*/),
          ),
          color: const Color(0xffEFDDDB),
          // color: Colors.red
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigationIcon(
              onPress: () {},
              pic: SvgPicture.asset("asset/icons/home-icon.svg"),
              text: "Home",
            ),
            BottomNavigationIcon(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              pic: SvgPicture.asset("asset/icons/search-icon.svg"),
              text: "Search",
            ),
            BottomNavigationIcon(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Appointments()));
              },
              pic: SvgPicture.asset("asset/icons/appointment-icon.svg"),
              text: "Appointments",
            ),
            BottomNavigationIcon(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileManager()));
              },
              pic: SvgPicture.asset(
                "asset/icons/userAvatar.svg",
                height: 30,
                width: 24,
              ),
              text: "Profile",
            ),
          ],
        ),
      ),
      /* *********** Ends BottomNavigation Bar****************** */
    );
  }
}

/* ****************************Starts BottomNavigationIcon Widget Creation ************************************ */
class BottomNavigationIcon extends StatelessWidget {
  // final IconData iconData;
  final SvgPicture pic;
  final VoidCallback onPress;
  final String text;
  const BottomNavigationIcon({
    super.key,
    required this.onPress,
    required this.pic,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // IconButton(
          //   onPressed: onPress,
          //   iconSize: 20, //30,
          //   // icon: Icon(iconData),
          //   icon: pic,
          //   hoverColor: Colors.teal,
          // ),
          pic,
          SmallText(text: text)
          // Text(text)
        ],
      ),
    );
  }
}
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
            label: "Appointments"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
*/
