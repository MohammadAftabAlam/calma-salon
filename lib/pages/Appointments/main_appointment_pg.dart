import 'package:calma/pages/Appointments/Appointment%20Status/booked_services.dart';
import 'package:calma/pages/Appointments/Appointment%20Status/cancel_services.dart';
import 'package:calma/pages/Appointments/Appointment%20Status/completed_services.dart';
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
          const Positioned(
            top: 62,
            left: 123,
            child: TitleText(text: "My Bookings"),
          ),

          /* **************Ends Back Arrow Button************** */
          Column(
            children: [
              /* ************************Starts White Container with TextButton **************** */
              Container(
                margin: const EdgeInsets.only(
                  top: 110,
                ),
                height: 46,
                width: 380,
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(12),
                // ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: AppColor.textColor,
                  unselectedLabelColor: const Color(0xff000000),
                  tabs: const [
                    Tab(
                      child: TabControllerText(text: "Booked"),
                    ),
                    Tab(
                      child: TabControllerText(text: "Completed"),
                    ),
                    Tab(
                      child: TabControllerText(text: "Cancelled"),
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
}

class TabControllerText extends StatelessWidget {
  final String text;
  const TabControllerText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: "Inter",
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
    );
  }
}

