import 'package:calma/pages/Appointments/main_appointment_pg.dart';
import 'package:calma/pages/Location/map_page.dart';
import 'package:calma/pages/Profile/profile_manager.dart';
import 'package:calma/pages/home/home_page_body.dart';
import 'package:calma/pages/home/search_page.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _selectedIndex = 0;

  static const List<Widget> _currentWidget = <Widget>[
    HomePageBody(),
    // SearchPage(),
    Appointments(),
    ProfileManager(),
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /* ***************** Starts Location and Notification ************ */
          Container(
            margin: EdgeInsets.only(
                top: screenHeight * 0.045 /*40*/, bottom: screenHeight * 0.011,/*10*/),
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036, //15
              ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /* ********************* Starts User Location Accessing ***************** */
                    Container(
                      height: screenHeight * 0.053, //40
                      width: screenHeight * 0.053, //40
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.iconColor,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MapPage()));    // There is another page which is dedicated for map
                        },
                        icon: const Icon(Icons.location_on_outlined,color: Colors.black,),
                      ),
                    ),
                    /* ********************* Ends User Location Accessing ***************** */

                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.036 /*15*/),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Home",
                                fontSize: screenHeight * 0.027,//24
                                fontWeightName: FontWeight.w900,
                              ),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                          SmallText(
                            text: "Batla House, New Delhi",
                            fontSize: screenHeight * 0.0178, //16,
                            color: AppColor.mainBlackColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications,
                      size: screenHeight * 0.043,  //38,
                      color: const Color(0xff648684),
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
        height: screenHeight * 0.079,//70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(screenHeight * 0.05 /*45*/),
            topLeft: Radius.circular(screenHeight * 0.05 /*45*/),
          ),
          color: const Color(0xffEFDDDB),
          // color: Colors.red
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigationIcon(
                onPress: () {}, iconData: Icons.home, text: "Home",
            ),
            BottomNavigationIcon(
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  SearchPage()));
              },
              iconData: Icons.search_outlined,
              text: "Search",
            ),
            BottomNavigationIcon(
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Appointments()));
                },
                iconData: Icons.calendar_month,
                text: "Appointments",
            ),
            BottomNavigationIcon(
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileManager()));
                },
                iconData: Icons.person,
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
class BottomNavigationIcon extends StatelessWidget{
  final IconData iconData;
  final VoidCallback onPress;
  final String text;
  const BottomNavigationIcon(
      {super.key,
        required this.onPress,
        required this.iconData,
        required this.text,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPress,
          iconSize: 30, //30,
          icon: Icon(iconData),
          hoverColor: Colors.teal,
        ),
        SmallText(text: text)
        // Text(text)
      ],
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
