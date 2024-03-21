import 'package:calma/pages/Appointments/Appointment_Status/upcoming_booking.dart';
import 'package:calma/pages/Appointments/Appointment_Status/cancel_services.dart';
import 'package:calma/pages/Appointments/Appointment_Status/completed_services.dart';
import 'package:calma/pages/Profile/account_info.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    /* ******************Ends Removing shadow above the AppBar****************** */
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          /* **************Starts Back Arrow Button************** */
          BackArrowButtonWithPositioned(
            onPress: () {
              Navigator.pop(context);
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
                // width: double.maxFinite,
                // height: 670,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    BookedServices(),
                    CompletedServices(),
                    CancelServices(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  tabControllerText(String text, double screenHeight) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: "Inter",
          fontSize: screenHeight * 0.0202, //18
          fontWeight: FontWeight.w600),
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
