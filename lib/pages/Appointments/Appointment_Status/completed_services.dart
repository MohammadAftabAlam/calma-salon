import 'package:flutter/material.dart';

import 'package:calma/Data/booking_services_data.dart';
import 'package:calma/Model/booking_services_model.dart';
import 'package:calma/widgets/tab_services_trait.dart';

class CompletedServicesScreen extends StatefulWidget {
  const CompletedServicesScreen({super.key});

  @override
  State<CompletedServicesScreen> createState() =>
      _CompletedServicesScreenState();
}

class _CompletedServicesScreenState extends State<CompletedServicesScreen> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<MyBookingServicesModel> completedServices = completedServicesData;

    return ListView.builder(
        itemCount: completedServices.length,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.0413, //17
          vertical: screenHeight * 0.0169, //24
        ),
        itemBuilder: (context, index) {
          return TabServicesTrait(
            isCancelTab: true,
            servicesModel: completedServices[index],
          );
        });
  }
}

/// Listview for Card Widget
/*ListView.builder(
        itemCount: completedServices.length,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.0413, //17
          vertical: screenHeight * 0.0169, //24
        ),
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xffF5EDEN),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.0295,
                  vertical: screenHeight * 0.0056), //12, //5
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Date & Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${completedServices[index].date} - ${completedServices[index].time}",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.0202, //18
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.0382, //34
                        width: screenWidth * 0.08263, //34
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
                    ],
                  ),
                  divider(),

                  /* ****************************** Container for showing salon image name and booking id STARTS here  ************************************* */
                  Row(
                    children: [
                      /// Salon Image
                      Container(
                        height: screenHeight * 0.1404, //125,
                        width: screenWidth * 0.304, //125,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.0148),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage(completedServices[index].salonImage),
                          ),
                        ),
                      ),

                      //Expanded Widget is used here for acquiring the rest width of the Row in Container
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Salon Name
                              BigText(
                                fontWeightName: FontWeight.w500,
                                color: AppColor.mainBlackColor,
                                text: completedServices[index].salonName,
                                fontSize: screenHeight * 0.018,
                              ),
                              /// Location
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  /// Location Icon
                                  Icon(
                                    Iconsax.location5,
                                    color: AppColor.iconColor,
                                    size: screenHeight * 0.0202,
                                  ),

                                  SizedBox(
                                    width: screenWidth * 0.0244,
                                  ),

                                  /// Location Text
                                  SmallText(
                                    text: completedServices[index].salonLocation,
                                    fontSize: screenHeight * 0.018, //16
                                    fontWeightName: FontWeight.w400,
                                    fontFamilyName: 'Inter',
                                  )
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.0056,), //5
                              /// Booking Id
                              Row(
                                children: [
                                  /// Booking Id Icon
                                  Icon(
                                    Iconsax.check5,
                                    color: AppColor.iconColor,
                                    size: screenHeight * 0.0202,
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.0244,
                                  ),
                                  /// Booking Id
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
                              SizedBox(height: screenHeight * 0.0056,), //5

                              /// Direction Button
                              ElevatedButton.icon(
                                onPressed: () {},
                                label: const Text("\t\t Direction", style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.w500,fontSize: 14, ),),
                                icon: const Icon(
                                  Iconsax.route_square5,
                                  color: AppColor.textColor2,
                                ),
                                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffE5E7EB),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11),),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  /* ****************************** Container for showing salon image name and booking id ENDS here  ************************************* */

                  divider(),
                  /* ****************************** Rebook & Add Review STARTS here  ************************************* */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppointmentPageButtonAll(
                        onPress: () {
                          Navigator.pushNamed(context, '/salon-search-page');
                        },
                        text: "Rebook",
                        textColor: const Color(0xff1C2A3A),
                        buttonColor: const Color(0xffE5E7EB),
                      ),
                      SizedBox(
                        width: screenWidth * 0.0486,
                      ),
                      AppointmentPageButtonAll(
                        onPress: () {},
                        text: "Add Review",
                      ),
                    ],
                  ),
                  /* ****************************** Rebook & Add Review ENDS here  ************************************* */
                ],
              ),
            ),
          );
        });*/

/// Previous working code
/* Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
        // shrinkWrap: true,
        itemCount: 1,
        padding:  EdgeInsets.symmetric( horizontal: screenWidth * 0.0413, //17
          vertical: screenHeight * 0.0169, //24
        ),
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xffF5EDEN),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth *0.0295,vertical: screenHeight * 0.0135),   //12
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///This row is responsible for showing the data&time of booking and favourite
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "June 14, 2023 - 15.00pm",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.0202, //18
                        ),
                      ),
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
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("asset/images/salonRoom.jpg"),
                          ),
                        ),
                      ),

                      /* ************** This widget denotes the Salon Name and their booking status i.e..(Booked,Pending,Cancelled)************** */
                      //Expanded Widget is used here for acquiring the rest width of the Row in Container
                      Expanded(
                        child: SizedBox(
                          height: screenHeight * 0.1481,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  fontWeightName: FontWeight.w500,
                                  color: AppColor.mainBlackColor,
                                  text: "Varsha Saloon",
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
                                      text: "Jogabai Extension",
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
                          Navigator.pushNamed(context, '/salon-search-page');
                        },
                        text: "Rebook",
                        textColor: const Color(0xff1C2A3A),
                        buttonColor: const Color(0xffE5E7EB),
                      ),
                      SizedBox(
                        width: screenWidth * 0.0486,
                      ),
                      AppointmentPageButtonAll(
                        onPress: () {},
                        text: "Add Review",
                      ),
                    ],
                  ),
                  /* ****************************** Button for Cancel and Reschedule ENDS here  ************************************* */

                ],
              ),
            ),
          );
        });
  }*/
