import 'package:calma/pages/Appointments/Appointment%20Process/booking_user_details.dart';
import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/Icon_and_text_button.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/favourites.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';


class MainSalonShowPage extends StatefulWidget {
  const MainSalonShowPage({super.key});

  @override
  State<MainSalonShowPage> createState() => _MainSalonShowPageState();
}

class _MainSalonShowPageState extends State<MainSalonShowPage> {
  List<Service> services = [
    Service(name: 'Hair Spa', price: 240),
    Service(name: 'Hair Cut', price: 60),
    Service(name: 'Facial', price: 562),
    Service(name: 'Detan', price: 23),
    Service(name: 'Bride Makeup', price: 90),
    Service(name: 'Threading', price: 60),
  ];

  Set<Service> selectedServices = <Service>{};
  List<bool> selectedStateList = List<bool>.generate(6, (index) => false);
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,

      body: CustomScrollView(
        slivers: [
          /// SliverAppBar is used here for scrolling purpose
          SliverAppBar(
            expandedHeight: 310,
            backgroundColor: AppColor.imageBgColor,
            automaticallyImplyLeading: false,
            toolbarHeight: 50,

           /// Actions button such as BackArrow and Favourite button STARTS here
           title: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               BackArrowButton(onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));}),
               Favourites(isFavourite: isFavourite,height: 41,),
             ],
           ),
            /// Actions button such as BackArrow and Favourite button ENDS here

            flexibleSpace: const FlexibleSpaceBar(
              background:  Image(image: AssetImage("asset/images/varsha_salon.png"),fit: BoxFit.cover),
            ),
            pinned: true,

            /// Upper CURVED portion STARTS here
            bottom: PreferredSize(
              preferredSize:const Size.fromHeight(70),
              child:Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(bottom: 0, top: 10),
                decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: AppColor.mainBackgroundColor,
                ),

                /// Upper CURVED portion Salon name, location and rating STARTS here
                child: ListTile(
                  title: const BigText(text:"Varsha Salon"),
                  subtitle: const SmallText(text:"Jogabai Extension"),
                  trailing:  Container(
                            margin: const EdgeInsets.only( right: 20),
                            padding: const EdgeInsets.only(left: 5),
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(23),
                              color: AppColor.statusButtonColor,
                            ),
                            child: const IconAndTextButton(
                              text: '4.0',
                              iconData: Icons.star,
                              iconColor: Colors.yellow,
                            ),
                  ),
                ),
                /// Upper CURVED portion Salon name, location and rating ENDS here
              ),
              ),
            /// Upper CURVED portion ENDS here
            ),
          ///SliverAppBar Ends here
          ///
          /// SliverList for rest of the body of the page STARTS here
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context,index){

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[

                            /// Row belongs to the Icon list
                            /// Icon List STARTS here
                            const Row(
                              children: [
                                MainSalonShowPageIcon(
                                  iconData: Icons.task_outlined,
                                  smallText: "Years",
                                  bigText: "3+",
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                MainSalonShowPageIcon(
                                  iconData: Icons.star,
                                  iconColor: Colors.yellow,
                                  smallText: "Rating",
                                  bigText: "4",
                                ),

                                SizedBox(
                                  width: 30,
                                ),

                                MainSalonShowPageIcon(
                                  iconData: Icons.message,
                                  smallText: "Reviews",
                                  bigText: "90+",
                                ),

                                SizedBox(
                                  width: 30,
                                ),

                                MainSalonShowPageIcon(
                                  iconData: Icons.location_on_outlined,
                                  smallText: "Kilometres",
                                  bigText: "4.9",
                                ),
                              ],
                            ),
                            /// Icon List ENDS here

                            const SizedBox(
                              height: 15,
                            ),
                            const BigText(text: "About",color: AppColor.appointmentTextColor,),
                            const SizedBox(
                              height: 90,
                              width: 370,
                              child: SmallText(
                                text:
                                "Varsha is handled by two its salon artists Vivek and Arif. It is a famouly known salon in jogabai extension for its best services at",
                              ),
                            ),
                            const BigText(text: "Working Time",color: AppColor.appointmentTextColor,),
                            const SmallText(text: "Monday-Friday, 8:00 AM to 10:00 PM"),
                            const BigText(text: "Reviews",color: AppColor.appointmentTextColor,),


                            const Divider(thickness: 1,color: AppColor.dividerColor,),

                            Column(
                              children: [
                                ListTile(
                                  leading: const CircleAvatar(
                                    backgroundImage: AssetImage("asset/images/fbLogo.png"),
                                  ),
                                  title:const SmallText(text: "Facebook Logo",),
                                  subtitle: Wrap(
                                    children: List.generate(5, (index) => const Icon(Icons.star, size: 12,color: Colors.yellowAccent,)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 80,
                                  width: 370,
                                  child: Text("Varsha is handled by two its salon artists Vivek and Arif. It is a famouly known salon in jogabai extension for its best services at",
                                  ),
                                ),
                              ],
                            ),
                            const BigText(text: "Address",color: AppColor.appointmentTextColor,),

                            const Divider(thickness: 1,color: AppColor.dividerColor,),
                            const ListTile(leading: Icon(Icons.location_on),
                            title: SmallText(text: "Community Centre 14, Block-A, New Friends Colony, New Delhi, Delhi -110025"),
                            ),
                            AppointmentBookAndPriceButton(
                              onPress: () {
                                _showServiceSelection(context);
                              },
                              text: "See price List",
                              color: const Color(0xffFFFFFF),
                              textColor: AppColor.iconColor,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
          /// SliverList for rest of the body of the page ENDS here
          ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppointmentBookAndPriceButton(
            onPress: () {
          // _showBookedStatusDialog();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookDetailsUser()));
        }, text: "Book Appointment"),
      ),
    );
  }

  void _showServiceSelection(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: SmallText(
            text: "Price List",
          )),
          content: Container(
            width: 370,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22), color: Colors.teal),
            child: ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                Service service = services[index];
                return ListTile(
                  // title: Text('${service.name} ..........................................${service.price}'),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        service.name,
                        // services[index].name,
                        textAlign: TextAlign.start,
                      ),
                      Text("-----"),
                    ],
                  ),
                  trailing: Text('${service.price}'),
                  // leading: Checkbox(
                  //   tristate: true,
                  //   value: selectedServices.contains(service),
                  //   onChanged: (bool? value) {
                  //     if (value != null) {
                  //       // Toggle the state of the checkbox when tapped
                  //       print("SetStateCalling!");
                  //       setState(() {
                  //         if (value) {
                  //           selectedServices.add(service);
                  //         } else {
                  //           selectedServices.remove(service);
                  //         }
                  //         print("Inside SetStateCalling! Last");
                  //
                  //       });
                  //     }
                  //   },
                  // ),

                  leading: InkWell(
                    onTap: () {
                        selectedStateList[index] = !selectedStateList[index];
                      setState(() {
                      });
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: selectedStateList[index]== false
                          ? null
                          : const Icon(
                        Icons.check,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Do something with the selected services
                print('Selected Services:');
                for (Service service in selectedServices) {
                  print('${service.name} - \$${service.price}');
                }
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Service {
  final String name;
  final int price;

  Service({required this.name, required this.price});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Service &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price;

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}

/* ****************** Starts 4 Icons ************************ */
class MainSalonShowPageIcon extends StatelessWidget {
  final IconData iconData;
  final String smallText;
  final String bigText;
  final Color iconColor;
  const MainSalonShowPageIcon(
      {super.key,
      required this.iconData,
      required this.smallText,
      required this.bigText,
      this.iconColor = AppColor.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 68,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xffF5F5FF)),
          child: Icon(
            iconData,
            color: iconColor,
            size: 38,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BigText(
          text: bigText,
          fontSize: 16,
        ),
        const SizedBox(
          height: 15,
        ),
        SmallText(
          text: smallText,
          fontSize: 12,
        ),
      ],
    );
  }
}
/* ****************** Ends 4 Icons ************************ */

/* ****************** Starts Two Buttons of the Page************************ */
class AppointmentBookAndPriceButton extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;

  const AppointmentBookAndPriceButton({
    super.key,
    required this.onPress,
    required this.text,
    this.color = AppColor.buttonBackgroundColor,
    this.fontSize = 32,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 63,
        width: 370,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: SmallText(
            textAlignName: TextAlign.center,
            text: text,
            color: textColor,
            fontWeightName: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

/* ****************** Ends Two Buttons of the Page************************ */

/*onChanged: (bool? value) {
                  setState(() {
                    if (value) {
                      selectedValues.add(option);
                    } else {
                      selectedValues.remove(option);
                    }
                  });
                },*/



/*Stack(
                children: [
                  // Positioned(
                  //   left: 0,
                  //   right: 0,
                  //   // top: 20,
                  //   // bottom: 20,
                  //   child: Container(
                  //     width: double.maxFinite,
                  //     height: /*Dimensions.height350*/ 350,
                  //     decoration: const BoxDecoration(
                  //       image: DecorationImage(
                  //         image: AssetImage("asset/images/varsha_salon.png"),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  BackArrowButton(onPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()));
                  }),
                  Positioned(
                    top: 330,
                    child: Container(
                      // margin: EdgeInsets.only(left: 25),
                      padding: EdgeInsets.only(left: 15, right: 10),
                      // height: 50,
                      width: 415,
                      decoration: const BoxDecoration(
                          color: AppColor.mainBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const BigText(text: "Varsha Saloon"),
                              Container(
                                  margin: const EdgeInsets.only(top: 10, right: 20),
                                  padding: const EdgeInsets.only(left: 5),
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(23),
                                    color: AppColor.statusButtonColor,
                                  ),
                                  child: const IconAndTextButton(
                                    text: '4.0',
                                    iconData: Icons.star,
                                    iconColor: Colors.yellow,
                                  ))
                            ],
                          ),
                          const SmallText(text: "Jogabai Extension"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  MainSalonShowPageIcon(
                                    iconData: Icons.task_outlined,
                                    smallText: "Years",
                                    bigText: "3+",
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  MainSalonShowPageIcon(
                                    iconData: Icons.star,
                                    iconColor: Colors.yellow,
                                    smallText: "Rating",
                                    bigText: "4",
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  MainSalonShowPageIcon(
                                    iconData: Icons.message,
                                    smallText: "Reviews",
                                    bigText: "90+",
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  MainSalonShowPageIcon(
                                    iconData: Icons.location_on_outlined,
                                    smallText: "Kilometres",
                                    bigText: "4.9",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const BigText(text: "About"),
                              Container(
                                height: 90,
                                width: 370,
                                child: SmallText(
                                  text:
                                  "Varsha is handled by two its salon artists Vivek and Arif. It is a famouly known salon in jogabai extension for its best services at",
                                ),
                              ),
                              PriceButton(
                                onPress: () {
                                  _showServiceSelection(context);
                                },
                                text: "See price List",
                                color: const Color(0xffFFFFFF),
                                textColor: AppColor.iconColor,
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              PriceButton(onPress: () {}, text: "Book Appointment"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),*/
