import 'package:flutter/material.dart';
import 'package:calma/utils/colors.dart';


class BackArrowButton extends StatelessWidget {
  final VoidCallback onPress;
  final double iconSize;
  const BackArrowButton({super.key, required this.onPress, this.iconSize = 24});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icons.arrow_back,
          size: iconSize,
        ),
      ),
    );
  }
}
