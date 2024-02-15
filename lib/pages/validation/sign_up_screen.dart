import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

List<String> genderList = <String>["Select Gender","Male", "Female"];
List<String> userTypeList = <String>["Select your User Type","User", "Salon Owner"];

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String genderDropdownValue = genderList.first;
  String userTypeDropdownValue = userTypeList.first;

  @override
  Widget build(BuildContext context) {
  final screenHeight = MediaQuery.sizeOf(context).height;
  final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*******************Back Arrow Button and Logo Of the application STARTS here ******************/
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0,left: 20),
                  child: BackArrowButton(onPress: (){
                    Navigator.pop(context);
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:50 ,top: 50),
                  child: Container(
                    height: 100,
                    width: 167,
                    decoration:const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/images/calmaLogo.png")
                      )
                    ),
                  ),
                ),
              ],
            ),
            /*******************Back Arrow Button Logo of the application ENDS here ******************/
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 18.0,bottom: 10),
                child: Text("Create your profile to get started",
                  style: TextStyle(fontFamily: "Inter",fontWeight: FontWeight.w600, fontSize: 20,color: Color(0xff414141)),),
              ),
            ),

            /// Name TextField STARTS HERE
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.0368,  //15
                right: screenWidth * 0.0368, //15
                bottom: screenHeight *0.0225,  //20
                top: screenHeight * 0.005,  //5
              ),
              child: TextFormField(
                controller: nameController,
                cursorColor: AppColor.imageBgColor,
                // obscureText: isVisible,
                decoration: InputDecoration(
                  hintText: "Name",
                  isDense: true,
                  suffixIcon: Icon(Icons.person,color: AppColor.iconColor),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10)
                ),
              ),
            ),
            /// Name TextFields ENDS HERE

            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.0368,  //15
                right: screenWidth * 0.0368, //15
                bottom: screenHeight *0.0225,  //20
                top: screenHeight * 0.005,  //5
              ),
              child: TextFormField(
                controller: ageController,
                cursorColor: AppColor.imageBgColor,
                decoration: InputDecoration(
                  hintText: "Age",
                  isDense: true,
                  suffixIcon: Icon(Iconsax.calendar5, color: AppColor.iconColor,),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10)
                ),
              ),
            ),

            ///Gender [SelectionTextField] STARTS here
            SizedBox(
              // width: 300,
              height: 80,
              child: DropdownButtonFormField(
                isDense: true,
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368,  //15
                  right: screenWidth * 0.0368, //15
                  bottom: screenHeight *0.0225,  //20
                  top: screenHeight * 0.005,  //5
                ),
                value: genderDropdownValue,
                items: genderList.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
              }).toList(),
                onChanged: (value){
                  setState(() {
                    genderDropdownValue = value!;
                  });
                },
                borderRadius: BorderRadius.circular(15),
                icon: const Icon(Icons.arrow_drop_down_outlined,color: AppColor.iconColor,),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
                  contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10)
                ),
              ),
            ),
            ///Gender [SelectionTextField] ENDS here

            /// User [SelectionTextField] STARTS here
            SizedBox(
              height: 80,
              child: DropdownButtonFormField(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368,  //15
                  right: screenWidth * 0.0368, //15
                  bottom: screenHeight *0.0225,  //20
                  top: screenHeight * 0.005,  //5
                ),
                // onSaved: (String? value){
                //   if(value == userTypeList.last.toString()){
                //     debugPrint(value);
                //   }
                // },
                value: userTypeList.first,
                items: userTypeList.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
              }).toList(),
                onChanged: (value){
                  setState(() {
                    userTypeDropdownValue = value!;
                  });
                },
                borderRadius: BorderRadius.circular(15),
                icon: const Icon(Icons.arrow_drop_down_outlined,color: AppColor.iconColor,),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
                    errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2)
                ),
              ),
            ),
            /// User [SelectionTextField] ENDS here

            /// Phone Number fields STARTS HERE
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.0368,  //15
                right: screenWidth * 0.0368, //15
                // top: screenHeight * 0.0225, //15
                // bottom: screenHeight * 0.0225,  //15
              ),
              child: SizedBox(
                // height: screenHeight * 0.0898,  //88
                height: 70,
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 12)
                  ),
                  initialCountryCode: 'IN',
                  // onChanged: (phone) {
                  //   userPhoneNumber = phone.completeNumber;
                  // },
                ),
              ),
            ),
            /// Phone Number fields ENDS HERE

            /// Password Fields STARTS HERE
            PasswordTextField(text: 'Password',controller: passwordController,screenHeight: screenHeight,screenWidth: screenWidth,),
            /// Password Fields ENDS HERE

            /// Confirm Password Fields STARTS HERE
            PasswordTextField(text: 'Confirm Password',controller: confirmPasswordController,screenHeight: screenHeight,screenWidth: screenWidth,),
            /// Confirm Password Fields ENDS HERE

            const SizedBox(height: 25,),
            Button(
              onPress: (){
                debugPrint(nameController.text.toString());
                debugPrint(ageController.text.toString());
                debugPrint(genderDropdownValue.toString());
                debugPrint(userTypeDropdownValue.toString());
                debugPrint(phoneNumberController.text.toString());
                debugPrint(passwordController.text.toString());
                debugPrint(confirmPasswordController.text.toString());

                if(nameController.text.toString().isEmpty){
                  snackBar("Name can't be empty");
                }
                else if(genderDropdownValue.toString() == genderList.first){
                  snackBar("Select your gender");
                }
                else if(userTypeDropdownValue.toString() == userTypeList.first){
                  snackBar("Select your user type");
                }
                else if(phoneNumberController.text.toString().length != 10){
                  snackBar("Phone Number can't be empty");
                }
                else if(passwordController.text.toString().isEmpty){
                  snackBar("Password field can't be empty");
                }
                else if(confirmPasswordController.text.toString().isEmpty){
                  snackBar("Re-Enter your password");
                }
                else if(!(passwordController.text.toString() == confirmPasswordController.text.toString())){
                  snackBar("Password doesn't match");
                }
                else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                }
              },
              width: 200,
              text: "Sign Up",
              fontFamily: "Inter",
              fontSize: 18,
            ),
          ],
        ),
      ),
    );

  }
  snackBar(String? message){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message!),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
      dismissDirection: DismissDirection.up,
    ));

  }
}


/// Password Field
class PasswordTextField extends StatelessWidget {
  final double screenHeight, screenWidth,verticalPad;
  final TextEditingController controller;
  final String text;
  const PasswordTextField({super.key,required this.text, required this.controller, required this.screenWidth, required this.screenHeight, this.verticalPad = 5});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.0368,  //15
        right: screenWidth * 0.0368, //15
        bottom: screenHeight *0.0225,  //20
        top: screenHeight * 0.005,  //5
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
              borderRadius:
              BorderRadius.circular(screenWidth * 0.0243),
              borderSide: BorderSide(
                color: AppColor.buttonBackgroundColor,
                width: screenWidth * 0.00486,
              ),
            ),
            contentPadding:  EdgeInsets.symmetric(vertical: verticalPad,horizontal: 10)
        ),
      ),
    );
  }
}







/// Password TextField
/*  Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.0368,  //15
          right: screenWidth * 0.0368, //15
          bottom: screenHeight *0.0225,  //20
          top: screenHeight * 0.005,  //5
        ),
        child: TextFormField(
          controller: confirmPasswordController,
          obscureText: true,
          cursorColor: AppColor.imageBgColor,
          decoration: InputDecoration(
            hintText: "Confirm Password",
            prefixIcon: const Icon(Iconsax.lock),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10)
          ),
        ),
      ),
*/

/// OTP Verification Page
/*import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/button.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVerification extends StatefulWidget {
  // final String phoneNumber;
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  var currentText = "";
  @override
  Widget build(BuildContext context) {

    Future<SharedPreferences> sharedPreferences =  SharedPreferences.getInstance();
    // sharedPreferences.setBool('isLogin', true);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColor.mainBackgroundColor,
        body: Stack(
          children: [
            BackArrowButton(onPress: () {
              Navigator.pop(context);
            }),
            Positioned(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: screenHeight * 0.292 /*260*/),
                      child: Center(
                        child: BigText(
                          text: "Enter OTP",
                          fontSize: screenHeight * 0.040, //36
                        ),
                      ),
                    ),
                    // const SmallText(text: "OTP has sent on "+phoneNumber),

                    /* ************************ OTP Boxes Starts Here************************ */
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.061, //25
                          top: screenHeight * 0.034, //30
                          right: screenWidth * 0.061, //25
                          bottom: screenHeight * 0.0167, //15
                      ),
                      child: PinCodeTextField(
                        keyboardType: TextInputType.number,
                        appContext: context,
                        length: 6,
                        cursorColor: AppColor.titleColor,
                        cursorHeight: screenHeight * 0.028, //25
                        textStyle: TextStyle(
                          fontSize: screenHeight * 0.022, //20
                        ),
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius:
                                BorderRadius.circular( screenHeight *0.011 /*10*/),
                            fieldHeight: screenHeight * 0.056, //50
                            fieldWidth: screenWidth *0.109, // 45
                            inactiveColor: AppColor.iconColor,
                            activeColor: AppColor.buttonBackgroundColor,
                            selectedColor: Colors.red),
                        animationType: AnimationType.fade,
                        onChanged: (value) {
                          debugPrint(value);
                          currentText = value;
                          setState(() {
                            // currentText = value;
                            // debugPrint(currentText.toString());
                          });
                        },
                      ),
                    ),
                    /* ************************ OTP Boxes Ends Here************************ */

                    /* ************************ Button Starts Here************************ */
                    Button(
                      onPress: () async {
                        if (currentText.length < 6) {
                          snackBar("Please Enter valid OTP");
                        } else {
                          SharedPreferences sp = await SharedPreferences.getInstance();
                          sp.setBool('isLogin', true);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }
                      },
                      text: "Continue",
                      width: screenWidth * 0.851, //350
                    ),
                    /* ************************ Button Ends Here************************ */

                    /* ************************ Resend OTP Starts Here************************ */
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth *0.036/*15*/),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              snackBar("OTP sent Successfully");
                            },
                            child: SmallText(
                              text: "Resend OTP",
                              color: AppColor.quoteColor,
                              fontSize: screenHeight * 0.018, //16
                            )),
                      ),
                    ),
                    /* ************************ Resend OTP Ends Here************************ */
                  ],
                ),
              ),
            )
          ],
        ));
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

  /* *************** Login ******************* */
  // void login(bool loginState) async{
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   sp.setBool('isLogin', false);
  //
  //   sp.setBool('isLogin', loginState);
  // }
}
*/