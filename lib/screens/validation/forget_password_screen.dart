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

  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /*******************Back Arrow Button and Logo Of the application STARTS here ******************/
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.0562 /*50*/,
                      left: screenWidth * 0.0486 /*20*/),
                  child: BackArrowButton(onPress: () {
                    Navigator.pop(context);
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.0786 /*70*/),
                child: Container(
                  height: screenHeight * 0.1123, //100,
                  width: screenWidth * 0.4059, //167,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/calmaLogo.png"))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.0112 /*10*/),
                child: Text(
                  "Change Password",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: screenHeight * 0.0224, //20
                    color: const Color(0xff414141),
                  ),
                ),
              ),
              /*******************Back Arrow Button Logo of the application ENDS here ******************/

              /// Phone Number fields STARTS HERE
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
                ),
                child: SizedBox(
                  height: screenHeight * 0.0898, //80
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
                    validator: (value){
                      if(phoneNumberController.text.toString().isEmpty){
                        return "Enter valid phone number";
                      }
                      return null;
                    },
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
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: screenWidth * 0.00486,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                        borderSide: BorderSide(
                          color:  Colors.red,
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
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
                  bottom: screenHeight * 0.0225, //20
                  top: screenHeight * 0.005, //5
                  ),
                child: TextFormField(
                  controller: forgetPassController,
                  obscureText: isVisible,
                  validator: (value){
                    if(forgetPassController.text.toString().isEmpty){
                      return "Enter a valid password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Iconsax.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(
                        isVisible ? Iconsax.eye_slash5 : Iconsax.eye,
                        color: AppColor.iconColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: screenWidth * 0.00486,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                      borderSide: BorderSide(
                        color:  Colors.red,
                        width: screenWidth * 0.00486,
                      ),
                    ),
                   ),
                ),
              ),
              /************** Password ENDS here **********************/

              /************** Confirm Password STARTS here **********************/
              PasswordTextField(
                text: "Confirm Password",
                // fKey: _formKey,
                controller: forgetConfirmPassController,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                verticalPad: screenHeight * 0.0202, //18,
              ),
              /************** Confirm Password ENDS here **********************/

              Button(
                onPress: () {
                  if (!_formKey.currentState!.validate()) {
                    snackBar("Missing required field");
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/login-screen', (route) => false);
                            },
                            child: Text(
                              "Return to Login",
                              style: TextStyle(
                                color: AppColor.textColor2,
                                fontSize: screenHeight * 0.01774, //18,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                        actionsAlignment: MainAxisAlignment.center,
                        content: const SmallText(
                          text: "Password has been changed Successfully",
                          textAlignName: TextAlign.center,
                        ),
                        icon: Icon(
                          Iconsax.tick_circle,
                          color: Colors.green,
                          size: screenHeight * 0.0449, //40,
                        ),
                      ),
                    );
                  }
                },
                width: screenWidth * 0.4861, //200,
                text: "Confirm",
                // fontFamily: "Inter",
                // fontSize: screenHeight * 0.01774, //18,
              ),
            ],
          ),
        ),
      ),
    );
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

  const PasswordTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.screenWidth,
    required this.screenHeight,
    this.verticalPad = 5,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
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
        validator: (value){
          if(controller.text.toString().isEmpty){
            return "Required Field";
          }
          return null;
        },
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

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.0243),
            borderSide: BorderSide(
              color: Colors.red,
              width: screenWidth * 0.00486,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.0243),
            borderSide: BorderSide(
              color:  Colors.red,
              width: screenWidth * 0.00486,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: verticalPad, horizontal: screenWidth * 0.0243 /*10*/),
        ),
      ),
    );
  }
}
