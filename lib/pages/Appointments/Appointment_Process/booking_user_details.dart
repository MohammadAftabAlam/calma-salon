import 'package:calma/pages/Appointments/Appointment_Process/payment_page.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BookDetailsUser extends StatefulWidget {
  final String? date;
  final String? time;
  const BookDetailsUser({super.key, required this.date, required this.time});

  @override
  State<BookDetailsUser> createState() => _BookDetailsUserState();
}

List<String> bookingType = ["Self", "Someone else"];
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            /* *********************** Title STARTS here *********************** */
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.0368, top: screenHeight * 0.045),
              child: Row(
                children: [
                  BackArrowButton(
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                  MainTextField(
                    text: "Your Details",
                    fontSize: screenHeight * 0.027,
                  ),
                ],
              ),
            ),
            /* *********************** Title ENDS here *********************** */
        
            /* *********************** Booking for Text STARTS here *********************** */
            MainTextField(
              text: "Booking For",
              leftPad: screenWidth * 0.058,
              topPad: screenHeight * 0.046,
            ),
            /* *********************** Booking for Text ENDS here *********************** */
        
            /* *********************** Dropdown Menu for booking (self, someone else) STARTS here *********************** */
            DropdownButtonFormField(
              focusColor: Colors.white,
              padding: EdgeInsets.only(
                left: screenWidth * 0.0368,
                right: screenWidth * 0.0368,
                top: screenHeight * 0.0095,
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
            /* *********************** Dropdown Menu for booking (self, someone else) ENDS here *********************** */
        
            /* *********************** TextFormField for Name STARTS here *********************** */
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.0368,
                right: screenWidth * 0.0368,
                top: screenHeight * 0.0184,
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
            /* *********************** TextFormField for Name ENDS here *********************** */
        
            /* *********************** TextFormField for Age STARTS here *********************** */
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.0368,
                right: screenWidth * 0.0368,
                top: screenHeight * 0.0184,
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
            /* *********************** TextFormField for Age ENDS here *********************** */
        
            /* *********************** Dropdown Menu for gender selection STARTS here *********************** */
            DropdownButtonFormField(
              dropdownColor: Colors.white,
              padding: EdgeInsets.only(
                left: screenWidth * 0.0368,
                right: screenWidth * 0.0368,
                top: screenHeight * 0.0184,
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
            /* *********************** Dropdown Menu for gender selection ENDS here *********************** */
        
            /* *********************** "Date and Time Selected" Text STARTS here *********************** */
            MainTextField(
              text: "Date and Time Selected",
              leftPad: screenWidth * 0.063,
              topPad: screenHeight * 0.0225,
            ),
            /* *********************** "Date and Time Selected" Text ENDS here *********************** */
        
            /* *********************** Container for showing "date and time of appointment" STARTS here *********************** */
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0484, vertical: screenHeight * 0.0253),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonContainer(text: widget.date.toString(), iconData: Iconsax.calendar5,screenHeight: screenHeight,screenWidth: screenWidth,),
                  ButtonContainer(text: widget.time!, iconData:  Iconsax.clock5,screenHeight: screenHeight,screenWidth: screenWidth,),
                ],
              ),
            ),
            /* *********************** Container for showing "date and time of appointment" ENDS here *********************** */
        
            /* ************************** Confirm Appointment Button STARTS here ******************************* */
        
            /* ************************** Confirm Appointment Button ENDS here ******************************* */
        
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0737, vertical: screenHeight * 0.0337 /*30*/),
        child: Button(
          onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentScreen(time: widget.time, date: widget.date,bookingFor: nameController.text,)));
          },
          text: "Confirm Appointment",
          fontSize: screenHeight * 0.020, //18
          fontFamily: "Inter",
          radius: screenHeight * 0.056, //50
        ),
      ),
    );
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
  final double screenHeight,screenWidth;
  const ButtonContainer({super.key, required this.text, required this.iconData, required this.screenHeight,required this.screenWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.047,
      width: screenWidth * 0.3924, //145
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColor.buttonBackgroundColor),
        borderRadius: BorderRadius.circular(screenHeight * 0.009/*8*/),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: AppColor.iconColor,
            size: screenHeight * 0.0269, //24
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth *0.0195/*8*/),
            child: Text(text,
              style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Inter",fontSize: screenHeight * 0.018/*16*/,color: const Color(0xff6B7280)),
            ),
          ),
        ],
      ),
    );
  }
}


// class BookDetailsUser extends StatefulWidget {
//   final String? date;
//   final String? time;
//   const BookDetailsUser({super.key, required this.date, required this.time});
//
//   @override
//   State<BookDetailsUser> createState() => _BookDetailsUserState();
// }
//
// List<String> bookingType = ["Self", "Booking for someone else"];
// List<String> genderType = ['Male', 'Female'];
//
// class _BookDetailsUserState extends State<BookDetailsUser> {
//   String bookingDropdown = bookingType.first;
//   String genderDropdown = genderType.first;
//   bool isSelfSelected = true;
//
//   TextEditingController nameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: AppColor.mainBackgroundColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: screenWidth * 0.0368, top: screenHeight * 0.045),
//             child: Row(
//               children: [
//                 BackArrowButton(
//                   onPress: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//                 const MainTextField(
//                   text: "Your Details",
//                   fontSize: 24,
//                 ),
//               ],
//             ),
//           ),
//           const MainTextField(
//             text: "Booking For",
//             leftPad: 24,
//             topPad: 41,
//           ),
//
//
//           DropdownButtonFormField(
//             focusColor: Colors.white,
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.0368,
//               right: screenWidth * 0.0368,
//               // bottom: screenHeight * 0.0253,
//               top: screenHeight * 0.0084,
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
//             borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//             icon: const Icon(
//               Icons.arrow_drop_down_outlined,
//               color: AppColor.iconColor,
//             ),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//                 borderSide: BorderSide(
//                   color: AppColor.buttonBackgroundColor,
//                   width: screenWidth * 0.00486,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//                 borderSide: BorderSide(
//                   color: AppColor.buttonBackgroundColor,
//                   width: screenWidth * 0.00486,
//                 ),
//               ),
//               contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.0368,
//               right: screenWidth * 0.0368,
//               // bottom: screenHeight * 0.0253,
//               top: screenHeight * 0.0184,
//             ),
//             child: TextFormField(
//               controller: nameController,
//               cursorColor: AppColor.imageBgColor,
//               readOnly: isSelfSelected,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: "Name",
//                 isDense: true,
//                 suffixIcon: const Icon(Icons.person, color: AppColor.iconColor),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.0243),
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
//                 contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.0368,
//               right: screenWidth * 0.0368,
//               // bottom: screenHeight * 0.0253,
//               top: screenHeight * 0.0184,
//             ),
//             child: TextFormField(
//               controller: ageController,
//               cursorColor: AppColor.imageBgColor,
//               readOnly: isSelfSelected,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: "Age",
//                 isDense: true,
//                 suffixIcon: const Icon(
//                   Iconsax.calendar5,
//                   color: AppColor.iconColor,
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.0243),
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
//                 contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               ),
//             ),
//           ),
//           DropdownButtonFormField(
//             dropdownColor: Colors.white,
//             padding: EdgeInsets.only(
//               left: screenWidth * 0.0368,
//               right: screenWidth * 0.0368,
//               // bottom: screenHeight * 0.0253,
//               top: screenHeight * 0.0184,
//             ),
//             value: genderDropdown,
//             items: genderType.map<DropdownMenuItem<String>>((value) {
//               return DropdownMenuItem(value: value, child: Text(value));
//             }).toList(),
//             onChanged: (value) {
//               genderDropdown = value!;
//               setState(() {});
//             },
//             borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//             icon: const Icon(Icons.arrow_drop_down_outlined, color: AppColor.iconColor,),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//                 borderSide: BorderSide(
//                   color: AppColor.buttonBackgroundColor,
//                   width: screenWidth * 0.00486,
//                 ),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(screenWidth * 0.0243),
//                 borderSide: BorderSide(
//                   color: AppColor.buttonBackgroundColor,
//                   width: screenWidth * 0.00486,
//                 ),
//               ),
//               contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
//             ),
//           ),
//           const MainTextField(
//             text: "Date and Time Selected",
//             leftPad: 26,
//             topPad: 20,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0484, vertical: screenHeight * 0.0225),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ButtonContainer(text: widget.date.toString(), iconData: Iconsax.calendar5,),
//                 ButtonContainer(text: widget.time!, iconData:  Iconsax.clock5,),
//
//                 // ButtonContainer(text: "22 Feb, 2024", iconData: Iconsax.calendar5,),
//                 // ButtonContainer(text: "11:00 AM", iconData:  Iconsax.clock5,),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 30, top: 280),
//             child: Button(
//               onPress: (){
//                 _showBookedStatusDialog();
//               },
//               text: "Confirm Appointment",
//               fontSize: 16,
//               fontFamily: "Inter",
//               radius: 50,
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   _showBookedStatusDialog() {
//     return showDialog(
//         context: context,
//         builder: (context)=>AlertDialog(
//           // backgroundColor: const Color(0xffFFFFFF),\
//           backgroundColor: Colors.white,
//           icon: Container(
//             height: 131,
//             width: 131,
//             decoration: const BoxDecoration(
//               color: Color(0xffA4CFC3),
//               shape: BoxShape.circle,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: SvgPicture.asset("asset/icons/shield_tick.svg",),
//             ),
//           ),
//           title: const Text("Congratulations!", style: TextStyle(fontFamily: "Inter", fontSize: 20, fontWeight: FontWeight.w800),),
//           content: SmallText(text: "Your appointment with Dr. David Patel is confirmed for ${widget.date!} at ${widget.time!}",color: Color(0xff6B7280),textAlignName: TextAlign.center,fontFamilyName: "Inter",),
//           actions: [
//             Align(
//               alignment: Alignment.center,
//               child: Button(
//                 onPress: (){
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
//                 },
//                 width: 245,
//                 fontSize: 18,
//                 radius: 50,
//                 fontFamily: "Inter",
//                 text: "Done",
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainSalonShowPage()));
//                 },
//                 child: const SmallText(text: "Edit your Appointment", fontFamilyName: "Inter", color: Color(0xff6B7280), fontWeightName: FontWeight.w700,),
//               ),
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
//   const MainTextField({super.key, required this.text, this.fontSize = 20, this.leftPad = 70, this.topPad = 0});
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
//             color: const Color(0xff374151)),
//       ),
//     );
//   }
// }
//
// class ButtonContainer extends StatelessWidget {
//   final String text;
//   final IconData iconData;
//   const ButtonContainer({super.key, required this.text, required this.iconData});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
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
//               style: const TextStyle(fontWeight: FontWeight.w500,fontFamily: "Inter",fontSize: 16,color: Color(0xff6B7280)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






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
