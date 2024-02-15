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
    return Positioned(
      left: positionedLeft,
      top: positionedTop,
      child: Container(
        height: 41,
        // width: 5,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.mainBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0,4),
              blurRadius: 2
            )
          ]
        ),
        child: IconButton(
          onPressed: onPress,
          icon: Icon(
            iconData,
            size: iconSize,
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