import 'package:flutter/cupertino.dart';

class DeviceInformationService {
  static screenPerimeter(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenPerimeter = (screenHeight * 2) + (screenWidth * 2);
    return screenPerimeter;
  }
}
