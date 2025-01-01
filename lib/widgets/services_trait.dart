import 'package:calma/Model/services_model.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ListServices extends StatelessWidget {
  const ListServices({super.key, required this.servicesList,});
  final List<ServicesModel> servicesList;

  @override
  Widget build(BuildContext context) {
    double screenHeight =  MediaQuery.of(context).size.height;
    double screenWidth =  MediaQuery.of(context).size.width;
    return SizedBox(
        height: screenHeight * 0.129, //115
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: servicesList.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.019 /*7*/, vertical: screenHeight * 0.0067/*6*/),
                child: ServicesTrait(
                  serviceName: servicesList[index].serviceName,
                  imageLocation: servicesList[index].imageLocation,
                ),
              );
            }),
    );
  }
}

class ServicesTrait extends StatelessWidget {
  const ServicesTrait({
    super.key,
    required this.serviceName,
    required this.imageLocation,
    this.boxShape = BoxShape.rectangle
  });
  final String serviceName;
  final String imageLocation;
  final BoxShape boxShape;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        // debugPrint(serviceName);
        Navigator.pushNamed(
          context,
          '/salon-search-page',
          arguments: serviceName,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: boxShape == BoxShape.rectangle ? screenHeight * 0.0898/*80*/ : screenHeight * 0.1203/*125*/,
            width: boxShape == BoxShape.rectangle ?  screenWidth * 0.1944 /*80*/ : screenWidth * 0.2917 /*120*/,
            decoration: BoxDecoration(
             borderRadius:  boxShape == BoxShape.rectangle ? BorderRadius.circular(screenHeight * 0.007 /*6*/)  : null ,
              color: AppColor.imageBgColor,
              shape: boxShape,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageLocation),
              ),
            ),
          ),
          SmallText(
            text: serviceName,
            fontSize: screenHeight * 0.0135,  //12
            softWrap: true,
            color: AppColor.quoteColor,
          ),
        ],
      ),
    );
  }
}
