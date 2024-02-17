import 'package:calma/pages/Appointments/Appointment%20Status/booked_services.dart';
import 'package:calma/pages/Profile/account_info.dart';
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
                onPress: () {},
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
                  _showBottomLogoutButton();
                },
                text: "Logout",
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                child: SmallText(
                    textAlignName: TextAlign.center,
                    fontFamilyName: "Rale way",
                    fontStyleName: FontStyle.italic,
                    fontSize: 28,
                    color: AppColor.quoteColor,
                    text:
                    '“The only constant in life is change." - Heraclitus'),
              ),
            ],
          ),
        ],
      ),
    );
  }

///******** Function to show the BottomSheet For logout Purpose STARTS here*********************/
  void _showBottomLogoutButton(){
    showModalBottomSheet(context: context, builder: (context)=>Container(
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      height: 250,
      child: Column(
            children: [
              const Icon(Iconsax.info_circle, color: Colors.grey,size: 80,),
              const SizedBox(height: 5,),
              const BigText(text: "Logout",fontSize: 24,fontFamilyName: "Inter",color: Color(0xff374151),),
              const SizedBox(height: 5,),

              const SmallText(text:"Are you sure, you want to logout ?",color: Color(0xff374151),),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                AppointmentPageButtonAll(onPress: (){Navigator.pop(context);}, text: "Cancel"),
                AppointmentPageButtonAll(onPress: () async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  debugPrint(sp.getBool('isLogin').toString());
                  sp.setBool('isLogin', false);
                  debugPrint(sp.getBool('isLogin').toString());
                }, text: "Logout"),
              ],),
              
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
    return Padding(
      padding: EdgeInsets.only(
        left: paddingLeft,
        right: paddingRight,
        top: paddingTop,
      ),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: height,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
              borderRadius: BorderRadius.circular(radius)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: text,
                  fontSize: fontSize,
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
