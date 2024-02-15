import 'package:flutter/widgets.dart';

class ResponsiveHelper {
  // Singleton instance
  static final ResponsiveHelper _instance = ResponsiveHelper._internal();

  factory ResponsiveHelper() => _instance;

  ResponsiveHelper._internal();

  // Method to get screen width
  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Method to get screen height
  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
