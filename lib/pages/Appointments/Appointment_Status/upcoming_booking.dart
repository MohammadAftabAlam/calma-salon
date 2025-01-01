import 'package:calma/Data/booking_services_data.dart';
import 'package:calma/Data/upcoming_appntmnt_data.dart';
import 'package:calma/Model/booking_services_model.dart';
import 'package:calma/pages/Appointments/ButtonFunctions/cancel_button_pg.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/tab_services_trait.dart';

class UpcomingServicesScreen extends StatefulWidget {
  const UpcomingServicesScreen({
    super.key,
  });

  @override
  State<UpcomingServicesScreen> createState() => _UpcomingServicesScreenState();
}

class _UpcomingServicesScreenState extends State<UpcomingServicesScreen> {
  bool isFavourite = false;
  String? date1, time1;

  // List upcomingDateAndTime = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    BookServices bookServices = BookServices();

    // final args = ModalRoute.of(context)!.settings.arguments;
    // var date;
    // date1 = args.date!;
    // time1 = args.time!;

    // int upcomingAppointment = 1;

    // UpcomingBookingData upcomingBookingData = UpcomingBookingData(date, time);
    List<MyBookingServicesModel> upcomingData = upcomingServiceData;
    Widget mainContent =  ListView.builder(
      // shrinkWrap: true,
      itemCount: upcomingData.length,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24 ),
      itemBuilder: (context, index) {
        return TabServicesTrait(
          isCancelTab: true,
          servicesModel: upcomingData[index],
        );
      },
    );
    return Scaffold(
        body: mainContent);
  }

  divider() {
    return const Divider(
      thickness: 1,
      color: Color(0xffD3CECD),
    );
  }
}



// class AppointmentsDateAndTime{
//   final args = ModalRoute.of(context)!.settings.arguments as UpcomingBookingData;
//   List appointmentsDateAndTime = [
//     {
//
//     },
//   ];
// }

/*Widget build(BuildContext context) {
    return ListView.builder(
        // shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24 ),
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xffF5EDEC),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "June 14, 2023 - 15.00pm",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      Container(
                          height: 34,
                          width: 34,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavourite = !isFavourite;
                              });
                            },
                            child: Icon(
                              isFavourite ? Iconsax.heart5 : Iconsax.heart,
                              color:
                              isFavourite ? Colors.red : Colors.black,
                            ),
                          ))
                    ],
                  ),
                  divider(),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 132,
                          width: 132,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                              AssetImage("asset/images/salonRoom.jpg"),
                            ),
                          ),
                        ),

                        /* ************** This widget denotes the Salon Name and their booking status i.e..(Booked,Pending,Cancelled)************** */
                        //Expanded Widget is used here for acquiring the rest width of the Row in Container
                        Expanded(
                          child: SizedBox(
                            height: 130,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  const BigText(
                                      fontWeightName: FontWeight.w500,
                                      color: AppColor.mainBlackColor,
                                      text: "Varsha Saloon"),
                                  const Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Iconsax.location5,
                                        color: AppColor.iconColor,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SmallText(
                                        text: "Jogabai Extension",
                                        fontSize: 16,
                                        fontWeightName: FontWeight.w400,
                                        fontFamilyName: 'Inter',
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Iconsax.check5,
                                        color: AppColor.iconColor,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      RichText(
                                        text: const TextSpan(children: [
                                          TextSpan(
                                              text: "Booking Id  ",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          TextSpan(
                                              text: "#AFAY63259",
                                              style: TextStyle(
                                                  color: AppColor.textColor,
                                                  fontWeight:
                                                  FontWeight.w400)),
                                        ]),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  divider(),
                  // Button(onPress: (){}, text: "Cancel")

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppointmentPageButtonAll(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CancelButtonPage()));
                        },
                        text: "Cancel",
                        textColor: const Color(0xff1C2A3A),
                        buttonColor: const Color(0xffE5E7EB),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      AppointmentPageButtonAll(
                        onPress: () {},
                        text: "Reschedule",
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
    );
  }*/

/*import 'package:calma/pages/Appointments/ButtonFunctions/cancel_button_pg.dart';
import 'package:calma/utils/button_serices_status.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/Icon_and_text_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:flutter/material.dart';

class BookedServices extends StatefulWidget {
  const BookedServices({super.key});

  @override
  State<BookedServices> createState() => _BookedServicesState();
}

class _BookedServicesState extends State<BookedServices> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index){
          return Container(
            // height: 120,
            // width: 350,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Row(
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("asset/images/salonRoom.jpg"),
                    ),
                  ),
                ),

                /* ************** This widget denotes the Salon Name and their booking status i.e..(Booked,Pending,Cancelled)************** */
                //Expanded Widget is used here for acquiring the rest width of the Row in Container
                Expanded(
                  child: Container(
                    // width: ,
                    height: 130,
                    decoration: const BoxDecoration(
                        color: AppColor.statusBookServiceColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BigText(
                              fontWeightName: FontWeight.w500,
                              color: AppColor.mainBlackColor,
                              text: "Varsha Saloon"),
                          Row(
                            children: [
                              const IconAndTextButton(
                                iconData: Icons.calendar_month_rounded,
                                text: "12/12/23",
                                iconColor: AppColor.iconColor,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ButtonServiceStatus(
                                  onPress: () {
                                    // SnackBar(String? message){
                                    //   ScaffoldMessenger.of(context).showSnackBar(message)
                                    // }
                                  },
                                  height: 35,
                                  text: "Cancel  ",
                                  iconData: Icons.calendar_today_sharp,
                                  iconColor: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              children: [
                                const IconAndTextButton(
                                  iconData: Icons.watch_later_outlined,
                                  text: "3:00 pm",
                                  iconColor: AppColor.iconColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: ButtonServiceStatus(
                                    onPress: () {},
                                    height: 35,
                                    text: "Call now",
                                    iconData: Icons.call,
                                    iconColor: const Color(0xff1C274C),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),

        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CancelButtonPage()));
        }, child: Text("Cancel"))
      ],
    );

  }
}
*/

//Previous working code
/*  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    BookServices bookServices = BookServices();

  final args = ModalRoute.of(context)!.settings.arguments;
  // var date;
  // date1 = args.date!;
  // time1 = args.time!;

    // int upcomingAppointment = 1;

    // UpcomingBookingData upcomingBookingData = UpcomingBookingData(date, time);
    return ListView.builder(
      // shrinkWrap: true,
      itemCount: bookServices.bookServicesData.length,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.0413,
        vertical: screenHeight * 0.0169,
      ),
      itemBuilder: (context, index) {
        if(bookServices.bookServicesData.isNotEmpty){
          return Card(
            color: const Color(0xffF5EDEC),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth *0.0295,vertical: screenHeight * 0.0135),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // "June 14, 2023 - 15.00pm",
                        "${bookServices.bookServicesData[index].date} -${bookServices.bookServicesData[index].time}",
                        // "$date1 - $time1",
                        // "${widget.date} - ${widget.time}",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.0202,  //18
                        ),
                      ),
                      /* *************************** Favourite Heart Button STARTS here************************ */
                      Container(
                        height: screenHeight * 0.0382, //34
                        width: screenWidth * 0.08263,  //34
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                          child: Icon(
                            isFavourite ? Iconsax.heart5 : Iconsax.heart,
                            color: isFavourite ? Colors.red : Colors.black,
                            size: screenHeight * 0.0269, //24
                          ),
                        ),
                      ),
                      /* *************************** Favourite Heart Button ENDS here************************ */

                    ],
                  ),
                  divider(),
                  /* ****************************** Container for showing salon image name and booking id STARTS here  ************************************* */
                  Row(
                    children: [
                      Container(
                        height: screenHeight * 0.1481,
                        width: screenWidth * 0.3,  //125
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenHeight * 0.0148),
                          image:  DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(bookServices.bookServicesData[index].salonImage),
                            // image: AssetImage("asset/images/salonRoom.jpg"),
                          ),
                        ),
                      ),

                      /* ************** This widget denotes the Salon Name and their booking status i.e..(Booked,Pending,Cancelled)************** */
                      //Expanded Widget is used here for acquiring the rest width of the Row in Container
                      Expanded(
                        child: SizedBox(
                          height: screenHeight * 0.1481,
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.0243/*10*/),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  fontWeightName: FontWeight.w500,
                                  color: AppColor.mainBlackColor,
                                  text: bookServices.bookServicesData[index].name,
                                  // text: "Varsha Saloon",
                                  fontSize: screenHeight * 0.018,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Iconsax.location5,
                                      color: AppColor.iconColor,
                                      size: screenHeight * 0.0202,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.0244,
                                    ),
                                    SmallText(
                                      text: bookServices.bookServicesData[index].location,
                                      // text: "Jogabai Extension",
                                      fontSize: screenHeight * 0.018, //16
                                      fontWeightName: FontWeight.w400,
                                      fontFamilyName: 'Inter',
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Iconsax.check5,
                                      color: AppColor.iconColor,
                                      size: screenHeight * 0.0202,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.0244,
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: "Booking Id  ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight * 0.018, //16
                                          ),
                                        ),
                                        TextSpan(
                                          text: "#AFAY63259",
                                          style: TextStyle(
                                            color: AppColor.textColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: screenHeight * 0.018, //16
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  /* ****************************** Container for showing salon image name and booking id ENDS here  ************************************* */

                  divider(),
                  /* ****************************** Button for Cancel and Reschedule STARTS here  ************************************* */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppointmentPageButtonAll(
                        onPress: () {
                          Navigator.pushNamed(context, '/cancel-button');
                        },
                        text: "Cancel",
                        textColor: const Color(0xff1C2A3A),
                        buttonColor: const Color(0xffE5E7EB),
                      ),
                      SizedBox(
                        width: screenWidth * 0.0486,
                      ),
                      AppointmentPageButtonAll(
                        onPress: () {
                          Navigator.pushNamed(context, '/booking-date-time');
                        },
                        text: "Reschedule",
                      ),
                    ],
                  ),
                  /* ****************************** Button for Cancel and Reschedule ENDS here  ************************************* */

                ],
              ),
            ),
          );
        }else{
          return const Center(child: BigText(text: "No upcoming appointments "));
        }
      },
    );
  }*/
