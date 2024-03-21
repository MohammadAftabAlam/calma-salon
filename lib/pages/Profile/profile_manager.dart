import 'package:calma/pages/Appointments/Appointment_Status/upcoming_booking.dart';
import 'package:calma/pages/Profile/account_info.dart';
import 'package:calma/pages/Profile/location_screen.dart';
import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/pages/validation/login_screen.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileManager extends StatefulWidget {
  const ProfileManager({super.key});

  @override
  State<ProfileManager> createState() => _ProfileManagerState();
}


class _ProfileManagerState extends State<ProfileManager> {
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileButtons(
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountInfo()));
                },
                text: " Account Info",
              ),
              ProfileButtons(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShowLocationPage()),
                  );
                },
                text: "Location ",
              ),
              ProfileButtons(
                onPress: () {},
                text: "Settings ",
              ),
              ProfileButtons(
                onPress: () {},
                text: "Rewards ",
              ),
              ProfileButtons(
                onPress: () {
                  _showBottomLogoutButton(screenHeight, screenWidth);
                },
                text: "Logout",
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.0674, //60,
                  left: screenWidth * 0.0486, //20,
                  right: screenWidth * 0.0486, //20,
                ),
                child: SmallText(
                    textAlignName: TextAlign.center,
                    fontFamilyName: "Rale way",
                    fontStyleName: FontStyle.italic,
                    fontSize: screenHeight * 0.0314, //28
                    color: AppColor.quoteColor,
                    text:
                        '“The only constant in life is \nchange." - Heraclitus'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///******** Function to show the BottomSheet For logout Purpose STARTS here*********************/
  void _showBottomLogoutButton(double screenHeight, double screenWidth) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.0486,
                  vertical: screenHeight * 0.0224), //20
              width: double.maxFinite,
              height: screenHeight * 0.2806, //250

              child: Column(
                children: [
                  /* ************* Big Exclamation Mark in Circle Starts here **************** */
                  Icon(
                    Iconsax.info_circle,
                    color: Colors.grey,
                    size: screenHeight * 0.0898 /*80*/,
                  ),
                  /* ************* Big Exclamation Mark in Circle Ends here **************** */

                  SizedBox(
                    height: screenHeight * 0.0056 /*5*/,
                  ),

                  BigText(
                    text: "Logout",
                    fontSize: screenHeight * 0.0269 /*24*/,
                    fontFamilyName: "Inter",
                    color: const Color(0xff374151),
                  ),

                  SizedBox(
                    height: screenHeight * 0.0056 /*5*/,
                  ),

                  const SmallText(
                    text: "Are you sure, you want to logout ?",
                    color: Color(0xff374151),
                  ),

                  SizedBox(
                    height: screenHeight * 0.0112 /*10*/,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppointmentPageButtonAll(
                          onPress: () {
                            Navigator.pop(context);
                          },
                          text: "No"),
                      AppointmentPageButtonAll(
                          onPress: () async {
                            SharedPreferences sp =
                                await SharedPreferences.getInstance();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                            debugPrint(sp.getBool('isLogin').toString());
                            sp.setBool('isLogin', false);
                            debugPrint(sp.getBool('isLogin').toString());
                          },
                          text: "Yes"),
                    ],
                  ),
                ],
              ),
            ));
  }

  ///******** Function to show the BottomSheet For logout Purpose ENDS here*********************/
}

/* *********************************** Starts Profile Button *********************************** */
class ProfileButtons extends StatelessWidget {
  final VoidCallback onPress;
  final String text;
  final Color iconColor, color;
  final double height, radius, fontSize, paddingTop, paddingLeft, paddingRight;

  const ProfileButtons({
    super.key,
    required this.onPress,
    required this.text,
    this.height = 70,
    this.paddingRight = 20,
    this.paddingLeft = 20,
    this.paddingTop = 32,
    this.fontSize = 22,
    this.color = Colors.white,
    this.iconColor = AppColor.iconColor,
    this.radius = 15,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: paddingLeft == 20
            ? screenWidth * 0.0486
            : screenWidth * paddingLeft / screenWidth,
        right: paddingRight == 20
            ? screenWidth * 0.0486
            : screenWidth * paddingRight / screenWidth,
        top: paddingTop == 32
            ? screenHeight * 0.0359
            : screenHeight * paddingTop / screenHeight,
      ),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: height == 70
              ? screenHeight * 0.0785
              : screenHeight * height / screenHeight,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
              borderRadius: BorderRadius.circular(radius == 15
                  ? screenHeight * 0.0168
                  : screenHeight * radius / screenHeight)),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth * 0.0729 /*30*/),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: text,
                  fontSize: fontSize == 22
                      ? screenHeight * 0.0247
                      : screenHeight * fontSize / screenHeight,
                  fontWeightName: FontWeight.w300,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: iconColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/* *********************************** Ends Profile Button *********************************** */
