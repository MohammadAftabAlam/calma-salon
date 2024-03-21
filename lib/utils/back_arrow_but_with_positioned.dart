import 'package:calma/utils/colors.dart';
import 'package:flutter/material.dart';

class BackArrowButtonWithPositioned extends StatelessWidget {
  final VoidCallback onPress;
  final double iconSize;
  final double positionedLeft;
  final double positionedTop;
  final IconData iconData;

  const BackArrowButtonWithPositioned({super.key,
    required this.onPress,
    this.iconSize = 30,
    this.positionedLeft =10,
    this.positionedTop =50,
    this.iconData = Icons.arrow_back,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Positioned(
      left: positionedLeft ==10 ? screenHeight *0.0112: screenHeight * positionedLeft /screenHeight,
      top: positionedTop  ==50 ? screenHeight *0.0561: screenHeight * positionedTop /screenHeight,
      child: Container(
        height: screenHeight * 0.046, //41
        // width: 5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.mainBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0,screenHeight* 0.0045),
              blurRadius: screenHeight * 0.0022,
            )
          ]
        ),
        child: IconButton(
          onPressed: onPress,
          icon: Icon(
            iconData,
            size: iconSize == 30 ? screenHeight *0.0334: screenHeight * iconSize /screenHeight ,
          ),
        ),
      ),
    );
  }
}

/*
    IconButton(
      onPressed: onPress,
      icon: Icon(
        Icons.arrow_back,
        size: iconSize,
      ),
    )*/