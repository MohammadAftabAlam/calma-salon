import 'package:calma/pages/Appointments/Appointment%20Process/salon_search_show_pg.dart';
import 'package:calma/pages/Appointments/main_appointment_pg.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BookDetailsUser extends StatefulWidget {
  const BookDetailsUser({super.key});

  @override
  State<BookDetailsUser> createState() => _BookDetailsUserState();
}

List<String> bookingType = ["Self", "Booking for someone else"];
List<String> genderType = ['Male', 'Female'];

class _BookDetailsUserState extends State<BookDetailsUser> {
  String bookingDropdown = bookingType.first;
  String genderDropdown = genderType.first;
  bool isSelfSelected = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.0368, top: screenHeight * 0.045),
            child: Row(
              children: [
                BackArrowButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
                const MainTextField(
                  text: "Your Details",
                  fontSize: 24,
                ),
              ],
            ),
          ),
          const MainTextField(
            text: "Booking For",
            leftPad: 24,
            topPad: 41,
          ),
          
          
          DropdownButtonFormField(
            focusColor: Colors.white,
            padding: EdgeInsets.only(
              left: screenWidth * 0.0368,
              right: screenWidth * 0.0368,
              bottom: screenHeight * 0.0253,
              top: screenHeight * 0.0384,
            ),
            value: bookingDropdown,
            items: bookingType.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              bookingDropdown = value!;
              setState(() {
                isSelfSelected = !isSelfSelected;
              });
            },
            borderRadius: BorderRadius.circular(screenWidth * 0.0243),
            icon: const Icon(
              Icons.arrow_drop_down_outlined,
              color: AppColor.iconColor,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                borderSide: BorderSide(
                  color: AppColor.buttonBackgroundColor,
                  width: screenWidth * 0.00486,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                borderSide: BorderSide(
                  color: AppColor.buttonBackgroundColor,
                  width: screenWidth * 0.00486,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.0368,
              right: screenWidth * 0.0368,
              bottom: screenHeight * 0.0253,
              top: screenHeight * 0.0384,
            ),
            child: TextFormField(
              controller: nameController,
              cursorColor: AppColor.imageBgColor,
              readOnly: isSelfSelected,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Name",
                isDense: true,
                suffixIcon: const Icon(Icons.person, color: AppColor.iconColor),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                  borderSide: BorderSide(
                    color: AppColor.buttonBackgroundColor,
                    width: screenWidth * 0.00486,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                  borderSide: BorderSide(
                    color: AppColor.buttonBackgroundColor,
                    width: screenWidth * 0.00486,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.0368,
              right: screenWidth * 0.0368,
              bottom: screenHeight * 0.0253,
              top: screenHeight * 0.0384,
            ),
            child: TextFormField(
              controller: ageController,
              cursorColor: AppColor.imageBgColor,
              readOnly: isSelfSelected,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Age",
                isDense: true,
                suffixIcon: const Icon(
                  Iconsax.calendar5,
                  color: AppColor.iconColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                  borderSide: BorderSide(
                    color: AppColor.buttonBackgroundColor,
                    width: screenWidth * 0.00486,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                  borderSide: BorderSide(
                    color: AppColor.buttonBackgroundColor,
                    width: screenWidth * 0.00486,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              ),
            ),
          ),
          DropdownButtonFormField(
            dropdownColor: Colors.white,
            padding: EdgeInsets.only(
              left: screenWidth * 0.0368,
              right: screenWidth * 0.0368,
              bottom: screenHeight * 0.0253,
              top: screenHeight * 0.0384,
            ),
            value: genderDropdown,
            items: genderType.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              genderDropdown = value!;
              setState(() {});
            },
            borderRadius: BorderRadius.circular(screenWidth * 0.0243),
            icon: const Icon(Icons.arrow_drop_down_outlined, color: AppColor.iconColor,),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                borderSide: BorderSide(
                  color: AppColor.buttonBackgroundColor,
                  width: screenWidth * 0.00486,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                borderSide: BorderSide(
                  color: AppColor.buttonBackgroundColor,
                  width: screenWidth * 0.00486,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            ),
          ),
          const MainTextField(
            text: "Date and Time Selected",
            leftPad: 26,
            topPad: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0484, vertical: screenHeight * 0.0225),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonContainer(text: "22 Feb, 2024", iconData: Iconsax.calendar5,),
                ButtonContainer(text: "11:00 AM", iconData:  Iconsax.clock5,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 120),
            child: Button(
              onPress: (){
                _showBookedStatusDialog();
              },
              text: "Confirm Appointment",
              fontSize: 16,
              fontFamily: "Inter",
              radius: 50,
            ),
          )
        ],
      ),
    );
  }

  _showBookedStatusDialog() {
    return showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          backgroundColor: const Color(0xffFFFFFF),
          icon: Container(
            height: 131,
            width: 131,
            decoration: const BoxDecoration(
              color: Color(0xffA4CFC3),
              shape: BoxShape.circle,
            ),
            child: const Icon(Iconsax.shield_tick, size: 72, color: Colors.white,),
          ),
          title: const Text("Congratulations!", style: TextStyle(fontFamily: "Inter", fontSize: 20, fontWeight: FontWeight.w800),),
          content: const Text("Your appointment with Dr. David Patel is confirmed for June 30, 2023, at 10:00 AM."),
          actions: [
            Align(
              alignment: Alignment.center,
              child: Button(
                onPress: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Appointments()));
                },
                width: 245,
                fontSize: 18,
                radius: 50,
                fontFamily: "Inter",
                text: "Done",
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainSalonShowPage()));
                },
                child: const SmallText(text: "Edit your Appointment", fontFamilyName: "Inter", color: Color(0xff6B7280), fontWeightName: FontWeight.w700,),
              ),
            ),
          ],
        ));
  }
}

class MainTextField extends StatelessWidget {
  final String text;
  final double fontSize, leftPad, topPad;

  const MainTextField({super.key, required this.text, this.fontSize = 20, this.leftPad = 70, this.topPad = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPad, top: topPad),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: "Inter",
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: const Color(0xff374151)),
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  final String text;
  final IconData iconData;
  const ButtonContainer({super.key, required this.text, required this.iconData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.buttonBackgroundColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: AppColor.iconColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(text,
              style: const TextStyle(fontWeight: FontWeight.w500,fontFamily: "Inter",fontSize: 16,color: Color(0xff6B7280)),
            ),
          ),
        ],
      ),
    );
  }
}






// class BookDetailsUser extends StatefulWidget {
//   const BookDetailsUser({super.key});
//
//   @override
//   State<BookDetailsUser> createState() => _BookDetailsUserState();
// }
//
// List bookingType = <String>["Self", "Booking for someone else"];
// List genderType = <String>['Male', 'Female'];
//
// class _BookDetailsUserState extends State<BookDetailsUser> {
//   String bookingDropdown = bookingType.first;
//   String genderDropdown = genderType.first;
//   bool isSelfSelected = true;
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.sizeOf(context).height;
//     final screenWidth = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       backgroundColor: AppColor.mainBackgroundColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // SizedBox(height: 200,),
//           Padding(
//             padding: const EdgeInsets.only(left: 15, top: 40),
//             child: Row(
//               children: [
//                 BackArrowButton(onPress: () {
//                   Navigator.pop(context);
//                 }),
//                 const MainTextField(text: "Your Details",fontSize: 24,),
//               ],
//             ),
//           ),
//
//          const MainTextField(
//             text: "Booking For",
//             leftPad: 24,
//             topPad: 41,
//           ),
//
//           DropdownButtonFormField(
//             focusColor: Colors.white,
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.0368, //15
//               right: screenWidth * 0.0368, //15
//               bottom: screenHeight * 0.0225, //20
//               top: screenHeight * 0.034, //30
//             ),
//             value: bookingDropdown,
//             items: bookingType.map<DropdownMenuItem<String>>((value) {
//               return DropdownMenuItem(value: value, child: Text(value));
//             }).toList(),
//             onChanged: (value) {
//               bookingDropdown = value!;
//               setState(() {
//                 isSelfSelected = !isSelfSelected;
//               });
//             },
//             borderRadius: BorderRadius.circular(15),
//             icon: const Icon(
//               Icons.arrow_drop_down_outlined,
//               color: AppColor.iconColor,
//             ),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius:
//                       BorderRadius.circular(screenWidth * 0.0243 /*10*/),
//                   borderSide: BorderSide(
//                     color: AppColor.buttonBackgroundColor,
//                     width: screenWidth * 0.00486,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//                   borderSide: BorderSide(
//                     color: AppColor.buttonBackgroundColor,
//                     width: screenWidth * 0.00486,
//                   ),
//                 ),
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 2, horizontal: 10)),
//           ),
//
//           /// Name TextField STARTS HERE
//           Padding(
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.0368, //15
//               right: screenWidth * 0.0368, //15
//               bottom: screenHeight * 0.0225, //20
//               top: screenHeight * 0.034, //30
//             ),
//             child: TextFormField(
//               controller: nameController,
//               cursorColor: AppColor.imageBgColor,
//               readOnly: isSelfSelected,
//               // obscureText: isVisible,
//               decoration: InputDecoration(
//                 filled: true,
//                   fillColor: Colors.white,
//                   hintText: "Name",
//                   isDense: true,
//                   suffixIcon: Icon(Icons.person, color: AppColor.iconColor),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius:
//                         BorderRadius.circular(screenWidth * 0.0243 /*10*/),
//                     borderSide: BorderSide(
//                       color: AppColor.buttonBackgroundColor,
//                       width: screenWidth * 0.00486,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//                     borderSide: BorderSide(
//                       color: AppColor.buttonBackgroundColor,
//                       width: screenWidth * 0.00486,
//                     ),
//                   ),
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
//             ),
//           ),
//
//           /// Name TextFields ENDS HERE
//
//           Padding(
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.0368, //15
//               right: screenWidth * 0.0368, //15
//               bottom: screenHeight * 0.0225, //20
//               top: screenHeight * 0.034, //30
//             ),
//             child: TextFormField(
//               controller: ageController,
//               cursorColor: AppColor.imageBgColor,
//               readOnly: isSelfSelected,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                   hintText: "Age",
//                   isDense: true,
//                   suffixIcon: const Icon(
//                     Iconsax.calendar5,
//                     color: AppColor.iconColor,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius:
//                         BorderRadius.circular(screenWidth * 0.0243 /*10*/),
//                     borderSide: BorderSide(
//                       color: AppColor.buttonBackgroundColor,
//                       width: screenWidth * 0.00486,
//                     ),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//                     borderSide: BorderSide(
//                       color: AppColor.buttonBackgroundColor,
//                       width: screenWidth * 0.00486,
//                     ),
//                   ),
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
//             ),
//           ),
//           DropdownButtonFormField(
//             dropdownColor: Colors.white,
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.0368, //15
//               right: screenWidth * 0.0368, //15
//               bottom: screenHeight * 0.0225, //20
//               top: screenHeight * 0.034, //30
//             ),
//             value: genderDropdown,
//             items: genderType.map<DropdownMenuItem<String>>((value) {
//               return DropdownMenuItem(value: value, child: Text(value));
//             }).toList(),
//             onChanged: (value) {
//               genderDropdown = value!;
//               setState(() {});
//             },
//             borderRadius: BorderRadius.circular(15),
//             icon: const Icon(Icons.arrow_drop_down_outlined,color: AppColor.iconColor,),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.0243 /*10*/),
//                   borderSide: BorderSide(
//                     color: AppColor.buttonBackgroundColor,
//                     width: screenWidth * 0.00486,
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius:
//                   BorderRadius.circular(screenWidth * 0.0243),
//                   borderSide: BorderSide(
//                     color: AppColor.buttonBackgroundColor,
//                     width: screenWidth * 0.00486,
//                   ),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10)
//             ),
//           ),
//
//           const MainTextField(text: "Date and Time Selected",leftPad: 26,topPad: 20,),
//
//           /****************** Date and Time For Appointment STARTS here***********************/
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                ButtonContainer(text: "22 Feb, 2024",iconData: Iconsax.calendar5,),
//                ButtonContainer(text: "11:00 AM",iconData:  Iconsax.clock5,),
//              ],
//             ),
//           ),
//           /****************** Date and Time For Appointment ENDS here***********************/
//
//           Padding(
//             padding: const EdgeInsets.only(left: 30,top: 120),
//             child: Button(onPress: (){
//               _showBookedStatusDialog();
//             }, text: "Confirm Appointment",fontSize: 16,fontFamily: "Inter",radius: 50,),
//           )
//         ],
//       ),
//     );
//   }
//   _showBookedStatusDialog(){
//     return showDialog(
//         context: context,
//         builder: (context)=>AlertDialog(
//           backgroundColor: const Color(0xffFFFFFF),
//           icon: Container(
//             height: 131,
//             width: 131,
//             decoration: const BoxDecoration(
//               color: Color(0xffA4CFC3),
//               shape: BoxShape.circle,
//             ),
//             child: const Icon(Iconsax.shield_tick,size: 72,color: Colors.white,),
//           ),
//           title: const Text("Congratulations!",style: TextStyle(fontFamily: "Inter",fontSize: 20,fontWeight: FontWeight.w800),),
//           content: const Text("Your appointment with Dr. David Patel is confirmed for June 30, 2023, at 10:00 AM."),
//           actions: [
//             Align(
//               alignment: Alignment.center,
//               child: Button(onPress: (){
//                 Navigator.pop(context);
//               },
//                   width: 245,
//                   fontSize: 18,
//                   radius: 50,
//                   fontFamily: "Inter",
//                   text: "Done"),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(onPressed: (){
//                 Navigator.pop(context);
//               }, child:const SmallText(text: "Edit your Appointment",fontFamilyName: "Inter",color: Color(0xff6B7280),fontWeightName: FontWeight.w700,)),
//             ),
//           ],
//         ));
//   }
// }
//
// class MainTextField extends StatelessWidget {
//   final String text;
//   final double fontSize, leftPad, topPad;
//
//   const MainTextField(
//       {super.key,
//       required this.text,
//       this.fontSize = 20,
//       this.leftPad = 70,
//       this.topPad = 0,
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: leftPad, top: topPad),
//       child: Text(
//         text,
//         style: TextStyle(
//             fontFamily: "Inter",
//             fontSize: fontSize,
//             fontWeight: FontWeight.w600,
//             color: Color(0xff374151)),
//       ),
//     );
//   }
// }
// class ButtonContainer extends StatelessWidget {
//   final String text;
//   final IconData iconData;
//   const ButtonContainer({super.key, required this.text, required this.iconData});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: EdgeInsets.all(8),
//       height: 42,
//       width: 145,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: AppColor.buttonBackgroundColor),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             iconData,
//             color: AppColor.iconColor,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 8),
//             child: Text(text,
//               style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Inter",fontSize: 16,color: Color(0xff6B7280)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
