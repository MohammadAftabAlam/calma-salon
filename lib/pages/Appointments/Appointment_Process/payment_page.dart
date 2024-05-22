import 'dart:async';

import 'package:calma/Data/data.dart';
import 'package:calma/pages/Profile/account_info.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'salon_detail_pg.dart';

class PaymentScreen extends StatefulWidget {
  final String? date, time, bookingFor;
  const PaymentScreen({
    super.key,
    required this.time,
    required this.date,
    required this.bookingFor,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

enum PaymentType { cash, upi }

class _PaymentScreenState extends State<PaymentScreen> {
  get screenHeight => MediaQuery.of(context).size.height;
  get screenWidth => MediaQuery.of(context).size.width;

  ///This is enum type, providing facility to user to choose from
  ///two options named as cash and upi payment
  PaymentType? _paymentType = PaymentType.upi;

  /// [_razorpay] object of Razorpay() to accept the payment using Razorpay platform
  final _razorpay = Razorpay();
  String paymentId = "";
  var options = {
    'key': 'rzp_test_u60Lt49w9oA390',
    'amount': 100,
    'name': 'Calma',
    'method': 'upi',
    'description': 'Haircut',
    'timeout': '180',
    'retry': {'enabled': false, 'max_count': 0},
    'send_sms_hash': true,
    'prefill': {
      'contact': '8092846469',
      'email': 'sunny123456789singh0@gmail.com'
    },
    'external': {
      'wallets': ['paytm']
    }
  };

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata: ${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    debugPrint(response.data.toString());
    paymentId = response.paymentId!;

    _showBookedStatusDialog(context, screenHeight, screenWidth);
  }

  void handleExternalWalletResponse(ExternalWalletResponse response) {
    showAlertDialog(context, "External Wallet Selected",
        "Wallet Name: ${response.walletName}");
  }

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletResponse);

    super.initState();
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    int itemCount = 5;
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          BackArrowButtonWithPositioned(onPress: () {
            Navigator.pop(context);
          }),

          /* ************************** Title STARTS here ******************************* */
          Positioned(
            top: screenHeight * 0.0605, //54
            left: screenWidth * 0.2309, //95
            child: const TitleText(text: "Payment Summary"),
          ),
          /* ************************** Title ENDS here ******************************* */

          /* ******************************** Salon pic and their detail container STARTS here ************************ */
          Positioned(
            top: screenHeight * 0.1236,
            left: screenWidth * 0.0122,
            right: screenWidth * 0.0122,
            child: SizedBox(
              // height: screenHeight * 0.29,
              height: screenHeight * 0.25,
              child: Card(
                color: AppColor.cardBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(11),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          /* ***************************** START Showing the salon image here****************** */
                          Container(
                            height: screenHeight * 0.148,
                            width: screenHeight * 0.148,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  screenHeight * 0.0135 /*12*/),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("asset/images/salonRoom.jpg"),
                              ),
                            ),
                          ),
                          /* ***************************** ENDS Showing the salon image here****************** */

                          /* ************** This widget denotes the Salon Name and their booking status i.e..(Booked,Pending,Cancelled)************** */
                          //Expanded Widget is used here for acquiring the rest width of the Row in Container
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: screenWidth * 0.0243 /*10*/,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BigText(
                                    fontWeightName: FontWeight.w700,
                                    color: AppColor.mainBlackColor,
                                    text: "Varsha Saloon",
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.0056,
                                  ), //5
                                  Row(
                                    children: [
                                      imageWithContentInRow(
                                          'asset/icons/male.svg',
                                          "Male",
                                          screenHeight),
                                      SizedBox(
                                        width: screenWidth * 0.0243, //10,
                                      ),
                                      imageWithContentInRow(
                                        'asset/icons/female.svg',
                                        "Female",
                                        screenHeight,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.0056,
                                  ), //5
                                  Row(
                                    children: [
                                      Icon(
                                        Iconsax.location5,
                                        color: const Color(0xff4B5563),
                                        size: screenHeight * 0.0178, //16
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.0126, //5
                                      ),
                                      SmallText(
                                        text: "Jogabai Extension",
                                        fontSize: screenHeight * 0.0178, //16
                                        fontWeightName: FontWeight.w400,
                                        fontFamilyName: 'Inter',
                                        color: const Color(0xff4B5563),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.0056,
                                  ), //5
                                  imageWithContentInRow(
                                    "asset/icons/nearest_location.svg",
                                    "Jamia Nagar, New Delhi",
                                    screenHeight,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      dateTimeAndBookingText(
                          "Date & Time",
                          "${widget.date} | ${widget.time}",
                          screenHeight,
                          screenWidth),
                      SizedBox(
                        height: screenHeight * 0.0056, //5
                      ),
                      dateTimeAndBookingText("Booking for",
                          "${widget.bookingFor}", screenHeight, screenWidth),
                    ],
                  ),
                ),
              ),
            ),
          ),
          /* ******************************** Salon pic and their detail container ENDS here ************************ */

          /* ******************************** Service Detail and price STARTS here ************************ */
          Positioned(
            top: screenHeight * 0.3799,
            left: screenWidth * 0.0122,
            right: screenWidth * 0.0122,
            child: SizedBox(
              // height: screenHeight * 0.2691,
              height: screenHeight * 0.2791,
              child: Card(
                color: AppColor.cardBackgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: screenHeight *
                          0.1459, //130,// screenHeight * 0.1794,  160
                      width: screenWidth * 0.986,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          top: 0,
                        ),
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(bottom: screenHeight * 0.005),
                            child: totalServicePriceDetailText(
                                "Haircut", 60, screenHeight, screenWidth),
                          );
                        },
                      ),
                    ),
                    /* *********************** Edit button and icon STARTS here ******************** */
                    Padding(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.011, //10,
                        left: screenWidth * 0.0267, //11
                      ),
                      child: IconButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const MainSalonShowPage()));
                        },
                        icon: Row(
                          children: [
                            SmallText(
                              text: "Edit",
                              fontSize: screenHeight * 0.020, //18
                              fontWeightName: FontWeight.w600,
                              fontFamilyName: 'Inter',
                              color: const Color(0xff231F20),
                            ),
                            SizedBox(
                              width: screenWidth * 0.0243, /*10*/
                            ),
                            Icon(
                              Iconsax.edit5,
                              color: AppColor.iconColor,
                              size: screenHeight * 0.0269,
                            )
                          ],
                        ),
                      ),
                    ),
                    /* *********************** Edit button and icon ENDS here ******************** */
                    totalServicePriceDetailText(
                        "Service Total", 60, screenHeight, screenWidth),
                  ],
                ),
              ),
            ),
          ),
          /* ******************************** Service Detail and price ENDS here ************************ */

          /* ******************************** GST & Service Detail Card STARTS here ************************ */
          Positioned(
            top: screenHeight * 0.6653,
            left: screenWidth * 0.0242,
            right: screenWidth * 0.0242,
            child: Container(
              height: screenHeight * 0.0717,
              width: screenWidth * 0.986,
              decoration: BoxDecoration(
                color: AppColor.cardBackgroundColor1,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenHeight * 0.0112 /*10*/),
                  topRight: Radius.circular(screenHeight * 0.0112 /*10*/),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  totalServicePriceDetailText(
                      "GST", 5, screenHeight, screenWidth),
                  totalServicePriceDetailText(
                      "Service Cost", 5, screenHeight, screenWidth),
                ],
              ),
            ),
          ),
          /* ******************************** GST & Service Detail Card ENDS here ************************ */

          /* ******************************** Total Cost Container STARTS here ************************ */
          Positioned(
            top: screenHeight * 0.734,
            left: screenWidth * 0.0242,
            right: screenWidth * 0.0232,
            child: Container(
                height: screenHeight * 0.045,
                width: screenWidth * 0.986,
                decoration: const BoxDecoration(
                  color: Color(0xff648684),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.0316 /*13*/),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: "Total",
                        color: Colors.white,
                        fontSize: screenHeight * 0.0202, //18,
                        fontFamilyName: "Inter",
                      ),
                      BigText(
                        text: "60",
                        color: Colors.white,
                        fontSize: screenHeight * 0.0202, //18,
                        fontFamilyName: "Inter",
                      ),
                    ],
                  ),
                )),
          ),
          /* ******************************** Total Cost Container ENDS here ************************ */

          /* ******************************** Divider Text STARTS here ************************ */
          Positioned(
            top: screenHeight * 0.7413, //640
            // top: 660,
            left: screenWidth * 0.0392, //18
            // right: screenWidth * 0.0122, //11
            // child: const Text(
            //   "_  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _   _  _  _  _ ",
            //   textAlign: TextAlign.justify,
            //   style: TextStyle(color: Colors.white),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: screenWidth * 0.913,
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                    ),
                ),
              ],
            ),
          ),
          /* ******************************** Divider Text ENDS here ************************ */

          /* ********************************************* Option for Payment such as [Upi/Net banking and CASH] STARTS here ************************************** */
          Positioned(
            top: screenHeight * 0.786,
            left: screenWidth * 0.0122,
            right: screenWidth * 0.0122,
            child: SizedBox(
              height: screenHeight * 0.1199, //100
              // height: 100, //121
              // height: screenHeight * 0.1358, //121
              width: screenWidth * 0.886,
              child: Card(
                color: AppColor.cardBackgroundColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.0392, //35,
                      // color: Colors.green,
                      child: ListTile(
                        leading: Container(
                          height: screenHeight * 0.0326,
                          width: screenWidth * 0.0964,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.005),
                            color: Colors.white,
                          ),
                          child: const Image(
                            image: AssetImage("asset/images/upi.jpg"),
                          ),
                        ),
                        title: const Text("UPI / Net banking"),
                        trailing: Radio<PaymentType>(
                          groupValue: _paymentType,
                          value: PaymentType.upi,
                          onChanged: (PaymentType? type) {
                            setState(() {
                              _paymentType = type;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.0392, //35,
                      // color: Colors.red,
                      child: ListTile(
                        leading: Container(
                            height: screenHeight * 0.0326,
                            width: screenWidth * 0.0964,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.005),
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Iconsax.cards5,
                              color: AppColor.iconColor,
                            )),
                        title: const Text("CASH"),
                        trailing: Radio<PaymentType>(
                          groupValue: _paymentType,
                          value: PaymentType.cash,
                          onChanged: (PaymentType? type) {
                            setState(() {
                              _paymentType = type;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* ********************************************* Option for Payment such as [Upi/Net banking and CASH] ENDS here ************************************** */
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.0365, vertical: screenHeight * 0.0135),
        child: Button(
          onPress: () {
            if (_paymentType == PaymentType.upi) {
              _razorpay.open(options);
            } else {
              Timer(const Duration(seconds: 5), () {
                _showBookedStatusDialog(context, screenHeight, screenWidth);
              });
              showAlertDialog(context, "!!! Payment Pending !!!",
                  "Your payment is pending");
            }
          },
          text: "Proceed to pay",
          fontSize: screenHeight * 0.020, //18
          fontFamily: "Inter",
          radius: screenHeight * 0.056, //50
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String title, String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
          );
        });
  }

  Widget totalServicePriceDetailText(
      String serviceName, int price, double screenHeight, double screenWidth) {
    return SizedBox(
      height: screenHeight * 0.0225,
      width: screenWidth * 0.986,
      child: ListTile(
        leading: Text(
          serviceName,
          style: TextStyle(
              color: const Color(0xff797979),
              fontSize: screenHeight * 0.018, //16
              fontWeight: FontWeight.w600,
              fontFamily: "Inter"),
        ),
        trailing: Text(
          price.toString(),
          style: TextStyle(
              color: const Color(0xff231F20),
              fontSize: screenHeight * 0.018, //16
              fontWeight: FontWeight.w600,
              fontFamily: "Inter"),
        ),
      ),
    );
  }

  /* ************** Text Container for showing Date Time and Booking for Status STARTS here**************** */
  Widget dateTimeAndBookingText(
      String text, String data, double screenHeight, double screenWidth) {
    return SizedBox(
      height: screenHeight * 0.0225,
      width: screenWidth * 0.908,
      child: ListTile(
        leading: Text(
          text,
          style: TextStyle(
              color: const Color(0xff797979),
              fontSize: screenHeight * 0.020,
              fontWeight: FontWeight.w600,
              fontFamily: "Inter"),
        ),
        trailing: SmallText(
          text: data,
          fontFamilyName: "Inter",
          fontWeightName: FontWeight.w600,
          fontSize: screenHeight * 0.0178, //16
        ),
      ),
    );
  }
  /* ************** Text Container for showing Date Time and Booking for Status ENDS here**************** */

  /* ************** Showing text and icon in Row STARTS here**************** */
  Widget imageWithContentInRow(
      String picturePath, String text, double screenHeight) {
    return Row(
      children: [
        SvgPicture.asset(
          picturePath,
          height: screenHeight * 0.0178, /*16*/
        ),
        const SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
          fontSize: screenHeight * 0.0178, //16
          fontWeightName: FontWeight.w400,
          fontFamilyName: 'Inter',
          color: const Color(0xff4B5563),
        )
      ],
    );
  }
  /* ************** Showing text and icon in Row ENDS here**************** */

  _showBookedStatusDialog(context, double screenHeight, double screenWidth) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        icon: Container(
          height: screenHeight * 0.147,
          width: screenWidth * 0.158,
          decoration: const BoxDecoration(
            color: Color(0xffA4CFC3),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.0224,
                horizontal: screenWidth * 0.04861 /*20*/),
            child: SvgPicture.asset(
              "asset/icons/shield_tick.svg",
            ),
          ),
        ),
        title: Text(
          "Congratulations!",
          style: TextStyle(
              fontFamily: "Inter",
              fontSize: screenWidth * 0.0585,
              fontWeight: FontWeight.w800),
        ),
        content: SmallText(
          text:
              "Your appointment with Dr. David Patel is confirmed for ${widget.date!} at ${widget.time!}",
          color: const Color(0xff6B7280),
          textAlignName: TextAlign.center,
          fontFamilyName: "Inter",
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Button(
              onPress: () {
                // Navigator.pushReplacementNamed(context, '/appointments',
                //     arguments: UpcomingBookingData(widget.date!, widget.time!));

                Navigator.pushNamedAndRemoveUntil(context, '/appointments',(route) {
                  arguments: UpcomingBookingData(widget.date!, widget.time!);
                  return false;
                   }
                );
              },
              width: screenWidth * 0.277,
              fontSize: screenHeight * 0.0202, //18,
              radius: screenHeight * 0.0202, //18
              fontFamily: "Inter",
              text: "Done",
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/main-salon-page');
              },
              child: const SmallText(
                text: "Edit your Appointment",
                fontFamilyName: "Inter",
                color: Color(0xff6B7280),
                fontWeightName: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 10.0;
    var dashSpace = 5.0;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// class PaymentScreen extends StatefulWidget {
//   final String? date, time;
//   const PaymentScreen({super.key, required this.time, required this.date});
//
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }
//
// enum PaymentType { cash, upi }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   ///This is enum type, providing facility to user to choose from
//   ///two options named as cash and upi payment
//   PaymentType? _paymentType = PaymentType.upi;
//
//   /// [_razorpay] object of Razorpay() to accept the payment using Razorpay platform
//   final _razorpay = Razorpay();
//
//   var options = {
//     'key': 'rzp_test_u60Lt49w9oA390',
//     'amount': 100,
//     'name': 'Acme Corp.',
//     'description': 'Haircut',
//     'retry': {'enabled': true, 'max_count': 1},
//     'send_sms_hash': true,
//     'prefill': {'contact': '8092846469', 'email': 'sunny123456789singh0@gmail.com'},
//     'external': {
//       'wallets': ['paytm']
//     }
//   };
//
//   void handlePaymentErrorResponse(PaymentFailureResponse response){
//     showAlertDialog(context, "Payment Failed", "Code: ${response.code}\nDescription: ${response.message}\nMetadata: ${response.error.toString()}");
//   }
//
//   void handlePaymentSuccessResponse(PaymentSuccessResponse response){
//     debugPrint(response.data.toString());
//     showAlertDialog(context, "Payment Successful", "Payment Id: ${response.paymentId}");
//   }
//
//   void handleExternalWalletResponse(ExternalWalletResponse response){
//     showAlertDialog(context, "External Wallet Selected", "Wallet Name: ${response.walletName}");
//   }
//
//   @override
//   void dispose() {
//     _razorpay.clear();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     int itemCount = 5;
//     return Scaffold(
//       backgroundColor: AppColor.mainBackgroundColor,
//       body: Stack(
//         children: [
//           BackArrowButtonWithPositioned(onPress: () {
//             Navigator.pop(context);
//           }),
//
//           /* ************************** Title STARTS here ******************************* */
//           Positioned(
//             top: screenHeight * 0.0695,
//             left: screenWidth * 0.2309,
//             child: const TitleText(text: "Payment Summary"),
//           ),
//
//           /* ******************************** Salon pic and their detail container STARTS here ************************ */
//           Positioned(
//             top: 110,
//             // left: screenWidth * 0.2309,
//             child: SizedBox(
//               height: 223,
//               child: Card(
//                 color: AppColor.cardBackgroundColor,
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       /* ****************** Container for showing content of Card Widget STARTS here ************************/
//                       Container(
//                         height: 120,
//                         width: 405, //350,
//                         margin: const EdgeInsets.only(
//                           // left: 20,
//                           right: 20,
//                           // top: 10,
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 132,
//                               width: 132,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 image: const DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image:
//                                       AssetImage("asset/images/salonRoom.jpg"),
//                                 ),
//                               ),
//                             ),
//
//                             /* ************** This widget denotes the Salon Name and their booking status i.e..(Booked,Pending,Cancelled)************** */
//                             //Expanded Widget is used here for acquiring the rest width of the Row in Container
//                             Expanded(
//                               child: SizedBox(
//                                 height: 130,
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.only(left: 10, top: 10),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       const BigText(
//                                           fontWeightName: FontWeight.w700,
//                                           color: AppColor.mainBlackColor,
//                                           text: "Varsha Saloon"),
//                                       Row(
//                                         children: [
//                                           imageWithContentInRow(
//                                               'asset/icons/male.svg', "Male"),
//                                           const SizedBox(
//                                             width: 10,
//                                           ),
//                                           imageWithContentInRow(
//                                               'asset/icons/female.svg',
//                                               "Female"),
//                                         ],
//                                       ),
//                                       const Row(
//                                         children: [
//                                           Icon(
//                                             Iconsax.location5,
//                                             color: Color(0xff4B5563),
//                                             size: 16,
//                                           ),
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           SmallText(
//                                             text: "Jogabai Extension",
//                                             fontSize: 16,
//                                             fontWeightName: FontWeight.w400,
//                                             fontFamilyName: 'Inter',
//                                             color: Color(0xff4B5563),
//                                           )
//                                         ],
//                                       ),
//                                       imageWithContentInRow(
//                                           "asset/icons/nearest_location.svg",
//                                           "Jamia Nagar, New Delhi")
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       /* ****************** Container for showing content of Card Widget ENDS here ************************/
//
//                       dateTimeAndBookingText(
//                           "Date & Time", "${widget.date} | ${widget.time}"),
//                       const SizedBox(
//                         height: 13,
//                       ),
//                       dateTimeAndBookingText(
//                           "Booking for", "${widget.date} | ${widget.time}"),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           /* ******************************** Salon pic and their detail container ENDS here ************************ */
//
//           /* ******************************** Service Detail and price STARTS here ************************ */
//           Positioned(
//             top: 340,
//             left: 5,
//             right: 5,
//             // bottom: 5,
//             child: SizedBox(
//               // height: (oneItemSize.toDouble() * itemCount.toDouble() +80),
//               height: 240,
//               child: Card(
//                 color: AppColor.cardBackgroundColor,
//                 // color: Colors.cyan,
//                 //elevation: 3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 160,
//                       width: 400,
//                       child: ListView.builder(
//                         padding:
//                             const EdgeInsets.only(top: 0, bottom: 0, left: 5),
//                         itemCount: itemCount,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.only(bottom: 5),
//                             child: totalServicePriceDetailText("Haircut", 60),
//                           );
//                         },
//                       ),
//                     ),
//
//                     /* *********************** Edit button and icon STARTS here ******************** */
//                     const Padding(
//                       padding: EdgeInsets.only(
//                         left: 28,
//                       ),
//                       child: Row(
//                         children: [
//                           SmallText(
//                             text: "Edit",
//                             fontSize: 18,
//                             fontWeightName: FontWeight.w600,
//                             fontFamilyName: 'Inter',
//                             color: Color(0xff231F20),
//                           ),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Icon(Iconsax.edit5, color: AppColor.iconColor),
//                         ],
//                       ),
//                     ),
//                     /* *********************** Edit button and icon ENDS here ******************** */
//
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 15,
//                       ),
//                       child: totalServicePriceDetailText("Service Total", 20),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           /* ******************************** Service Detail and price ENDS here ************************ */
//
//           /* ******************************** GST & Service Detail Card STARTS here ************************ */
//           Positioned(
//             top: 585,
//             left: 5,
//             right: 5,
//             child: Container(
//               height: 80,
//               width: 402,
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10),
//                       topRight: Radius.circular(10))),
//               child: Card(
//                 color: AppColor.cardBackgroundColor,
//                 // color: Colors.red,
//                 child: Column(
//                   children: [
//                     totalServicePriceDetailText("GST", 5),
//                     totalServicePriceDetailText("Service Cost", 5),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           /* ******************************** GST & Service Detail Card ENDS here ************************ */
//
//           /* ******************************** Total Cost Container STARTS here ************************ */
//           Positioned(
//             top: 650,
//             left: 5,
//             right: 5,
//             child: Container(
//                 height: 40,
//                 width: 402,
//                 decoration: const BoxDecoration(
//                     color: Color(0xff648684),
//                     // color: Colors.red,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(10),
//                         bottomRight: Radius.circular(10))),
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 13),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       BigText(
//                         text: "Total",
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontFamilyName: "Inter",
//                       ),
//                       BigText(
//                         text: "60",
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontFamilyName: "Inter",
//                       ),
//                     ],
//                   ),
//                 )),
//           ),
//           /* ******************************** Total Cost Container ENDS here ************************ */
//
//           /* ******************************** Divider Text STARTS here ************************ */
//           const Positioned(
//             top: 640,
//             left: 10,
//             right: 10,
//             child: Text(
//               "_  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _  _   _  _  _  _ ",
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           /* ******************************** Divider Text ENDS here ************************ */
//
//           Positioned(
//             top: 700,
//             left: 5,
//             right: 5,
//             child: Container(
//               height: 112,
//               width: 405,
//               decoration: BoxDecoration(
//                   color: AppColor.cardBackgroundColor,
//                   // color: Colors.green,
//                   borderRadius: BorderRadius.circular(10)),
//               child: Column(
//                 children: [
//                   ListTile(
//                     leading: Container(
//                       height: 29,
//                       width: 43,
//                       color: Colors.white,
//                       child: const Image(
//                         image: AssetImage("asset/images/upi.jpg"),
//                       ),
//                     ),
//                     title: const Text("UPI / Net banking"),
//                     trailing: Radio<PaymentType>(
//                       groupValue: _paymentType,
//                       value: PaymentType.upi,
//                       onChanged: (PaymentType? type) {
//                         setState(() {
//                           _paymentType = type;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     leading: Container(
//                         height: 29,
//                         width: 43,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.white,
//                         ),
//                         child: const Icon(
//                           Iconsax.cards5,
//                           color: AppColor.iconColor,
//                         )),
//                     title: const Text("CASH"),
//                     trailing: Radio<PaymentType>(
//                       groupValue: _paymentType,
//                       value: PaymentType.cash,
//                       onChanged: (PaymentType? type) {
//                         setState(() {
//                           _paymentType = type;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//         child: Button(
//           onPress: () async{
//
//             _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,handlePaymentErrorResponse);
//             _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
//             _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletResponse);
//             _razorpay.open(options);
//
//             // if()
//           },
//           text: "Proceed to pay",
//           fontSize: screenHeight * 0.020, //18
//           fontFamily: "Inter",
//           radius: screenHeight * 0.056, //50
//         ),
//       ),
//     );
//   }
//
//   showAlertDialog(BuildContext context,String title, String message){
//     return showDialog(context: context, builder: (BuildContext context){
//       return AlertDialog(title: Text(title),content: Text(message),);
//     });
//   }
//
//
//
//   Widget totalServicePriceDetailText(String serviceName, int price) {
//     return SizedBox(
//       height: 20,
//       width: 400,
//       child: ListTile(
//         leading: Text(
//           serviceName,
//           style: const TextStyle(
//               color: Color(0xff797979),
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               fontFamily: "Inter"),
//         ),
//         trailing: Text(
//           price.toString(),
//           style: const TextStyle(
//               color: Color(0xff231F20),
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               fontFamily: "Inter"),
//         ),
//       ),
//     );
//   }
//
//   /* ************** Text Container for showing Date Time and Booking for Status STARTS here**************** */
//   Widget dateTimeAndBookingText(String text, String data) {
//     return SizedBox(
//       height: 20,
//       width: 350,
//       child: ListTile(
//         leading: Text(
//           text,
//           style: const TextStyle(
//               color: Color(0xff797979),
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               fontFamily: "Inter"),
//         ),
//         trailing: SmallText(
//           text: data,
//           fontFamilyName: "Inter",
//           fontWeightName: FontWeight.w600,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
//   /* ************** Text Container for showing Date Time and Booking for Status ENDS here**************** */
//
//   /* ************** Showing text and icon in Row STARTS here**************** */
//   Widget imageWithContentInRow(String picturePath, String text) {
//     return Row(
//       children: [
//         SvgPicture.asset(picturePath),
//         const SizedBox(
//           width: 6,
//         ),
//         SmallText(
//           text: text,
//           fontSize: 16,
//           fontWeightName: FontWeight.w400,
//           fontFamilyName: 'Inter',
//           color: const Color(0xff4B5563),
//         )
//       ],
//     );
//   }
//   /* ************** Showing text and icon in Row ENDS here**************** */
//
//   _showBookedStatusDialog(double screenHeight, double screenWidth) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: Colors.white,
//         icon: Container(
//           height: screenHeight * 0.147,
//           width: screenWidth * 0.158,
//           decoration: const BoxDecoration(
//             color: Color(0xffA4CFC3),
//             shape: BoxShape.circle,
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: SvgPicture.asset(
//               "asset/icons/shield_tick.svg",
//             ),
//           ),
//         ),
//         title: Text(
//           "Congratulations!",
//           style: TextStyle(
//               fontFamily: "Inter",
//               fontSize: screenWidth * 0.0585,
//               fontWeight: FontWeight.w800),
//         ),
//         content: SmallText(
//           text:
//               "Your appointment with Dr. David Patel is confirmed for ${widget.date!} at ${widget.time!}",
//           color: const Color(0xff6B7280),
//           textAlignName: TextAlign.center,
//           fontFamilyName: "Inter",
//         ),
//         actions: [
//           Align(
//             alignment: Alignment.center,
//             child: Button(
//               onPress: () {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const HomeScreen()));
//               },
//               width: screenWidth * 0.277,
//               fontSize: 18,
//               radius: screenHeight * 0.0202, //18
//               fontFamily: "Inter",
//               text: "Done",
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: TextButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const MainSalonShowPage()));
//               },
//               child: const SmallText(
//                 text: "Edit your Appointment",
//                 fontFamilyName: "Inter",
//                 color: Color(0xff6B7280),
//                 fontWeightName: FontWeight.w700,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
