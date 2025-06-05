import 'package:calma/screens/profile/imp_information_calma.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';

class ProfileManager extends StatefulWidget {
  const ProfileManager({super.key});

  @override
  State<ProfileManager> createState() => _ProfileManagerState();
}

class _ProfileManagerState extends State<ProfileManager> {
  // SharedPreferencesDataStoring sharedPreferencesDataStoring = new SharedPreferencesDataStoring();

  sharedPreference() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isLogin', false);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: screenHeight,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("My profile"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Stack(
                      children: [
                        Container(
                          height: 108,
                          width: 108,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("asset/images/yazdan.jpg"),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 72,
                          left: 58,
                          child: InkWell(
                            onTap: () {},
                            // borderRadius: BorderRadius.circular(100),
                            customBorder: const CircleBorder(),
                            child: Container(
                              // height: screenHeight * 0.0493, //44,
                              // width: screenWidth * 0.1069, //44,
                              height: 25,
                              width: 25,
                              margin: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.0134 /*12*/,
                                  horizontal: screenWidth * 0.0486 /*20*/),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Color.fromRGBO(23, 120, 136, 0.15),
                                  color: Colors.white),
                              child: Icon(Icons.camera_alt_outlined,
                                  size: screenHeight * 0.0202 /*18*/),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.04861, //20,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BigText(
                          text: "Yazdan Haider",
                          fontSize: 25,
                          fontWeightName: FontWeight.w500,
                          color: AppColor.mainBlackColor,
                        ),
                        SmallText(text: "Yazdan@gmail.com")
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02918, //26
              ),

              /// Location Button
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.0559 /*23*/,
                    vertical: screenHeight * 0.0089 /*8*/),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(screenHeight * 0.0202 /*18*/),
                  side: const BorderSide(color: Color(0xffD5D4DF)),
                ),
                borderOnForeground: true,
                child: ProfileButtonsTrait(
                  onTapped: () {
                    Navigator.pushNamed(context, '/show-location-page');
                  },
                  text: "location",
                  iconData: Iconsax.location,
                ),
              ),

              /// Edit Profile Button
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.0559 /*23*/,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(screenHeight * 0.0202 /*18*/),
                  side: const BorderSide(color: Color(0xffD5D4DF)),
                ),
                borderOnForeground: true,
                child: ProfileButtonsTrait(
                  onTapped: () {
                    Navigator.pushNamed(context, '/account-info');
                  },
                  text: "Edit profile",
                  iconData: Iconsax.brush_1,
                ),
              ),

              /// Other Information
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.0559 /*23*/,
                    vertical: screenHeight * 0.0216 /*13*/),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(screenHeight * 0.0202 /*18*/),
                  side: const BorderSide(color: Color(0xffD5D4DF)),
                ),
                borderOnForeground: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.0303 /*27*/,
                          left: screenWidth * 0.0438 /*18*/),
                      child: SmallText(
                        text: "Other Information",
                        fontSize: screenHeight * 0.0269, //24,
                        fontWeightName: FontWeight.w700,
                      ),
                    ),

                    /// Share the App
                    ProfileButtonsTrait(
                      text: "Share the App",
                      onTapped: () {
                        showSnackBar("Not live yet. Coming Soon");
                      },
                      iconData: Iconsax.share,
                    ),
                    divider(),

                    /// About Us Section
                    ProfileButtonsTrait(
                      onTapped: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VitalInformationRegardingApp(
                                      isAboutUsSection: true,
                                    ),
                            ),
                        );
                      },
                      text: "About Us",
                      iconData: Iconsax.clipboard_text,
                    ),
                    divider(),

                    /// Privacy Policy Section
                    ProfileButtonsTrait(
                      onTapped: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VitalInformationRegardingApp(
                                      isPrivacyPolicySection: true,
                                    ),
                            ),
                        );
                      },
                      text: "Privacy Policy",
                      iconData: Iconsax.note_2,
                    ),
                    divider(),

                    /// Notification Preferences Section
                    ProfileButtonsTrait(
                      onTapped: () {
                        showSnackBar("Update Coming Soon...");
                      },
                      text: "Notification Preferences",
                      iconData: Iconsax.notification_bing,
                    ),
                    divider(),

                    /// Contact Us Section
                    ProfileButtonsTrait(
                      onTapped: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VitalInformationRegardingApp(
                                      isContactUsSection: true,
                                    ),
                            ),
                        );
                      },
                      text: "Contact Us",
                      iconData: Iconsax.call_calling,
                    ),
                  ],
                ),
              ),

              /// Logout Section
              Center(
                child: TextButton(
                  onPressed: () {
                    _showBottomLogoutButton(screenHeight, screenWidth);
                  },
                  child: BigText(
                    text: "Logout",
                    fontSize: screenHeight * 0.0269, //24,
                    fontWeightName: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,

    ));
  }

  divider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 15,
      endIndent: 15,
      color: Color(0xffD5D4DF),
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
              height: screenHeight * 0.3211, //286

              child: Column(
                children: [
                  /* ************* Icon STARTS here **************** */
                  Container(
                    height: screenHeight * 0.0786, //70,
                    width: screenWidth * 0.17013, //70,
                    margin: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.0135 /*12*/,
                        horizontal: screenWidth * 0.0486 /*20*/),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(23, 120, 136, 0.15),
                    ),
                    child: const Icon(Iconsax.information, size: 52),
                  ),
                  /* ************* Big Exclamation Mark in Circle Ends here **************** */

                  SizedBox(
                    height: screenHeight * 0.0056 /*5*/,
                  ),
                  SmallText(
                    text: "Logout",
                    fontSize: screenHeight * 0.0269 /*24*/,
                    fontFamilyName: "Inter",
                    fontWeightName: FontWeight.w700,
                    color: const Color(0xff374151),
                  ),
                  SizedBox(
                    height: screenHeight * 0.0056 /*5*/,
                  ),
                  const SmallText(
                    text: "Are you sure, you want to logout ?",
                    color: Color(0xff374151),
                    fontWeightName: FontWeight.w500,
                  ),
                  SizedBox(
                    height: screenHeight * 0.0112 /*10*/,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                          onPress: () {
                            Navigator.pop(context);
                          },
                          text: "No"),
                      Button(
                          onPress: () async {
                            sharedPreference();
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login-screen', (route) => false);
                          },
                          text: "Yes"),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  ///******** Function to show the BottomSheet For logout Purpose ENDS here*********************/
}

class ProfileButtonsTrait extends StatelessWidget {
  const ProfileButtonsTrait(
      {super.key,
      required this.text,
      required this.iconData,
      required this.onTapped});
  final String text;
  final IconData iconData;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTapped,
      borderRadius: BorderRadius.circular(screenHeight * 0.0202 /*18*/),
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.0493, //44,
            width: screenWidth * 0.1069, //44,
            margin: EdgeInsets.symmetric(
                vertical: screenHeight * 0.0134 /*12*/,
                horizontal: screenWidth * 0.0486 /*20*/),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(23, 120, 136, 0.15),
            ),
            child: Icon(iconData),
          ),
          BigText(
            text: text,
            fontFamilyName: "Inter",
            color: AppColor.mainBlackColor,
            fontWeightName: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

/* *********************************** Starts profile Button *********************************** */
// class ProfileButtons extends StatelessWidget {
//   final VoidCallback onPress;
//   final String text;
//   final Color iconColor, color;
//   final double height, radius, fontSize, paddingTop, paddingLeft, paddingRight;
//
//   const ProfileButtons({
//     super.key,
//     required this.onPress,
//     required this.text,
//     this.height = 70,
//     this.paddingRight = 20,
//     this.paddingLeft = 20,
//     this.paddingTop = 32,
//     this.fontSize = 22,
//     this.color = Colors.white,
//     this.iconColor = AppColor.iconColor,
//     this.radius = 15,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: EdgeInsets.only(
//         left: paddingLeft == 20
//             ? screenWidth * 0.0486
//             : screenWidth * paddingLeft / screenWidth,
//         right: paddingRight == 20
//             ? screenWidth * 0.0486
//             : screenWidth * paddingRight / screenWidth,
//         top: paddingTop == 32
//             ? screenHeight * 0.0359
//             : screenHeight * paddingTop / screenHeight,
//       ),
//       child: InkWell(
//         onTap: onPress,
//         child: Container(
//           height: height == 70
//               ? screenHeight * 0.0785
//               : screenHeight * height / screenHeight,
//           decoration: BoxDecoration(
//               shape: BoxShape.rectangle,
//               color: color,
//               borderRadius: BorderRadius.circular(radius == 15
//                   ? screenHeight * 0.0168
//                   : screenHeight * radius / screenHeight)),
//           child: Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: screenWidth * 0.0729 /*30*/),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 BigText(
//                   text: text,
//                   fontSize: fontSize == 22
//                       ? screenHeight * 0.0247
//                       : screenHeight * fontSize / screenHeight,
//                   fontWeightName: FontWeight.w300,
//                 ),
//                 Icon(
//                   Icons.arrow_forward_ios,
//                   color: iconColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
/* *********************************** Ends profile Button *********************************** */

/// New Current Working
/*SizedBox(
      height: screenHeight,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("My profile"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Stack(
                    children: [
                      Container(
                        height: 108,
                        width: 108,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("asset/images/yazdan.jpg"),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 72,
                        left: 58,
                        child: InkWell(
                          onTap: (){},
                          // borderRadius: BorderRadius.circular(100),
                          customBorder: const CircleBorder(),
                          child: Container(
                            // height: screenHeight * 0.0493, //44,
                            // width: screenWidth * 0.1069, //44,
                            height: 25,
                            width: 25,
                            margin: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.0134 /*12*/,
                                horizontal: screenWidth * 0.0486 /*20*/),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                // color: Color.fromRGBO(23, 120, 136, 0.15),
                                color: Colors.white),
                            child: Icon(Icons.camera_alt_outlined, size: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text: "Yazdan Haider", fontSize: 25,fontWeightName: FontWeight.w500,color: AppColor.mainBlackColor,),
                      SmallText(text: "Yazdan@gmail.com")
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 26,
            ),

            /// location Button
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.0559 /*23*/,
                  vertical: screenHeight * 0.0089 /*8*/),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(screenHeight * 0.0202 /*18*/),
                side: const BorderSide(color: Color(0xffD5D4DF)),
              ),
              borderOnForeground: true,
              child: ProfileButtonsTrait(
                onTapped: () {
                  Navigator.pushNamed(context, '/show-location-page');
                },
                text: "location",
                iconData: Iconsax.location,
              ),
            ),

            /// Edit profile Button
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.0559 /*23*/,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(screenHeight * 0.0202 /*18*/),
                side: const BorderSide(color: Color(0xffD5D4DF)),
              ),
              borderOnForeground: true,
              child: ProfileButtonsTrait(
                onTapped: () {
                  Navigator.pushNamed(context, '/account-info');
                },
                text: "Edit profile",
                iconData: Iconsax.brush_1,
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.0559 /*23*/,
                  vertical: screenHeight * 0.0216 /*13*/),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(screenHeight * 0.0202 /*18*/),
                side: const BorderSide(color: Color(0xffD5D4DF)),
              ),
              borderOnForeground: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.0303 /*27*/,
                        left: screenWidth * 0.0438 /*18*/),
                    child: SmallText(
                      text: "Other Information",
                      fontSize: screenHeight * 0.0269, //24,
                      fontWeightName: FontWeight.w700,
                    ),
                  ),
                  ProfileButtonsTrait(
                    text: "Share the App",
                    onTapped: () {
                      showSnackBar("Not live yet. Coming Soon");
                    },
                    iconData: Iconsax.share,
                  ),
                  divider(),
                  ProfileButtonsTrait(
                    onTapped: () {},
                    text: "About Us",
                    iconData: Iconsax.clipboard_text,
                  ),
                  divider(),
                  ProfileButtonsTrait(
                    onTapped: () {},
                    text: "Privacy Policy",
                    iconData: Iconsax.note_2,
                  ),
                  divider(),
                  ProfileButtonsTrait(
                    onTapped: () {},
                    text: "Notification Preferences",
                    iconData: Iconsax.notification_bing,
                  ),
                  divider(),
                  ProfileButtonsTrait(
                    onTapped: () {},
                    text: "Contact Us",
                    iconData: Iconsax.call_calling,
                  ),
                ],
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  _showBottomLogoutButton(screenHeight, screenWidth);
                },
                child: BigText(
                  text: "Logout",
                  fontSize: screenHeight * 0.0269, //24,
                  fontWeightName: FontWeight.w700,
                ),
              ),
            ),
            // SizedBox(height: 50,),
            // Text("zdfsdf")
          ],
        ),
      ),
    );*/
/// Current Working Code
/*Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return  SizedBox(
      height: screenHeight,
      child: Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          BackArrowButtonWithPositioned(
            onPress: () {
              Navigator.pushNamed(context, '/main-home-screen');
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileButtons(
                onPress: () {
                  Navigator.pushNamed(context, '/account-info');
                },
                text: " Account Info",
              ),
              ProfileButtons(
                onPress: () {
                  Navigator.pushNamed(context, '/show-location-page');
                },
                text: "location ",
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
    )
    );
  }*/
// Working Code
/*Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          BackArrowButtonWithPositioned(
            onPress: () {
              Navigator.pushNamed(context, '/main-home-screen');
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileButtons(
                onPress: () {
                  Navigator.pushNamed(context, '/account-info');
                },
                text: " Account Info",
              ),
              ProfileButtons(
                onPress: () {
                  Navigator.pushNamed(context, '/show-location-page');
                },
                text: "location ",
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
     // bottomNavigationBar: BottomNavigationBarContent(screenHeight: screenHeight,),
    );*/
