import 'package:calma/pages/Appointments/Appointment%20Process/salon_search_show_pg.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/Icon_and_text_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../ButtonFunctions/cancel_button_pg.dart';
import 'booked_services.dart';

class CompletedServices extends StatefulWidget {
  const CompletedServices({super.key});

  @override
  State<CompletedServices> createState() => _CompletedServicesState();
}

class _CompletedServicesState extends State<CompletedServices> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // shrinkWrap: true,
        itemCount: 1,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 24 ),
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xffF5EDEC),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///This row is responsible for showing the data&time of booking and favourite
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
                          ),
                      )
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
                          child: Container(
                            // width: ,
                            height: 130,
                            // decoration: const BoxDecoration(
                            //     // color: AppColor.statusBookServiceColor,
                            //     // borderRadius: BorderRadius.only(
                            //     //   topRight: Radius.circular(12),
                            //     //   bottomRight: Radius.circular(12),
                            //     // ),
                            // ),
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

                  // Button(onPress: (){}, text: "Cancel")

                  divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppointmentPageButtonAll(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MainSalonShowPage()));
                        },
                        text: "Rebook",
                        textColor: const Color(0xff1C2A3A),
                        buttonColor: const Color(0xffE5E7EB),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      AppointmentPageButtonAll(
                        onPress: () {},
                        text: "Add Review",
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
  divider() {
    return const Divider(
      thickness: 1,
      color: Color(0xffD3CECD),
    );
  }
}
