import 'package:calma/screens/profile/account_info.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';

class CancelButtonPage extends StatefulWidget {
  const CancelButtonPage({super.key});

  @override
  State<CancelButtonPage> createState() => _CancelButtonPageState();
}

///Enum is same as list but  enum is constant and
/// its value only can be changed during the initialization
enum CancelReason {
  scheduleChanges,
  weatherCondition,
  work,
  travelDelay,
  bookedByMistake,
  other
}

class _CancelButtonPageState extends State<CancelButtonPage> {
  CancelReason? _reason = CancelReason.scheduleChanges;
  bool isOtherSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          BackArrowButtonWithPositioned(
            onPress: () {
              Navigator.pop(context);
            },
          ),
          Positioned(
            top: screenHeight * 0.0695, //62
            left: screenWidth * 0.2505, //103
            child: const TitleText(text: "Cancel Appointment"),
          ),
          Positioned(
            top: screenHeight * 0.1309, //117
            child: const PersonalInfoContainerText(
              text: "Please select the reason for cancellations : ",
            ),
          ),
          Positioned(
            top: screenHeight * 0.185, //155
            left: screenWidth * 0.0243, //10
            child: SizedBox(
              height: screenHeight * 0.6728, //600
              width: screenWidth * 0.9723, //400
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    horizontalTitleGap: 2,
                    title: const BigText(
                      text: "Schedule Changes",
                      color: AppColor.cancelReasonTextColor,
                      fontWeightName: FontWeight.w500,
                      fontFamilyName: "Inter",
                    ),
                    leading: Radio<CancelReason>(
                      value: CancelReason.scheduleChanges,
                      groupValue: _reason,
                      onChanged: (CancelReason? value) {
                        setState(() {
                          _reason = value;
                          isOtherSelected = false;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    title: const BigText(
                      text: "Weather Condition",
                      color: AppColor.cancelReasonTextColor,
                      fontWeightName: FontWeight.w500,
                      fontFamilyName: "Inter",
                    ),
                    leading: Radio<CancelReason>(
                      value: CancelReason.weatherCondition,
                      groupValue: _reason,
                      onChanged: (CancelReason? value) {
                        setState(() {
                          _reason = value;
                          isOtherSelected = false;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    title: const BigText(
                      text: "Unexpected Work",
                      color: AppColor.cancelReasonTextColor,
                      fontWeightName: FontWeight.w500,
                      fontFamilyName: "Inter",
                    ),
                    leading: Radio<CancelReason>(
                      value: CancelReason.work,
                      groupValue: _reason,
                      onChanged: (CancelReason? value) {
                        setState(() {
                          _reason = value;
                          isOtherSelected = false;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    title: const BigText(
                      text: "Travel Delays",
                      color: AppColor.cancelReasonTextColor,
                      fontWeightName: FontWeight.w500,
                      fontFamilyName: "Inter",
                    ),
                    leading: Radio<CancelReason>(
                      value: CancelReason.travelDelay,
                      groupValue: _reason,
                      onChanged: (CancelReason? value) {
                        setState(() {
                          _reason = value;
                          isOtherSelected = false;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    title: const BigText(
                      text: "Booked by Mistake",
                      color: AppColor.cancelReasonTextColor,
                      fontWeightName: FontWeight.w500,
                      fontFamilyName: "Inter",
                    ),
                    leading: Radio<CancelReason>(
                      value: CancelReason.bookedByMistake,
                      groupValue: _reason,
                      onChanged: (CancelReason? value) {
                        setState(() {
                          _reason = value;
                          isOtherSelected = false;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    horizontalTitleGap: 2,
                    title: const BigText(
                      text: "Other",
                      color: AppColor.cancelReasonTextColor,
                      fontWeightName: FontWeight.w500,
                      fontFamilyName: "Inter",
                    ),
                    leading: Radio<CancelReason>(
                      value: CancelReason.other,
                      groupValue: _reason,
                      onChanged: (CancelReason? value) {
                        setState(() {
                          _reason = value;
                          isOtherSelected = true;
                        });
                      },
                    ),
                  ),

                  ///if Other is selected then TextFromField will be shown
                  isOtherSelected
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness: 1,
                              endIndent: screenWidth * 0.0486,
                              indent: screenWidth * 0.0486,
                              color: const Color(0xffD3CECD),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.0486,
                              ),
                              child: SmallText(
                                text: "Other",
                                fontSize: screenHeight * 0.0202,
                              ),
                            ),
                            Container(
                              width: screenWidth * 1.166,
                              height: screenHeight * 0.1941,
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.0367,
                                vertical: screenHeight * 0.0148,
                              ),
                              child: TextFormField(
                                maxLength: 50,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  hintText:
                                      "Please enter your reason for cancellation",
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffD3CECD),
                                    ),
                                    borderRadius: BorderRadius.circular(screenHeight *0.0135 /*12*/),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xffD3CECD),
                                    ),
                                    borderRadius: BorderRadius.circular(screenHeight *0.0135 /*12*/),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                            left: screenWidth * 0.0486,
                          ),
                          child: const Text(""),
                        ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.8673,
            left: screenWidth * 0.0486,
            child: Button(
              onPress: () {
                Navigator.pop(context);
              },
              text: "Cancel Appointment",
              height: screenHeight * 0.0718,
              width: screenWidth * 0.8992,
              // fontSize: screenHeight * 0.0202,
              // radius: screenHeight * 0.0288,
            ),
          ),
        ],
      ),
    );
  }
}

// class _CancelButtonPageState extends State<CancelButtonPage> {
//   CancelReason? _reason = CancelReason.scheduleChanges;
//   bool isOtherSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.mainBackgroundColor,
//       body: Stack(
//         children: [
//           BackArrowButtonWithPositioned(onPress: (){
//             Navigator.pop(context);
//           }),
//
//           const Positioned(
//             top: 62,
//             left: 103,
//             child: TitleText(text: "Cancel Appointment"),
//           ),
//           const Positioned(
//               top: 117,
//               child: PersonalInfoContainerText(text: "Please select the reason for cancellations : ",),
//           ),
//           /// Radio Button for selecting the reason for cancelling the service STARTS here
//           Positioned(
//               top: 165,
//               left: 10,
//             child: SizedBox(
//               height: 600,
//               width: 400,
//               /// Radio Button for selecting the reason for cancelling the service STARTS here
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ListTile(
//                     title: const BigText(text: "Schedule Changes",color: AppColor.cancelReasonTextColor,fontWeightName: FontWeight.w500, fontFamilyName: "Inter",),
//                     leading: Radio<CancelReason>(
//                       value: CancelReason.scheduleChanges,
//                       groupValue: _reason,
//                       onChanged: (CancelReason? value){
//                         setState(() {
//                           _reason = value;
//                           isOtherSelected = false;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: const BigText(text: "Weather Condition",color: AppColor.cancelReasonTextColor,fontWeightName: FontWeight.w500, fontFamilyName: "Inter",),
//                     leading: Radio<CancelReason>(
//                       value: CancelReason.weatherCondition,
//                       groupValue: _reason,
//                       onChanged: (CancelReason? value){
//                         setState(() {
//                           _reason = value;
//                           isOtherSelected = false;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: const BigText(text: "Unexpected Work",color: AppColor.cancelReasonTextColor,fontWeightName: FontWeight.w500, fontFamilyName: "Inter",),
//                     leading: Radio<CancelReason>(
//                       value: CancelReason.work,
//                       groupValue: _reason,
//                       onChanged: (CancelReason? value){
//                         setState(() {
//                           _reason = value;
//                           isOtherSelected = false;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: const BigText(text: "Travel Delays",color: AppColor.cancelReasonTextColor,fontWeightName: FontWeight.w500, fontFamilyName: "Inter",),
//                     leading: Radio<CancelReason>(
//                       value: CancelReason.travelDelay,
//                       groupValue: _reason,
//                       onChanged: (CancelReason? value){
//                         setState(() {
//                           _reason = value;
//                           isOtherSelected = false;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: const BigText(text: "Booked by Mistake",color: AppColor.cancelReasonTextColor,fontWeightName: FontWeight.w500, fontFamilyName: "Inter",),
//                     leading: Radio<CancelReason>(
//                       value: CancelReason.bookedByMistake,
//                       groupValue: _reason,
//                       onChanged: (CancelReason? value){
//                         setState(() {
//                           _reason = value;
//                           isOtherSelected = false;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: const BigText(text: "Other",color: AppColor.cancelReasonTextColor,fontWeightName: FontWeight.w500, fontFamilyName: "Inter",),
//                     leading: Radio<CancelReason>(
//                       value: CancelReason.other,
//                       groupValue: _reason,
//                       onChanged: (CancelReason? value){
//                         setState(() {
//                           _reason = value;
//                           isOtherSelected = true;
//                         });
//                       },
//                     ),
//                   ),

//                   ///if Other is selected then TextFromField will be shown
//                   isOtherSelected ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Divider(thickness: 1,endIndent: 20,indent: 20,color: Color(0xffD3CECD),),
//
//                       const Padding(
//                         padding: EdgeInsets.only(left: 20),
//                         child: SmallText(text: "Other",fontSize: 18,),
//                       ),
//                       Container(
//                         width: 480,
//                         height: 173,
//                         // color: Colors.redAccent,
//                         padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//                         // padding: EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           maxLength: 50,
//                           maxLines: 2,
//                           decoration: InputDecoration(
//                             hintText: "Please enter your reason for cancellation",
//                             filled: true,
//                             fillColor: Colors.white,
//                             // fillColor: AppColor.textFormFieldColor,
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Color(0xffD3CECD)),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Color(0xffD3CECD)),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ): const Padding(
//                     padding: EdgeInsets.only(left: 20),
//                     // child: SmallText(text: "Other",fontSize: 18,),
//                     child: Text(""),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           /// Radio Button for selecting the reason for cancelling the service ENDS here
//
//           /// Cancel Appointment Button
//           Positioned(
//             top: 770,
//             left: 20,
//             child: Button(
//               onPress: () {
//                 Navigator.pop(context);
//               },
//               text: "Cancel Appointment",
//               height: 64,
//               width: 370,
//               fontSize: 18,
//               radius: 25,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
