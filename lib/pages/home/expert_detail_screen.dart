import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:flutter/material.dart';

class SalonExpertDetailScreen extends StatefulWidget {
  const SalonExpertDetailScreen({super.key});

  @override
  State<SalonExpertDetailScreen> createState() => _SalonExpertDetailScreenState();
}

class _SalonExpertDetailScreenState extends State<SalonExpertDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BigText(text: "Page Not Designed Yet",),
          const Text("Want to go Back click on below button"),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Click here")),
        ],
      ),),
    );
  }
}

