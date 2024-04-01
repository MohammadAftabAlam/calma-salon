import 'dart:convert';

import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/pages/validation/forget_password_screen.dart';
import 'package:calma/utils/shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:http/http.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:calma/pages/validation/sign_up_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  sharedPreference() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isLogin', true);
  }

  bool isLoading = false;

  /* ********************** STARTS Fetching data from the server to validating the user ********************** */
  loginToYourAccountUsingCredentials() async {
    try {
      // This all i have to because api only accepts data in body raw format instead of form-data,
      //If api accepted data in form of form-data then only pass body in Responses
     setState(() {
       isLoading = true;
     });
      Map<String, String> credentials = {
        'phoneNumber': '+91${phoneNumberController.text}',
        'password': passwordController.text
      };

      Map<String, String> header = {"Content-Type": "application/json"};
      var body = jsonEncode(credentials);
      Response response = await http.post(
          Uri.parse("https://calmarepo-production.up.railway.app/api/login"),
          // body: {
          //   "phoneNumber" : phoneNumber,
          //   "password" : password
          // },
          body: body,
          headers: header,
      );
      if(response.statusCode == 200){
        // var data = jsonDecode(response.body.toString());
        // debugPrint(data['JWT Token']);
        return response.statusCode;
      }
    } catch (e) {
      // debugPrint("Md Aftab Alam Calma Application Exception " + e.toString());
    }
  }
  /* ********************** ENDS Fetching data from the server to validating the user ********************** */


  TapGestureRecognizer? _gestureRecognizer;
  bool isVisible = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpPage()));
      };
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          /// Calma Background Image STARTS here
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              // height: 470, // 360
              height: screenHeight * 0.5276, // 470
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/images/calmaBackGroundWomen.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          /// Calma Background Image ENDS here

          /// Calma Text STARTS here
          Positioned(
            left: screenWidth * 0.257, //106
            top: screenHeight * 0.034,
            child: BigText(
              text: "CALMA",
              fontSize: screenWidth * 0.1222 ,//109
              color: const Color(0xff418F9C),
            ),
          ),
          /// Calma Text ENDS here

          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            // top: 440,
            top: screenHeight *0.4939, //440

            /// Curved container that is on the images STARTS here
            child: Container(
              padding: EdgeInsets.only(
                left: screenWidth * 0.0487,
                right: screenWidth * 0.0487,
                // top: 5
                top: screenHeight * 0.0185,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(screenWidth * 0.0487),
                  topLeft: Radius.circular(screenWidth * 0.0487),
                ),
                // color: Colors.black,
                color: AppColor.mainBackgroundColor,
              ),

              /// Curved container that is on the images ENDS here

              child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    /// Animation Text STARTS Here
                    Row(
                      children: [
                        BigText(
                          text: "Schedule",
                          fontSize: screenWidth * 0.0878,
                          color: AppColor.mainBlackColor,
                          fontWeightName: FontWeight.bold,
                        ),
                        SizedBox(
                          width: screenWidth * 0.0439,
                        ),

                        /// Animation Text STARTS Here
                        AnimatedTextKit(
                          animatedTexts: [
                            typeWriterText("Haircut", screenWidth),
                            typeWriterText("facial", screenWidth),
                            typeWriterText("Make Up", screenWidth),
                            typeWriterText("& more", screenWidth),
                          ],
                          repeatForever: true,
                          pause: const Duration(milliseconds: 500),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: false,
                        ),
                      ],
                    ),

                    /// Animation Text ENDS Here

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColor.dividerColor1,
                            thickness: screenWidth * 0.00317,
                            endIndent: screenWidth * 0.0121,
                          ),
                        ),
                        SmallText(
                          text: " Login ",
                          color: AppColor.quoteColor,
                          fontSize: screenWidth * 0.0487,
                          fontWeightName: FontWeight.w500,
                        ),
                        Expanded(
                          child: Divider(
                            indent: screenWidth * 0.0121,
                            color: AppColor.dividerColor1,
                            thickness: screenWidth * 0.00317,
                          ),
                        ),
                      ],
                    ),

                    /// Phone Number TextFields STARTS here
                    // PhoneNumber(screenHeight: screenHeight, screenWidth: screenWidth, phoneNumberController: phoneNumberController),
                    // debugPrint(phoneNumberController.toString()),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.0368, //15
                        right: screenWidth * 0.0368, //15
                        top: screenHeight * 0.0225, //15
                        // bottom: screenHeight * 0.0225,  //15
                      ),
                      child: SizedBox(
                        height: screenHeight * 0.0988, //88
                        width: double.maxFinite,
                        child: IntlPhoneField(
                          controller: phoneNumberController,
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
                            labelStyle:
                                TextStyle(fontSize: screenWidth * 0.0387),
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
                              contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0119/*5*/,vertical: screenHeight *0.01684 /*15*/)
                          ),
                          initialCountryCode: 'IN',
                          // onChanged: (phone) {
                          //   userPhoneNumber = phone.completeNumber;
                          // },
                        ),
                      ),
                    ),

                    /// Password TextFields STARTS here
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.0368, //15
                        right: screenWidth * 0.0368, //15
                        // top: screenHeight * 0.005, //5
                        // bottom: screenHeight *0.0225,  //20
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: isVisible,
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
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                screenWidth * 0.0243 /*10*/),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0119/*5*/,vertical: screenHeight *0.01684 /*15*/)
                        ),
                      ),
                    ),

                    /// Password TextFields ENDS here

                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgetPasswordScreen()));
                          },
                          child: const Padding(
                            padding:
                                EdgeInsets.only(right: 20, top: 5, bottom: 15),
                            child: SmallText(
                              text: "Forget Password",
                            ),
                          ),
                        )),

                    LoginAndSignupButton(

                      widget: isLoading ? const CircularProgressIndicator(
                        strokeWidth: 4,
                        color: AppColor.mainBackgroundColor,
                      ):BigText(text: "Login",  textAlignName: TextAlign.center,

                        color: Colors.white,
                        fontWeightName: FontWeight.bold,
                        fontSize: screenHeight * 24 /screenHeight,
                        fontFamilyName: "Inter",
                      ),
                      onPress: () async {
                        debugPrint(passwordController.text.toString());
                        if (phoneNumberController.text.toString().length !=
                            10) {
                          snackBar("Please Enter your phone number");
                        } else if (passwordController.text.toString().isEmpty) {
                          snackBar("Password field can't be empty");
                        } else {
                         // debugPrint(phoneNumberController.text.toString());
                          var code = await loginToYourAccountUsingCredentials();
                          setState(() {
                            isLoading = !isLoading;
                          });
                          //debugPrint("Status Code: " + code.toString());
                          if (code == 200) {


                            ///This [sharedPreferencesDateStoring] is a class created by me and here for storing ['phoneNumber'] value locally
                           const SharedPreferencesDataStoring().sharedPreferences('+91${phoneNumberController.text}');

                            ///This [sharedPreferences()] is here for changing and storing ['isLogin'] value locally
                            sharedPreference();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainHomeScreen(),
                              ),
                            );
                          } else {
                            snackBar("Invalid Phone Number or password");
                          }
                        }
                      },
                      // fontFamily: "Inter",
                      // fontSize: 24,
                    ),
                    SizedBox(
                      height: screenHeight * 0.005, // 5,
                    ),
                    SizedBox(
                      height: screenHeight * 0.0225,
                    ),

                    /// Don't have Account Sign Up text STARTS here
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColor.dividerColor1,
                            endIndent: screenWidth * 0.0487,
                            thickness: screenWidth * 0.00317,
                          ),
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                fontSize: screenHeight * 0.016, //14
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Sign Up     ",
                              recognizer: _gestureRecognizer,
                              style: TextStyle(
                                fontSize: screenHeight * 0.016, //14
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                color: AppColor.textColor2,
                              ),
                            ),
                          ]),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColor.dividerColor1,
                            endIndent: screenWidth * 0.0487,
                            thickness: screenWidth * 0.00317, //1.3
                          ),
                        ),
                      ],
                    ),

                    /// Don't have Account Sign Up text ENDS here
                    SizedBox(
                      height: screenHeight * 0.0225,
                    ),

                    const SmallText(
                      text:
                          "By continue , you agree to  our Terms of service Privacy policy Content policy",
                      textAlignName: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// TypeWriterAnimatedText Function
  typeWriterText(String text, double screenWidth) {
    return TypewriterAnimatedText(
      text,
      textStyle: TextStyle(
        fontSize: screenWidth * 0.0878,
        fontWeight: FontWeight.bold,
        color: const Color(0xff8BBCC4),
      ),
      speed: const Duration(milliseconds: 90),
    );
  }
}

class LoginAndSignupButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget widget;
  final double height ,width,radius;
  final Color color;

  const LoginAndSignupButton({super.key,
    required this.onPress,
    required this.widget,
    this.height = 50,
    this.width = 345,
    this.color = AppColor.buttonBackgroundColor,
    this.radius = 8
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onPress,
      child: Container(
          height:  height == 50 ? screenHeight * 0.0561 : screenHeight * height/screenHeight,
          width: width == 345 ? screenWidth * 0.8385 : screenWidth * width /screenWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius == 8 ? screenHeight * 0.009: screenHeight*radius/screenHeight),
          ),
        child: Center(
          child: widget,
        )
      ),
    );
  }
}


/// Option for Login with G-mail or Facebook
/*  Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.00707,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenHeight * 0.0673,
                width: screenWidth * 0.145,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.0157,
                    vertical: screenHeight * 0.0157,
                  ),
                  child: const Image(
                    image: AssetImage("asset/images/google_logo.png"),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.072,
              ),
              Container(
                height: screenHeight * 0.0673,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Image(
                  image: AssetImage("asset/images/fbLogo.png"),
                ),
              ),
            ],
          ),
        ),
*/
/// Divider and Text and again Divider
/*Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.0141,
      ),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColor.dividerColor,
              endIndent: screenWidth * 0.0487,
              thickness: screenWidth * 0.00317,
            ),
          ),
          SmallText(
            text: "Don't have an account? Sign Up",
            color: AppColor.quoteColor,
            fontSize: screenWidth * 0.0487,
            fontWeightName: FontWeight.w400,
          ),
          Expanded(
            child: Divider(
              color: AppColor.dividerColor,
              indent: screenWidth * 0.0487,
              thickness: screenWidth * 0.00317,
            ),
          ),
        ],
      ),
    ),
*/

/// Phone Number with otp validation
/*import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:calma/pages/validation/sign_up_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/utils/dimensions.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userPhoneNumber = "";
  // var userPhoneNumber;
  @override
  Widget build(BuildContext context) {
    /* ******************Starts Removing shadow above the AppBar****************** */
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent
    // ));
    /* ******************Ends Removing shadow above the AppBar****************** */
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            // top: 20,
            // bottom: 20,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height350, //350
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/images/calmaBackGroundWomen.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
              left: Dimensions.width65, //65
              top: Dimensions.height30, //30
              child: BigText(
                text: "CALMA",
                fontSize: Dimensions.font64, //64
                color: const Color(0xff418F9C),
              )),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            top: Dimensions.height340, // 340
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20, //20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: AppColor.mainBackgroundColor,
              ),

              /* ****************** Column Widget for Rest items ******************** */
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    /******************Starts Schedule and Make Up Text******************/
                    Row(
                      children: [
                        SmallText(
                          text: "Schedule",
                          fontSize: Dimensions.font36,
                          color: AppColor.mainBlackColor,
                          fontWeightName: FontWeight.bold,
                        ),
                        SizedBox(
                          width: Dimensions.width18,
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Hair Cut',
                              // textAlign: TextAlign.right,
                              textStyle: TextStyle(
                                color: const Color(0xff8BBCC4),
                                fontSize: Dimensions.font36, //36
                                fontWeight: FontWeight.bold,
                              ),
                              speed: const Duration(milliseconds: 90),
                            ),
                            TypewriterAnimatedText(
                              "facial",
                              textStyle: TextStyle(
                                fontSize: Dimensions.font36,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff8BBCC4),
                              ),
                              speed: const Duration(milliseconds: 90),
                            ),
                            TypewriterAnimatedText(
                              "Make Up",
                              textStyle: TextStyle(
                                fontSize: Dimensions.font36,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff8BBCC4),
                              ),
                              speed: const Duration(milliseconds: 90),
                            ),
                            TypewriterAnimatedText("& more",
                                textStyle: TextStyle(
                                  fontSize: Dimensions.font36,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xff8BBCC4),
                                ),
                                cursor: '...',
                                speed: const Duration(milliseconds: 90)),
                          ],
                          repeatForever: true,
                          // totalRepeatCount: 4,
                          pause: const Duration(milliseconds: 500),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: false,

                        ),
                      ],
                    ),
                    /******************Ends Schedule and Make Up Text******************/

                    /***************************Starts (Login / SignUp) Divider ********************** */
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColor.dividerColor,
                            thickness: Dimensions.thickness1Dot3, //1.3
                            endIndent: Dimensions.width5,
                          ),
                        ),
                        SmallText(
                          text: "Login or Sign Up",
                          color: AppColor.quoteColor,
                          fontSize: Dimensions.font20,
                          fontWeightName: FontWeight.w400,
                        ),
                        Expanded(
                          child: Divider(
                            indent: Dimensions.width5,
                            color: AppColor.dividerColor,
                            thickness: Dimensions.thickness1Dot3, //1.3
                          ),
                        ),
                      ],
                    ),
                    /***************************Ends (Login / SignUp) Divider ********************** */

                    /**********************Starts Phone Number with Country Code************** */
                    Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width15,
                          right: Dimensions.width15,
                          top: Dimensions.height15,
                          bottom: Dimensions.height15),
                      child: SizedBox(
                        height: Dimensions.height88,
                        width: double.maxFinite,

                        child: IntlPhoneField(
                          style: TextStyle(fontSize: Dimensions.font16),
                          dropdownTextStyle:
                              TextStyle(fontSize: Dimensions.font16,
                              ),
                          invalidNumberMessage: "Invalid Phone Number",
                          dropdownIcon: Icon(
                            Icons.arrow_drop_down,
                            size: Dimensions.font24,
                          ),

                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(fontSize: Dimensions.font16),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius10),
                              borderSide: BorderSide(
                                color: AppColor.buttonBackgroundColor,
                                width: Dimensions.width2, //2
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius10),
                              borderSide: BorderSide(
                                color: AppColor.buttonBackgroundColor,
                                width: Dimensions.width2, //2
                              ),
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            // print(phone.completeNumber);
                            userPhoneNumber = phone.completeNumber;
                          },
                        ),
                      ),
                    ),
                    /* *********************Ends Phone Number with Country Code************** */

                    /* *************************Start Elevated OTP Button********************** */
                    //This button is created by me, if want see in widget directory
                    Button(
                        onPress: () {
                          if (userPhoneNumber.length != 13) {
                            snackBar("Invalid Phone Number");
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OtpVerification()));
                          }
                        },
                        text: "Get OTP"),
                    /* *************************Ends Elevated OTP Button********************** */

                    /* **************************Starts (Or) Divider ********************** */
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Dimensions.height10),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColor.dividerColor,
                              endIndent: Dimensions.width20, //20
                              thickness: Dimensions.thickness1Dot3, //1.3
                            ),
                          ),
                          SmallText(
                            text: "Or",
                            color: AppColor.quoteColor,
                            fontSize: Dimensions.font20,
                            fontWeightName: FontWeight.w400,
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColor.dividerColor,
                              indent: Dimensions.width20, //20
                              thickness: Dimensions.thickness1Dot3, //1.3
                            ),
                          ),
                        ],
                      ),
                    ),
                    /* ************************** Ends (Or) Divider ********************** */

                    /* ***************************Starts Google and Facebook Icons for Login ************ */
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: Dimensions.height5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: Dimensions.height60, //60
                            width: Dimensions.width60,

                            // height : 100,
                            // width: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Dimensions.width6Dot5,vertical: Dimensions.height6Dot5),
                              child: Image(
                                image: AssetImage("asset/images/google_logo.png"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width30, //30
                          ),
                          Container(
                            height: Dimensions.height60, //60
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Image(
                              image: AssetImage("asset/images/fbLogo.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    /* ***************************Ends Google and Facebook Icons for Login ************ */

                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    /* **********Starts Terms and Condition ************* */
                    const SmallText(
                      text:
                          "By continue , you agree to  our\nTerms of service Privacy policy Content policy",
                      textAlignName: TextAlign.center,
                    ),
                    /* **********End Terms and Condition ************* */
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.buttonBackgroundColor,
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
 */

/// Don't have an account Sign Up Button
/* Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
                fontSize: screenHeight * 0.016,  //14
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                color: Colors.black,
            ),
          ),
          TextSpan(
            text: "Sign Up     ",
            recognizer: _gestureRecognizer,
            style: TextStyle(
                fontSize: screenHeight * 0.016,  //14
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                color: AppColor.textColor2,
            ),
          ),
        ]),
      ),
    ),
*/
