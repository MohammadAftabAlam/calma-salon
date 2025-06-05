import 'package:calma/Data/notification_data.dart';
import 'package:calma/Model/notification_model.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/back_arrow_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  removeNotification(NotificationModel notificationModel) {
    setState(() {
      receivedNotification.remove(notificationModel);
    });
  }

  removeAllNotification() {
    setState(() {
      receivedNotification.removeRange(0, receivedNotification.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    /* *************** Content of the Screen STARTS here *************** */
    Widget mainContent = ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        itemCount: receivedNotification.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(receivedNotification[index]),
            onDismissed: (direction) {
              removeNotification(receivedNotification[index]);
            },
            child: Column(
              children: [
                /// Notification Details
                ListTile(
                  /// Bell Icon Image
                  leading: SvgPicture.asset(
                    "asset/icons/bell.svg",
                    height: 36,
                  ),

                  /// Title of the Notification
                  title: BigText(
                    text: receivedNotification[index].title,
                    fontFamilyName: "Inter",
                    color: AppColor.mainBlackColor,
                    fontSize: 14,
                    fontWeightName: FontWeight.w600,
                  ),

                  /// Subtitle of the Notification
                  subtitle: SmallText(
                    text: receivedNotification[index].subtitle,
                    fontFamilyName: "Inter",
                    fontSize: 12,
                  ),
                ),

                /// Divider
                const Divider(
                  thickness: 0.5,
                )
              ],
            ),
          );
        });
    /* *************** Content of the Screen ENDS here *************** */

    /* *************** Zero Content text STARTS here *************** */
    Widget alternateContent = Column(
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("asset/images/bell.gif"),
            ),
          ),
        ),
        const Center(
          child: SmallText(
            text: "You Have No Notification at the Moment",
            fontSize: 16,
            fontFamilyName: "Inter",
            fontWeightName: FontWeight.w600,
          ),
        ),
      ],
    );
    /* *************** Zero Content text Ends here *************** */

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 40),
            child: BackArrowButton(onPress: () {
              Navigator.pop(context);
            }),
          ),
          Align(
            heightFactor: receivedNotification.isNotEmpty ? 0.8 : 5,
            widthFactor: 5.1,
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                removeAllNotification();
              },
              child: const SmallText(
                text: "Clear All",
                fontWeightName: FontWeight.w500,
              ),
            ),
          ),
          receivedNotification.isEmpty ? alternateContent : mainContent,
        ],
      ),
    );
  }
}
