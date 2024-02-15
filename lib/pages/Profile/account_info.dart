import 'package:calma/pages/Profile/profile_manager.dart';
import 'package:calma/utils/back_arrow_but_with_positioned.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/button.dart';
import 'package:flutter/material.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({super.key});

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Stack(
        children: [
          /* *************************** Back Arrow Button Starts Here *************************** */
          BackArrowButtonWithPositioned(
            positionedTop: 39.5,
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileManager()));
            },
          ),
          /* *************************** Back Arrow Button Ends Here *************************** */

          /* *************************** Account Info Text Starts Here *************************** */
          const Positioned(
            top: 42,
            left: 144,
            child: TitleText(text: "Account Info"),
          ),
          /* *************************** Account Info Text Ends Here *************************** */

          /* *************************** Personal Info Text Starts Here *************************** */
          const Positioned(
            left: 32,
            top: 115,
            child: TitleText(
              text: "Personal Information",
              fSize: 20,
            ),
          ),
          /* *************************** Personal Info Text Ends Here *************************** */

          /* *************************** Personal Info Container Starts Here *************************** */
          Positioned(
            top: 154,
            left: 25,
            child: Container(
              width: 360,
              height: 403,
              decoration: BoxDecoration(
                color: const Color(0xffFFFBFB),
                borderRadius: BorderRadius.circular(12),
              ),
              child:const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Name And their TextField starts here
                  PersonalInfoContainerText(text: "Name"),
                  AccTextFormField(
                    value: "Aftab Alam",
                  ),

                  /// Phone Number and their TextField Starts here
                  PersonalInfoContainerText(text: "Phone"),
                  AccTextFormField(value: "8092846469"),

                  /// Age and their TextField Starts here
                  PersonalInfoContainerText(text: "Age"),
                  AccTextFormField(
                    value: "20",
                  ),

                  /// Gender and their TextField Starts here
                  PersonalInfoContainerText(text: "Gender"),
                  AccTextFormField(
                    value: "Male",
                  ),
                ],
              ),
            ),
          ),
          /* *************************** Personal Info Container Ends Here *************************** */

          /* *************************** Password Manager Text Starts Here *************************** */
          const Positioned(
            left: 32,
            top: 568,
            child: TitleText(
              text: "Password Manager",
              fSize: 20,
            ),
          ),
          /* *************************** Password Manager Text Ends Here *************************** */

          /* *************************** Password Manager Container Starts Here *************************** */
          Positioned(
            left: 25,
            top: 609,
            child: Container(
                width: 360,
                height: 143,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFBFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PersonalInfoContainerText(
                      text: "Current Password",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 9),
                      child: TextFormField(
                        /// for showing the user password change here
                        initialValue: "Aftab@123",
                        readOnly: true,
                        obscureText: _passwordVisible,
                        // obscuringCharacter: "*",
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.textFormFieldColor,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _passwordVisible = !_passwordVisible;
                              setState(() {});
                            },
                            icon: Icon(
                              _passwordVisible == true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColor.iconColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffD3CECD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffD3CECD)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          /* *************************** Password Manager Container Ends Here *************************** */

          /* *************************** Update Button Starts Here *************************** */
          Positioned(
            top: 800,
            left: 30,
            child: Button(
              onPress: () {},
              text: "Update Account",
              height: 64,
              width: 360,
              fontFamily: "Inter",
              fontSize: 15,
              radius: 25,
            ),
          ),
          /* *************************** Update Button Ends Here *************************** */
        ],
      ),
    );
  }
}

/* **************************** Account Info Text Widget Starts here ************************** */
class TitleText extends StatelessWidget {
  final String text;
  final double fSize;
  const TitleText({
    super.key,
    required this.text,
    this.fSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: const Color(0xff374151),
          fontSize: fSize,
          fontFamily: "Inter",
          fontWeight: FontWeight.w600),
    );
  }
}
/* **************************** Account Info Text Widget Ends here ************************** */

/* **************************** Personal Container Text Widget Starts here ************************** */
class PersonalInfoContainerText extends StatelessWidget {
  final String text;
  final Color color;
  const PersonalInfoContainerText(
      {super.key, required this.text, this.color = const Color(0xff797979)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
/* **************************** Personal Container Text Widget Ends here ************************** */

/* **************************** TextFormField without suffix icon Widget Starts here ************************** */
class AccTextFormField extends StatelessWidget {
  final String value;
  const AccTextFormField({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 9),
      child: TextFormField(
        /// for showing the user password change here
        initialValue: value,
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.textFormFieldColor,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffD3CECD)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffD3CECD)),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
        ),
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
/* **************************** TextFormField without suffix icon Widget Starts here ************************** */



/*Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 9),
          child: TextFormField(
            /// for showing the user password change here
            initialValue: "8092846469",
            readOnly: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.textFormFieldColor,

              /// This is used to show password change page starts here
              suffix: InkWell(
                onTap: () {},
                child: const BigText(
                  text: "Change",
                  fontFamilyName: "Inter",
                  fontSize: 18,
                  color: Color(0xff177888),
                  fontWeightName: FontWeight.w600,
                ),
              ),
              /// This is used to show password change page Ends here

              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD3CECD)),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffD3CECD)),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 5, horizontal: 15),
            ),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
*/