import 'dart:convert';

import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/pages/validation/login_screen.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

List<String> genderList = <String>["Male", "Female"];
List<String> userTypeList = <String>["Customer", "Salon Owner"];

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  bool? isLoggedIn;
  sharedPreference() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isLogin', true);
  }

  final _formKey = GlobalKey<FormState>();
  DateTime? datePicked;

  String genderDropdownValue = genderList.first;
  String userTypeDropdownValue = userTypeList.first;
  bool isVisible = true;
  bool isLoading = false;
  bool isOtpVerificationLoading = false;


  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // bool loading = false;
  // late String phoneNumber1 = '+91 ${phoneNumberController.text.substring(0,4)} ${phoneNumberController.text.substring(4,7)} ${phoneNumberController.text.substring(7)}';

  /* ************************ HTTP Request to register user STARTS here ********************* */
  Future<dynamic> createUser() async {
    try {
      setState(() {
        isLoading = true;
      });

      String url = "https://calmarepo-production.up.railway.app/api/register";
      Map<String, String> userDetails = {
        "phoneNumber": '+91${phoneNumberController.text}',
        "userType": userTypeDropdownValue.toUpperCase(),
        "name": nameController.text,
        "password": confirmPasswordController.text,
        "age": ageController.text,
        "email": emailController.text,
        "location": "Delhi",
        "gender": genderDropdownValue
      };

      var body = jsonEncode(userDetails);
      Map<String, String> header = {
        "Content-Type": "application/json",
      };
      http.Response response = await http.post(
        Uri.parse(url),
        body: body,
        headers: header,
      );
      // String data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
      }
      /* *********** Bad Request code 400 *********** */
      else if (response.statusCode == 400) {
        snackBar(
            "Oops! This email or phone number is already registered. Please try another");
      }
      setState(() {
        isLoading = false;
    });
      return response.statusCode;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  /* ************************ HTTP Request to register user ENDS here ********************* */

  Future<dynamic> otpVerification() async {
    setState(() {
      isOtpVerificationLoading = true;
    });
    http.Response response = await http.post(
      Uri.parse(
          "https://calmarepo-production.up.railway.app/verify-otp?email=${emailController.text}&enteredOTP=${otpController.text}"),
    );
    // if(response.statusCode == 400){
    //   snackBar("Oops! Invalid OTP,Try again");
    // }
    setState(() {
      isOtpVerificationLoading = false;
    });
    debugPrint(response.statusCode.toString());
    return response.statusCode;
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    nameController.dispose();
    ageController.dispose();
    genderController.dispose();
    emailController.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*******************Back Arrow Button and Logo Of the application STARTS here ******************/
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 20),
                    child: BackArrowButton(onPress: () {
                      Navigator.pop(context);
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.1215 /*50*/,
                        top: screenHeight * 0.0562 /*50*/),
                    child: Container(
                      height: 100,
                      width: 167,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("asset/images/calmaLogo.png"))),
                    ),
                  ),
                ],
              ),
              /*******************Back Arrow Button Logo of the application ENDS here ******************/
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, bottom: 10),
                  child: Text(
                    "Create your profile to get started",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xff414141)),
                  ),
                ),
              ),

              /// Name TextField STARTS HERE
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
                  bottom: screenHeight * 0.0225, //20
                  top: screenHeight * 0.005, //5
                ),
                child: TextFormField(
                  controller: nameController,
                  cursorColor: AppColor.imageBgColor,
                  validator: (value) {
                    if (nameController.text.toString().isEmpty) {
                      return "Enter your full name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                    isDense: true,
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.0343 /*10*/),
                      child: SvgPicture.asset(
                        'asset/icons/userIcon.svg',
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: screenWidth * 0.00486,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(screenWidth * 0.0243 /*10*/),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: screenWidth * 0.00486,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.005, //5,
                        horizontal: screenWidth * 0.0243 /*10*/
                        ),
                  ),
                ),
              ),

              /// Name TextFields ENDS HERE

              /* ************************ AGE TextFields STARTS HERE********************* */
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
                  bottom: screenHeight * 0.0225, //20
                  top: screenHeight * 0.005, //5
                ),
                child: TextFormField(
                  controller: ageController,
                  cursorColor: AppColor.imageBgColor,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (ageController.text.isEmpty) {
                      return "Enter your Age";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Age",
                      isDense: true,
                      suffixIcon: _pickYourAge(context),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.0243),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: screenWidth * 0.00486,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.0243 /*10*/),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: screenWidth * 0.00486,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: screenWidth * 0.0243 /*10*/,
                      )),
                ),
              ),
              /* ************************ AGE TextFields ENDS HERE********************* */

              ///Gender [SelectionTextField] STARTS here
              SizedBox(
                // width: 300,
                height: 80,
                child: DropdownButtonFormField(
                  isDense: true,
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.0368, //15
                    right: screenWidth * 0.0368, //15
                    bottom: screenHeight * 0.0225, //20
                    top: screenHeight * 0.005, //5
                  ),
                  value: genderDropdownValue,
                  items:
                      genderList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      genderDropdownValue = value!;
                    });
                  },
                  borderRadius: BorderRadius.circular(15),
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: AppColor.iconColor,
                  ),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10)),
                ),
              ),

              ///Gender [SelectionTextField] ENDS here

              /// User Type [SelectionTextField] STARTS here
              SizedBox(
                height: 80,
                child: DropdownButtonFormField(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.0368, //15
                    right: screenWidth * 0.0368, //15
                    bottom: screenHeight * 0.0225, //20
                    top: screenHeight * 0.005, //5
                  ),
                  // onSaved: (String? value){
                  //   if(value == userTypeList.last.toString()){
                  //     debugPrint(value);
                  //   }
                  // },
                  value: userTypeList.first,
                  items: userTypeList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      userTypeDropdownValue = value!;
                    });
                  },
                  borderRadius: BorderRadius.circular(15),
                  icon: const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: AppColor.iconColor,
                  ),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.0243 /*10*/),
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
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2)),
                ),
              ),

              /// User [SelectionTextField] ENDS here

              /// Phone Number fields STARTS HERE
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
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
                    validator: (val) {
                      if (phoneNumberController.text.isEmpty) {
                        return "Enter valid phone number";
                      }
                      return null;
                    },
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
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.0243),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: screenWidth * 0.00486,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              screenWidth * 0.0243 /*10*/),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: screenWidth * 0.00486,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12)),
                    initialCountryCode: 'IN',
                    // onChanged: (phone) {
                    //   userPhoneNumber = phone.completeNumber;
                    // },
                  ),
                ),
              ),

              /// Phone Number fields ENDS HERE

              /* ********************* Email TextField Starts Here************************* */
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
                  bottom: screenHeight * 0.0225, //20
                  top: screenHeight * 0.005, //5
                ),
                child: TextFormField(
                  controller: emailController,
                  cursorColor: AppColor.imageBgColor,
                  validator: (String? value) {
                    String email = emailController.text.toString();
                    if (!email.contains('@') || !email.endsWith("gmail.com")) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    isDense: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, bottom: 5, top: 3, right: 8),
                      child: SvgPicture.asset(
                        "asset/icons/email-1.svg",
                        height: 2,
                        width: 5,
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.0243),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: screenWidth * 0.00486,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(screenWidth * 0.0243 /*10*/),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: screenWidth * 0.00486,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: screenWidth * 0.0243 /*10*/,
                    ),
                  ),
                ),
              ),
              /* ********************* Email TextField Ends Here************************* */

              /// Password Fields STARTS HERE
              ///
              ///
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
                  bottom: screenHeight * 0.0225, //20
                  top: screenHeight * 0.005, //5
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Iconsax.lock),
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
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                ),
              ),

              /// Password Fields ENDS HERE

              /// Confirm Password Fields STARTS HERE
              Padding(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.0368, //15
                  right: screenWidth * 0.0368, //15
                  bottom: screenHeight * 0.0225, //20
                  top: screenHeight * 0.005, //5
                ),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
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
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  ),
                ),
              ),

              /// Confirm Password Fields ENDS HERE

              SizedBox(
                height: screenHeight * 0.0112,
              ),
              LoginAndSignupButton(
                onPress: () async {
                  // debugPrint(nameController.text.toString());
                  // debugPrint(ageController.text.toString());
                  // debugPrint(genderDropdownValue.toString());
                  // debugPrint(userTypeDropdownValue.toString());
                  // debugPrint(phoneNumberController.text.toString());
                  // debugPrint(passwordController.text.toString());
                  // debugPrint(confirmPasswordController.text.toString());

                  if (!_formKey.currentState!.validate()) {
                    snackBar("Missing required field");
                  }
                  // if (nameController.text.toString().isEmpty) {
                  //   snackBar("Name can't be empty");
                  // }
                  // else if (genderDropdownValue.toString() == genderList.first) {
                  //   snackBar("Select your gender");
                  // } else if (userTypeDropdownValue.toString() ==
                  //     userTypeList.first) {
                  //   snackBar("Select your user type");
                  // } else if (phoneNumberController.text.toString().length != 10) {
                  //   snackBar("Phone Number can't be empty");
                  // }

                  // else if (passwordController.text.toString().isEmpty) {
                  //   snackBar("Password field can't be empty");
                  // } else if (confirmPasswordController.text.toString().isEmpty) {
                  //   snackBar("Re-Enter your password");
                  // }

                  else if (!(passwordController.text.toString() ==
                      confirmPasswordController.text.toString())) {
                    snackBar("Password doesn't match");
                  } else {
                    if (_formKey.currentState!.validate()) {
                      var statusCode = await createUser();

                      if (statusCode == 200) {
                        _showModalBottomSheet(screenHeight);
                      } else {
                        // snackBar( " Status code: " + statusCode.toString() + "Something went wrong");
                      }
                    }
                  }
                },
                widget: isLoading
                    ? const CircularProgressIndicator(
                        strokeWidth: 4,
                        color: AppColor.mainBackgroundColor,
                      )
                    : BigText(
                        text: "SignUp",
                        textAlignName: TextAlign.center,
                        color: Colors.white,
                        fontWeightName: FontWeight.bold,
                        fontSize: screenHeight * 18 / screenHeight,
                        fontFamilyName: "Inter",
                      ),
                width: 200,
                // text: "Sign Up",
                // fontFamily: "Inter",
                // fontSize: 18,
              ),
              SizedBox(
                height: screenHeight * 0.0224,
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
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 10,
        right: 10,
      ),
    ));
  }

  /* ***************************** Date Picker for Age STARTS here ***************************** */
  _pickYourAge(context) {
    return InkWell(
      onTap: () async {
        var currentDate = DateTime.now();
        datePicked = await showDatePicker(
            context: context,
            firstDate: DateTime(1970),
            lastDate: currentDate,
            initialDate: currentDate);
        if (datePicked != null) {
          var age = currentDate.year - datePicked!.year;
          setState(() {
            ageController.text = age.toString();
          });
        }
      },
      child: const Icon(
        Iconsax.calendar5,
        color: AppColor.iconColor,
      ),
    );
  }
  /* ***************************** Date Picker for Age ENDS here ***************************** */

  /* ***************************** OTP verification BottomSheet STARTS here ***************************** */
  _showModalBottomSheet(double screenHeight,) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 200,
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Please Enter OTP sent on ${emailController.text}",
                    style: const TextStyle(
                        // color: Color(0xff465656ff),
                        fontSize: 15,
                        fontFamily: "Inter"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: PinCodeTextField(
                      appContext: context,
                      controller: otpController,
                      length: 6,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  LoginAndSignupButton(
                    onPress: () async {
                      dynamic statusCode = await otpVerification();
                      // setState(() {
                      //   isOtpVerificationLoading = !isOtpVerificationLoading;
                      //   debugPrint(isOtpVerificationLoading.toString());
                      // });
                      if (statusCode == 200) {
                        sharedPreference();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainHomeScreen()));
                      } else if (statusCode == 400) {
                        snackBar("Oops! Invalid OTP, try again");
                      }
                    },
                    widget: isOtpVerificationLoading
                        ? const CircularProgressIndicator(
                      strokeWidth: 4,
                      color: AppColor.mainBackgroundColor,
                    )
                        :  BigText(
                      text: "SignUp",
                      textAlignName: TextAlign.center,
                      color: Colors.white,
                      fontWeightName: FontWeight.bold,
                      fontSize: screenHeight * 18 / screenHeight,
                      fontFamilyName: "Inter",
                    ),
                    width: 200,

                    //
                    // final credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: phoneNumberController.text.toString());
                    // try{
                    //   await _auth.signInWithCredential(credential);
                    //   Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const HomeScreen(),
                    //     ),
                    //   );
                    //   // setState(() {
                    //   //   loading = true;
                    //   // });
                    // }catch(e){
                    //   snackBar(e.toString());
                    //   setState(() {
                    //     loading = false;
                    //   });
                    // }
                  ),
                ],
              ),
            ),
          );
        });
  }
  /* ***************************** OTP verification BottomSheet ENDS here ***************************** */
}

/// Password Field
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
// import 'package:calma/pages/home/home_screen.dart';
// import 'package:calma/utils/back_arrow_but_with_positioned.dart';
// import 'package:calma/utils/colors.dart';
// import 'package:calma/widgets/big_text.dart';
// import 'package:calma/widgets/button.dart';
// import 'package:calma/widgets/small_text.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:shared_preferences/shared_preferences.dart';

/*
class OtpVerification extends StatefulWidget {
  final String phoneNumberController;
  final String verificationId;
  const OtpVerification({super.key, required this.verificationId, required this.phoneNumberController});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  var currentText = "";
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var phoneNumber = "";
  @override
  void initState() {
    super.initState();
    phoneNumber =  '+91 ${widget.phoneNumberController.substring(0,3)} ${widget.phoneNumberController.substring(4,7)} ${widget.phoneNumberController.substring(8,10)}';
  }
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
                        }
                        // else {
                        //   SharedPreferences sp = await SharedPreferences.getInstance();
                        //   sp.setBool('isLogin', true);
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const HomeScreen()));
                        // }


                        final credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: phoneNumber);
                        try{
                          await _auth.signInWithCredential(credential);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                          // setState(() {
                          //   loading = true;
                          // });
                        }catch(e){
                          snackBar(e.toString());
                          setState(() {
                            loading = false;
                          });
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
*/
/* *************** Login ******************* */
// void login(bool loginState) async{
//   SharedPreferences sp = await SharedPreferences.getInstance();
//   sp.setBool('isLogin', false);
//
//   sp.setBool('isLogin', loginState);
// }
//}
