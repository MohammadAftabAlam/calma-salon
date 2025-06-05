import 'package:flutter/material.dart';

import 'package:calma/widgets/tab_indicator_trait.dart';
import 'package:calma/screens/Appointments/Appointment_Status/upcoming_booking.dart';
import 'package:calma/screens/Appointments/Appointment_Status/cancel_services.dart';
import 'package:calma/screens/Appointments/Appointment_Status/completed_services.dart';
import 'package:calma/utils/colors.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

/* (with SingleTickerProviderStateMixin) is required for (vsync: this)
    which is used in TabController Otherwise it will throw error */

class _AppointmentsState extends State<Appointments>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    //This tabController has created for creating Custom TabBar(Without using AppBar & DefaultTabController)
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /* ******************Starts Removing shadow above the AppBar****************** */
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));
    /* ******************Ends Removing shadow above the AppBar****************** */
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    // print(ModalRoute.of(context)?.settings.arguments);

    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    // final Map<String, String>? args= ModalRoute.of(context)?.settings.arguments as Map<String,String>;
    //
    // String? date = args?['date'];
    // // String? date = args['date'];
    // String? time = args?['time'];
    // String? date1, time1;
    // final args = ModalRoute.of(context)!.settings.arguments;
    // date1 = args!.date;
    // time1 = args.time;

    return SizedBox(
      height: screenHeight,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // centerTitle: true,
          // backgroundColor: Colors.white,
          title: const Text(
            "My Bookings",
            // style: TextStyle(
            //   fontSize: 22,
            //   color: Color(0xff374151),
            //   fontFamily: "Inter",
            //   fontWeight: FontWeight.w600,
            // ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* ************************Starts White Container with TextButton **************** */
            SizedBox(
              // margin: EdgeInsets.only(
              //   top: screenHeight * 0.1235, //110,
              // ),
              // height: screenHeight * 0.0516, //46,
              width: screenWidth * 0.9236, //380,
              child: TabBar(
                controller: _tabController,
                labelColor: AppColor.textColor,
                unselectedLabelColor: const Color(0xff000000),
                indicator: CustomTabIndicator(radius: 20),
                indicatorColor: const Color(0xff1C2A3A),
                tabs: [
                  Tab(
                    child: tabControllerText("Upcoming", screenHeight),
                  ),
                  Tab(
                    child: tabControllerText("Completed", screenHeight),
                  ),
                  Tab(
                    child: tabControllerText("Cancelled", screenHeight),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  UpcomingServicesScreen(),
                  CompletedServicesScreen(),
                  CancelServicesScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  tabControllerText(String text, double screenHeight) {
    return Text(
      text,
      style: const TextStyle(
        // color: Colors.white,
        fontFamily: "Inter",
        fontSize: 16, //18
        // fontSize: screenHeight * 0.019, //18
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

/* Created for tab controller text but not used */
// class TabControllerText extends StatelessWidget {
//   final String text;
//   const TabControllerText({super.key, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontFamily: "Inter",
//         fontSize: 18,
//         fontWeight: FontWeight.w600
//       ),
//     );
//   }
// }

// working scaffold
/* Scaffold(
      // backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          /* **************Starts Back Arrow Button************** */
          BackArrowButtonWithPositioned(
            onPress: () {
              Navigator.pushNamed(context, MainHomeScreen.route);
            },
          ),
          Positioned(
            top: screenHeight * 0.0696, //62,
            left: screenWidth * 0.3403, //140,
            child: const TitleText(text: "My Bookings"),
          ),

          /* **************Ends Back Arrow Button************** */
          Column(
            children: [
              /* ************************Starts White Container with TextButton **************** */
              Container(
                margin: EdgeInsets.only(
                  top: screenHeight * 0.1235, //110,
                ),
                height: screenHeight * 0.0516, //46,
                width: screenWidth * 0.9236, //380,
                child: TabBar(
                  controller: _tabController,
                  labelColor: AppColor.textColor,
                  unselectedLabelColor: const Color(0xff000000),
                  tabs: [
                    Tab(
                      child: tabControllerText("Upcoming", screenHeight),
                    ),
                    Tab(
                      child: tabControllerText("Completed", screenHeight),
                    ),
                    Tab(
                      child: tabControllerText("Cancelled", screenHeight),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children:  const [
                    UpcomingServices(),
                    // UpcomingServices(time: time!,date: date!,),
                    CompletedServices(),
                    CancelServices(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );*/

//New Scaffold Widget
/*SizedBox(
      height: screenHeight,
      // width: screenWidth,
      child: CustomScrollView(
        // physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            // expandedHeight: screenHeight * 0.35,
            pinned: true,
            backgroundColor: AppColor.imageBgColor,
            automaticallyImplyLeading: false,
            // toolbarHeight: screenHeight * 0.056,
            toolbarHeight: 90,

            title: Padding(
              padding: const EdgeInsets.only(top: 55, bottom: 30),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.lightGreenAccent,
                // labelColor: AppColor.textColor,
                unselectedLabelColor: Colors.white,
                tabs: [
                  Tab(
                    child: tabControllerText("Upcoming", screenHeight),
                  ),
                  Tab(
                    child: tabControllerText("Completed", screenHeight),
                  ),
                  Tab(
                    child: tabControllerText("Cancelled", screenHeight),
                  ),
                ],
              ),
            ),

            flexibleSpace: Padding(
              padding:  EdgeInsets.only(top: 35, left: screenWidth/3.5),
              child: FlexibleSpaceBar(centerTitle: true, background: TitleText(text: "My Bookings"),),
            ),

          ),

          SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 1, (context, index) {
              return SizedBox(
                height: screenHeight,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    UpcomingServices(),
                    CompletedServicesScreen(),
                    CancelServices(),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );*/
