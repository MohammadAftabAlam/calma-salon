import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:calma/screens/Profile/account_info.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';

import 'booking_user_details.dart';

String selectedText = "";

class BookingDateAndTime extends StatefulWidget {
  const BookingDateAndTime({super.key});

  @override
  State<BookingDateAndTime> createState() => _BookingDateAndTimeState();
}

class _BookingDateAndTimeState extends State<BookingDateAndTime> {
  DateTime? _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  bool isAvailable = true;
  bool isSelected = false;


  List<String> monthName = [
    "",
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    //Extracting salon information
    final salonInformation =  ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    // print(salonInformation['location']);

    String datePassing = "${_selectedDay!.day} ${monthName[_selectedDay!.month]} ${_selectedDay!.year}";
    final isPreviousDaySelected = DateTime.now().difference(DateTime(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day)).inDays;

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          BackArrowButtonWithPositioned(onPress: () {
            Navigator.pop(context);
          },
            // positionedTop: screenHeight * 0.0455,  //40.53
          ),

          /* ************************** Title STARTS here ******************************* */
          Positioned(
            top: screenHeight * 0.0535,  //47.65
            // top: screenHeight * 0.0695,
            left: screenWidth * 0.2309,
            child: const TitleText(text: "Select Date And Time"),
          ),
          /* ************************** Title ENDS here ******************************* */

          /* ************************** Select Day Text STARTS here ******************************* */
          Positioned(
            // top: screenHeight * 0.1035,
            top: screenHeight * 0.1235,
            left: screenWidth * 0.0243,
            child: const BigText(
              text: "Select Day",
              color: Color(0xff1C2A3A),
              fontFamilyName: "Inter",
            ),
          ),
          /* ************************** Select day Text ENDS here ******************************* */

          /* ************************** Calendar STARTS here ******************************* */
          Positioned(
            top: screenHeight * 0.1568,
            child: SizedBox(
              width: screenWidth * 1,
              child: Card(
                color: Colors.white,
                shadowColor: const Color(0xff9CA3AF),
                elevation: 3,
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.0243,
                    vertical: screenHeight * 0.0111),
                child: TableCalendar(
                  firstDay: DateTime.utc(2024),
                  lastDay: DateTime.utc(2025),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  headerStyle: HeaderStyle(
                      leftChevronIcon: SvgPicture.asset(
                        "asset/icons/left_arrow.svg",
                        height: screenHeight * 0.0202,
                      ),
                      rightChevronIcon: SvgPicture.asset(
                        "asset/icons/right_arrow.svg",
                        height: screenHeight * 0.0202,
                      ),
                      formatButtonVisible: true,
                      formatButtonTextStyle: const TextStyle(
                          fontFamily: "Inter", fontWeight: FontWeight.w700),
                      titleTextStyle: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: screenHeight * 0.018)),
                  calendarStyle: const CalendarStyle(
                    defaultTextStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    weekendTextStyle: TextStyle(
                      color: Colors.red,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.cyan,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          /* ************************** Calendar ENDS here ******************************* */

          /* ************************** Select Hour Text STARTS here ******************************* */
          Positioned(
            top: _calendarFormat == CalendarFormat.week
                ? screenHeight * 0.3362 //300
                : _calendarFormat == CalendarFormat.twoWeeks
                    ? screenHeight * 0.3809
                    : screenHeight * 0.5627, //500
            left: screenWidth * 0.0243,
            child: const BigText(
              text: "Select Hour",
              color: Color(0xff1C2A3A),
              fontFamilyName: "Inter",
            ),
          ),
          /* ************************** Select Hour Text ENDS here ******************************* */

          /* ************************** Time Selection STARTS here ******************************* */
          Positioned(
            top: _calendarFormat == CalendarFormat.week
                ? screenHeight * 0.3809 // 340
                : _calendarFormat == CalendarFormat.twoWeeks
                    ? screenHeight * 0.427 //380
                    : screenHeight * 0.5953, // 530
            left: screenWidth * 0.0122,
            bottom: 0,
            child: SingleChildScrollView(
              /* ************************** Select Hour Time Button STARTS here ******************************* */
              child: Column(
                children: [
                  Row(
                    children: [
                      SelectTimeContainer(
                        text: "9:00 AM",
                        isAvailable: isAvailable,
                        isSelected: isSelected,
                      ),
                      SelectTimeContainer(
                        text: "9:30 AM",
                        isAvailable: isAvailable,
                        isSelected: isSelected,
                      ),
                      SelectTimeContainer(
                          text: "10:00 AM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                    ],
                  ),
                  Row(
                    children: [
                      SelectTimeContainer(
                        text: "10:30 AM",
                        isAvailable: isAvailable,
                        isSelected: isSelected,
                      ),
                      SelectTimeContainer(
                        text: "11:00 AM",
                        isAvailable: isAvailable,
                        isSelected: isSelected,
                      ),
                      SelectTimeContainer(
                        text: "11:30 AM",
                        isAvailable: isAvailable,
                        isSelected: isSelected,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SelectTimeContainer(
                          text: "12:00 noon",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "12:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "1:00 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                    ],
                  ),
                  Row(
                    children: [
                      SelectTimeContainer(
                          text: "1:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "2:00 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "2:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                    ],
                  ),
                  Row(
                    children: [
                      SelectTimeContainer(
                          text: "3:00 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "3:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "2:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                    ],
                  ),
                  Row(
                    children: [
                      SelectTimeContainer(
                          text: "4:00 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "4:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "5:00 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                    ],
                  ),
                  Row(
                    children: [
                      SelectTimeContainer(
                          text: "5:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "6:00 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "6:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                    ],
                  ),
                  Row(
                    children: [
                      SelectTimeContainer(
                          text: "7:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "8:00 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                      SelectTimeContainer(
                          text: "8:30 PM",
                          isAvailable: isAvailable,
                          isSelected: isSelected),
                    ],
                  ),
                ],
              ),
              /* ************************** Select Hour Time Button STARTS here ******************************* */
            ),
          ),
          /* ************************** Time Selection ENDS here ******************************* */
        ],
      ),
      /* ************************** Confirm Appointment Button STARTS here ******************************* */
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0416, vertical: screenHeight * 0.0124),
        child: Button(
          onPress: () {
            if (selectedText.isEmpty) {
              snackBar("Please select your appropriate time for appointment");
              //debugPrint(_selectedDay!.difference(DateTime.now()).toString());
            }

            else if(isPreviousDaySelected >0){
              snackBar("Please select upcoming date");
              //debugPrint(isPreviousDaySelected.toString());

            }
            else {
              setState(() {
                selectedText;
              });

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsUser(
                    date: datePassing,
                    time: selectedText,
                    salonLocation: salonInformation['salonLocation'],
                    salonName: salonInformation['salonName'],
                    salonImage: salonInformation['salonImage'],
                  ),
                ),
              );
            }
          },
          text: "Confirm Appointment",
          height: 63,
        ),
      ),
      /* ************************** Confirm Appointment Button STARTS here ******************************* */
    );
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message!),
      backgroundColor: Colors.red,
    ));
  }
}

class SelectTimeContainer extends StatefulWidget {
  final String text;
  bool isAvailable;
  bool isSelected;
  SelectTimeContainer(
      {super.key,
      required this.text,
      required this.isAvailable,
      required this.isSelected});
  @override
  State<SelectTimeContainer> createState() => _SelectTimeContainerState();
}

class _SelectTimeContainerState extends State<SelectTimeContainer> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.0122, vertical: screenHeight * 0.0141),
      child: Container(
        height: screenHeight * 0.0462,
        width: screenWidth * 0.3044,
        decoration: BoxDecoration(
          color:
              widget.isSelected ? AppColor.buttonBackgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              widget.isSelected = !widget.isSelected;
              widget.isAvailable = !widget.isAvailable;
              selectedText = widget.text;
            });
          },
          child: SmallText(
            text: widget.text,
            color: widget.isAvailable ? Colors.green : Colors.white,
          ),
        ),
      ),
    );
  }
}

/* ******************** Static Height and Width Code ****************** */
// class _BookingDateAndTimeState extends State<BookingDateAndTime> {
//   DateTime? _selectedDay = DateTime.now();
//   DateTime _focusedDay = DateTime.now();
//   CalendarFormat _calendarFormat = CalendarFormat.week;
//   // bool _calendarFormatSelected = true;
//   // Format
//   bool isAvailable = true;
//   bool isSelected = false;
//
//   List<String> monthName = [
//     "",
//     "Jan",
//     "Feb",
//     "March",
//     "April",
//     "May",
//     "Jun",
//     "July",
//     "Aug",
//     "Sep",
//     "Oct",
//     "Nov",
//     "Dec"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     String datePassing =
//         "${_selectedDay!.day} ${monthName[_selectedDay!.month]} ${_selectedDay!.year}";
//     return Scaffold(
//       backgroundColor: AppColor.mainBackgroundColor,
//       body: Stack(
//         children: [
//           BackArrowButtonWithPositioned(onPress: () {
//             Navigator.pop(context);
//           }),
//           const Positioned(
//             top: 62,
//             left: 95,
//             child: TitleText(text: "Select Date And Time"),
//           ),
//           const Positioned(
//             top: 110,
//             left: 10,
//             child: BigText(
//               text: "Select Day",
//               color: Color(0xff1C2A3A),
//               fontFamilyName: "Inter",
//             ),
//           ),
//           // SmallText(text: "text"),
//           Positioned(
//             top: 140,
//             child: SizedBox(
//               width: 410,
//               child: Card(
//                 color: Colors.white,
//                 shadowColor: const Color(0xff9CA3AF),
//                 elevation: 3,
//                 margin:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 child: TableCalendar(
//                   firstDay: DateTime.utc(2024),
//                   lastDay: DateTime.utc(2025),
//                   focusedDay: _focusedDay,
//                   selectedDayPredicate: (day) {
//                     return isSameDay(_selectedDay, day);
//                   },
//                   onDaySelected: (selectedDay, focusedDay) {
//                     if (!isSameDay(_selectedDay, selectedDay)) {
//                       setState(() {
//                         _selectedDay = selectedDay;
//                         _focusedDay = focusedDay;
//                       });
//                     }
//                   },
//                   onPageChanged: (focusedDay) {
//                     _focusedDay = focusedDay;
//                   },
//                   startingDayOfWeek: StartingDayOfWeek.monday,
//                   calendarFormat: _calendarFormat,
//                   onFormatChanged: (format) {
//                     setState(() {
//                       _calendarFormat = format;
//                     });
//                   },
//                   headerStyle: HeaderStyle(
//                       leftChevronIcon: SvgPicture.asset(
//                         "asset/icons/left_arrow.svg",
//                         height: 18,
//                       ),
//                       rightChevronIcon: SvgPicture.asset(
//                         "asset/icons/right_arrow.svg",
//                         height: 18,
//                       ),
//                       formatButtonVisible: true,
//                       formatButtonTextStyle: const TextStyle(
//                           fontFamily: "Inter", fontWeight: FontWeight.w700),
//                       titleTextStyle: const TextStyle(
//                           fontFamily: "Inter",
//                           fontWeight: FontWeight.w700,
//                           fontSize: 16)),
//                   calendarStyle: const CalendarStyle(
//                     defaultTextStyle: TextStyle(
//                       color: Colors.blue,
//                     ),
//                     weekendTextStyle: TextStyle(
//                       color: Colors.red,
//                     ),
//                     selectedDecoration: BoxDecoration(
//                         color: Colors.cyan, shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: _calendarFormat == CalendarFormat.week ? 300 : 500,
//             left: 10,
//             child: const BigText(
//               text: "Select Hour",
//               color: Color(0xff1C2A3A),
//               fontFamilyName: "Inter",
//             ),
//           ),
//           Positioned(
//               top: _calendarFormat == CalendarFormat.week ? 340 : 540,
//               left: 5,
//               bottom: 0,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         SelectTimeContainer(
//                           text: "9:00 AM",
//                           isAvailable: isAvailable,
//                           isSelected: isSelected,
//                         ),
//                         SelectTimeContainer(
//                           text: "9:30 AM",
//                           isAvailable: isAvailable,
//                           isSelected: isSelected,
//                         ),
//                         SelectTimeContainer(
//                             text: "10:00 AM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SelectTimeContainer(
//                           text: "10:30 AM",
//                           isAvailable: isAvailable,
//                           isSelected: isSelected,
//                         ),
//                         SelectTimeContainer(
//                           text: "11:00 AM",
//                           isAvailable: isAvailable,
//                           isSelected: isSelected,
//                         ),
//                         SelectTimeContainer(
//                           text: "11:30 AM",
//                           isAvailable: isAvailable,
//                           isSelected: isSelected,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SelectTimeContainer(
//                             text: "12:00 noon",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "12:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "1:00 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SelectTimeContainer(
//                             text: "1:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "2:00 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "2:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SelectTimeContainer(
//                             text: "3:00 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "3:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "2:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SelectTimeContainer(
//                             text: "4:00 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "4:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "5:00 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SelectTimeContainer(
//                             text: "5:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "6:00 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "6:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SelectTimeContainer(
//                             text: "7:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "8:00 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                         SelectTimeContainer(
//                             text: "8:30 PM",
//                             isAvailable: isAvailable,
//                             isSelected: isSelected),
//                       ],
//                     ),
//                   ],
//                 ),
//               ))
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
//         child: AppointmentBookAndPriceButton(
//           onPress: () {
//             // debugPrint("Selected Day: "+ _selectedDay.toString());
//             if (selectedText.isEmpty) {
//               snackBar("Please select time for your appointment");
//             } else {
//               setState(() {
//                 selectedText;
//               });
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => BookDetailsUser(
//                             date: datePassing,
//                             time: selectedText,
//                           )));
//             }
//           },
//           text: "Confirm Appointment",
//         ),
//       ),
//     );
//   }
//
//   snackBar(String? message) {
//     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(message!),
//       backgroundColor: Colors.red,
//     ));
//   }
// }
//
// class SelectTimeContainer extends StatefulWidget {
//   final String text;
//   bool isAvailable;
//   bool isSelected;
//   SelectTimeContainer(
//       {super.key,
//       required this.text,
//       required this.isAvailable,
//       required this.isSelected});
//   @override
//   State<SelectTimeContainer> createState() => _SelectTimeContainerState();
// }
//
// class _SelectTimeContainerState extends State<SelectTimeContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//       child: Container(
//         height: 41,
//         width: 125,
//         decoration: BoxDecoration(
//           color:
//               widget.isSelected ? AppColor.buttonBackgroundColor : Colors.white,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: TextButton(
//           onPressed: () {
//             setState(() {
//               widget.isSelected = !widget.isSelected;
//               widget.isAvailable = !widget.isAvailable;
//               selectedText = widget.text;
//             });
//           },
//           child: SmallText(
//             text: widget.text,
//             color: widget.isAvailable ? Colors.green : Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SelectTimeContainer extends StatefulWidget {
//   final String text;
//   final bool isAvailable;
//   const SelectTimeContainer(
//       {super.key, required this.text, required this.isAvailable, });
//   @override
//   State<SelectTimeContainer> createState() => _SelectTimeContainerState();
// }
//
// class _SelectTimeContainerState extends State<SelectTimeContainer>{
//
//   bool isSelected = false;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//       child: InkWell(
//         onTap: (){
//           isSelected = !isSelected;
//         },
//         child: Container(
//           height: 41,
//           width: 125,
//           decoration: BoxDecoration(
//             color: isSelected? AppColor.buttonBackgroundColor : Colors.white ,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Center(
//               child: SmallText(
//                 text: widget.text,
//                 color: widget.isAvailable ? Colors.green : Colors.red,
//               )),
//         ),
//       ),
//     );
//   }
// }
