import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';

class VitalInformationRegardingApp extends StatefulWidget {
  const VitalInformationRegardingApp({
    super.key,
    this.isPrivacyPolicySection = false,
    this.isAboutUsSection = false,
    this.isContactUsSection = false,
  });
  final bool isAboutUsSection;
  final bool isContactUsSection;
  final bool isPrivacyPolicySection;

  @override
  State<VitalInformationRegardingApp> createState() =>
      __VitalInformationRegardingAppState();
}

class __VitalInformationRegardingAppState
    extends State<VitalInformationRegardingApp> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    String activePageTitle = "Privacy Policy";

    Widget privacyPolicyContent = Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SmallText(
            text: "Effective Date: 30th December, 2024",
            softWrap: true,
            textAlignName: TextAlign.left,
            fontSize: 16,
          ),
          SizedBox(height: screenHeight * 0.0098 //10,
              ),
          subtitleText(
            "Welcome to CALMA! Your privacy is critically important to us, and we are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and share your data when you use our app.",
          ),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("1. Information We Collect"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),
          const SmallText(
            text:
                "We collect the following information from users:\nPersonal Details: Name, phone number, email ID.\nlocation data: Live location (via Google API) and user-saved locations.\nUsage data: Actions performed within the app (e.g., appointment bookings).",
            softWrap: true,
          ),
// Text("We collect the following information from users:\nPersonal Details: Name, phone number, email ID.\nLocation Data: Live location (via Google API) and user-saved locations.\nUsage Data: Actions performed within the app (e.g., appointment bookings)."),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("2. How We Use Your Information"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),
          subtitleText(
            "We use the information to:\nProvide app functionality, such as location-based salon listings and appointment bookings.\nCustomize user experience based on preferences and locations.\nFacilitate payments via Razorpay.",
          ),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("3. location Tracking"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),

          subtitleText(
              "CALMA uses Google API to track your live location when the app is in use.\nDefault location is set based on live coordinates but can be manually updated.\nUsers can control location access settings (e.g., 'while using the app', 'always allow,' or 'don't allow'"),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("4. Payment Processing"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),

          subtitleText(
              "Payments are processed securely through Razorpay.\nBasic payment-related details may be shared with Razorpay to complete transactions."),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("5. Information Sharing"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),

          subtitleText(
              "We share information only with:\nGoogle API: For live location tracking.\nRazorpay: For payment processing.\n\nWe do not share your information with any analytics tools, marketing platforms, or third-party advertisers."),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("6. data Storage and Security"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),

          subtitleText(
              "All user data is encrypted and stored securely.\nWe follow industry-standard measures to prevent unauthorized access."),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("7. User Rights"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),

          subtitleText(
              "You have the right to, Access, update, or delete your personal information within the app.Withdraw consent for location tracking at any time."),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("8. Changes to This Privacy Policy"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),

          subtitleText(
              "We may update this Privacy Policy periodically. Any changes will be communicated through the app."),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("9. Contact Us"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),

          subtitleText(
              "For questions or concerns about this Privacy Policy, contact us at:"),

          const SmallText(
            text: "\nName: Mohd. Azam Khan",
            fontWeightName: FontWeight.bold,
          ),
          subtitleText("Designation: Founder & CEO"),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                    text: "Operational Email: ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "query.calma@gmail.com",
                    style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),

          subtitleText(
              "\nName: Md Aftab Alam\nDesignation: Founder & COO"),

          subtitleText(
              "\nName: Yazdan Haider Khan\nDesignation: Founder & COO"),
        ],
      ),
    );
    Widget aboutUsContent = Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SmallText(
            text:
                "Welcome to CALMA, your one-stop solution for seamless salon bookings. At CALMA, we believe in making self-care easy and accessible by connecting users with salons tailored to their location and preferences.",
            softWrap: true,
            textAlignName: TextAlign.left,
            fontSize: 14,
          ),
          SizedBox(height: screenHeight * 0.0098 //10,
              ),
          subtitleText(
            "Our mission is to simplify the process of finding and booking appointments at salons. With just a few taps, you can browse a curated list of salons, check their availability, and secure your preferred time slot—all from the comfort of your home.",
          ),
          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          titleText("Why Choose CALMA?"),
          SizedBox(
            height: screenHeight * 0.0056 /*5*/,
          ),
          const SmallText(
            text:
                "location-Based Services: We utilize advanced location tracking to show you the best salons near you.\n\nEffortless appointments: Say goodbye to waiting in line. Book your spot instantly through the app.\n\nUser-Friendly Experience: From adding multiple addresses to managing bookings, CALMA is designed with you in mind.\n\nWhether you're looking for a quick trim, a relaxing spa session, or a complete makeover, CALMA ensures a smooth and hassle-free experience.\n\nJoin us in redefining how you plan your self-care routine. Your convenience is our priority",
            softWrap: true,
          ),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
          // titleText("Contact Us"),
          // SizedBox(
          //   height: screenHeight * 0.0056 /*5*/,
          // ),
          // subtitleText("Have questions or suggestions? Reach out to us at:"),

          SizedBox(
            height: screenHeight * 0.02245 /*20*/,
          ),
        ],
      ),
    );
    Widget contactUsContent = const Center(child: Text("Coming Soon..."),);
    Widget activeScreenSection = privacyPolicyContent;

    if (widget.isAboutUsSection) {
      setState(() {
        activePageTitle = "About Us";
        activeScreenSection = aboutUsContent;
      });
    }
    if (widget.isContactUsSection) {
      setState(() {
        activePageTitle = "Contact Us";
        activeScreenSection = contactUsContent;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: SingleChildScrollView(
        child: activeScreenSection,
      ),
    );
  }

  // Widget textStyleHead = TextStyle();
  titleText(String text) {
    return BigText(text: text, fontFamilyName: "Inter", fontSize: 18);
  }

  subtitleText(String subtitleText) {
    return SmallText(
      text: subtitleText,
      softWrap: true,
    );
  }

}
