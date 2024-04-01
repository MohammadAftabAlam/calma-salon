import 'package:calma/pages/validation/login_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController forgetPassController = TextEditingController();
  TextEditingController forgetConfirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: AppColor.mainBackgroundColor,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              /*******************Back Arrow Button and Logo Of the application STARTS here ******************/
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.only( top: screenHeight*0.0562 /*50*/, left: screenWidth * 0.0486/*20*/),

                  child: BackArrowButton(onPress: () {
                    Navigator.pop(context);
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.0786 /*70*/),
                child: Container(
                  height: 100,
                  width: 167,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/calmaLogo.png"))),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Change Password",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xff414141)),
                ),
              ),
              /*******************Back Arrow Button Logo of the application ENDS here ******************/

              /// Phone Number fields STARTS HERE
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
                  // top: screenHeight * 0.0225, //15
                  // bottom: screenHeight * 0.0225,  //15
                ),
                child: SizedBox(
                  // height: screenHeight * 0.0898,  //88
                  height: 80,
                  width: double.maxFinite,
                  child: IntlPhoneField(
                    controller: phoneNumberController,
                    cursorColor: AppColor.imageBgColor,
                    style: TextStyle(fontSize: screenWidth * 0.0387),
                    dropdownTextStyle: TextStyle(
                      fontSize: screenWidth * 0.0387,
                    ),
                    invalidNumberMessage: "Invalid Phone Number",
                    dropdownIcon: Icon(
                      Icons.arrow_drop_down,
                      size: screenWidth * 0.0583,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(fontSize: screenWidth * 0.0387),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.0243),
                        borderSide: BorderSide(
                          color: AppColor.buttonBackgroundColor,
                          width: screenWidth * 0.00486,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.0243),
                        borderSide: BorderSide(
                          color: AppColor.buttonBackgroundColor,
                          width: screenWidth * 0.00486,
                        ),
                      ),
                    ),
                    initialCountryCode: 'IN',
                  ),
                ),
              ),
              /// Phone Number fields ENDS HERE

              /************** Password STARTS here **********************/
              PasswordTextField(
                text: "Password",
                controller: forgetPassController,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                verticalPad: 18,
              ),
              /************** Password ENDS here **********************/

              /************** Confirm Password STARTS here **********************/
              PasswordTextField(
                text: "Confirm Password",
                controller: forgetConfirmPassController,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                verticalPad: 18,
              ),
              /************** Confirm Password ENDS here **********************/

              Button(
                onPress: () {
                  debugPrint(phoneNumberController.text.toString());
                  debugPrint(forgetPassController.text.toString());
                  debugPrint(forgetConfirmPassController.text.toString());

                  if (phoneNumberController.text.toString().length != 10) {
                    snackBar("Phone Number can't be empty");
                  } else if (forgetPassController.text.toString().isEmpty) {
                    snackBar("Password field can't be empty");
                  } else if (!(forgetPassController.text.toString() ==
                      forgetConfirmPassController.text.toString())) {
                    snackBar("Password doesn't match");
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Ok",
                                      style: TextStyle(
                                          color: AppColor.textColor2,
                                          fontSize: 18,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600),
                                    ))
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                              content: const SmallText(
                                text: "Password has been changed Successfully",
                                textAlignName: TextAlign.center,
                              ),
                              icon: const Icon(
                                Iconsax.tick_circle,
                                color: Colors.green,
                                size: 40,
                              ),
                            ),
                    );
                  }
                },
                width: 200,
                text: "Confirm",
                fontFamily: "Inter",
                fontSize: 18,
              ),
            ],
          ),
        ));
  }

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message!),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.up,
    ));
  }
}

class PasswordTextField extends StatelessWidget {
  final double screenHeight, screenWidth, verticalPad;
  final TextEditingController controller;
  final String text;
  final bool isVisible;

  const PasswordTextField({super.key,
    required this.text,
    required this.controller,
    required this.screenWidth,
    required this.screenHeight,
    this.verticalPad = 5,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    // bool isnew = widget.isVisible;
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.0368, //15
        right: screenWidth * 0.0368, //15
        bottom: screenHeight * 0.0225, //20
        top: screenHeight * 0.005, //5
      ),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        cursorColor: AppColor.imageBgColor,
        decoration: InputDecoration(
            hintText: text,
            prefixIcon: const Icon(Iconsax.lock),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
            contentPadding:
            EdgeInsets.symmetric(vertical: verticalPad, horizontal: 10)),
      ),
    );
  }
}