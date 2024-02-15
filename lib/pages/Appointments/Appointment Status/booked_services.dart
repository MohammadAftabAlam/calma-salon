import 'package:calma/pages/Appointments/ButtonFunctions/cancel_button_pg.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BookedServices extends StatefulWidget {
  const BookedServices({super.key});

  @override
  State<BookedServices> createState() => _BookedServicesState();
}

class _BookedServicesState extends State<BookedServices> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
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
                    // height: 120,
                    // width: 350,
                    margin: const EdgeInsets.only(
                      // left: 20,
                      right: 20,
                      // top: 10,
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
        });
  }

  divider() {
    return const Divider(
      thickness: 1,
      color: Color(0xffD3CECD),
    );
  }
}



class AppointmentPageButtonAll extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color textColor, buttonColor;
  const AppointmentPageButtonAll(
      {super.key,
      required this.onPress,
      required this.text,
      this.textColor = Colors.white,
      this.buttonColor = AppColor.buttonBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 44,
          width: 147,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
              child: SmallText(
            text: text,
            color: textColor,
            fontWeightName: FontWeight.w700,
            fontFamilyName: "Inter",
          )),
        ),
      ),
    );
  }
}




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
