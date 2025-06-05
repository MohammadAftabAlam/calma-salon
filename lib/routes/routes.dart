import 'package:calma/screens/appointments/main_appointment_pg.dart';
import 'package:calma/screens/home/Experts/all_experts_near_user.dart';
import 'package:calma/screens/validation/login_screen.dart';
import 'package:calma/screens/validation/sign_up_screen.dart';
import 'package:calma/screens/validation/forget_password_screen.dart';

import 'package:calma/screens/profile/account_info.dart';
import 'package:calma/screens/profile/location_screen.dart';
import 'package:calma/screens/profile/profile_manager.dart';

import 'package:calma/screens/home/Experts/expert_detail_screen.dart';
import 'package:calma/screens/home/main_home_screen.dart';
import 'package:calma/screens/home/salon_search.dart';
import 'package:calma/screens/home/search_screen.dart';

import 'package:calma/screens/appointments/Appointment_Process/booking_calendar.dart';
import 'package:calma/screens/appointments/Appointment_Process/salon_detail_pg.dart';
import 'package:calma/screens/appointments/ButtonFunctions/cancel_button_pg.dart';
import 'package:flutter/cupertino.dart';

getRoute(BuildContext context) {
  // final args = ModalRoute.of(context)!.settings.arguments.;
  return {
    //Validation
    '/login-screen': (context) => const LoginScreen(),
    '/signup-screen': (context) => const SignUpPage(),
    '/forget-password-screen': (context) => const ForgetPasswordScreen(),

    //Home Screen
    '/main-home-screen': (context) => const MainHomeScreen(),
    '/search-page': (context) => const SearchPage(isUsingNavigator: true,),
    '/salon-search-page': (context) => const SalonSearchPage(),
    '/main-salon-show-page': (context) =>const MainSalonShowPage(),

    //Profile
    '/profile-manager': (context) => const ProfileManager(),
    '/account-info': (context) => const AccountInfo(),

    //Appointment
    '/appointments': (context) => const Appointments(),
    '/cancel-button': (context) => const CancelButtonPage(),
    '/booking-date-time': (context) => const BookingDateAndTime(),

    '/show-location-page': (context) => const ShowLocationPage(),
    'salon-expert-detail-page': (context) => const SalonExpertDetailScreen(),
    '/expert-view-all' : (context) => const AllExpertsNearUser()
  };
}
