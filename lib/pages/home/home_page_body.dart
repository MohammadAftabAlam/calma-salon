import 'package:calma/pages/home/search_page.dart';
import 'package:calma/utils/colors.dart';
import 'package:calma/widgets/Icon_and_text_button.dart';
import 'package:calma/widgets/big_text.dart';
import 'package:calma/widgets/small_text.dart';
import 'package:calma/widgets/stack_img_container.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  List images = [
    "asset/images/haircut.jpg",
    "asset/images/facial.jpg",
    "asset/images/bridal_makeup.jpg",
    "asset/images/threadingEyebrow.jpg",
    "asset/images/beardTrimming.jpg",
    "asset/images/shaving.jpg",
  ];
  List imageServiceName = [
    "Haircut",
    "Facial",
    "Bridal Makeup",
    "Threading",
    "Trim & Style",
    "Shaving"
  ];
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding:
          // EdgeInsets.only(right: Dimensions.width10, left: Dimensions.width10),
          const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          /* ************************** starts Home page main Banner ************************** */
          SizedBox(
            height: screenHeight * 0.218, //Dimensions.height194, //194
            child: PageView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                    // EdgeInsets.only(
                    //     left: Dimensions.width5, right: Dimensions.width5),
                    const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(/*Dimensions.radius20*/screenHeight * 0.022),
                      // color: Colors.red,
                      color: const Color(0xff85ABB8),
                      image: const DecorationImage(
                        alignment: Alignment(1, 0),
                        fit: BoxFit.contain,
                        image: AssetImage("asset/images/menPicHomePage.png"),
                      ),
                    ),
                  );
                },
            ),
          ),
          /* ************************** Ends Home page main Banner ************************** */

          /* ************ Select Cherished Text Starts ***************** */
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigText(
                  text: "Select Cherished Services",
                  fontSize: screenHeight * 0.02 /*18*/,
                  fontWeightName: FontWeight.bold,
                  color: AppColor.mainBlackColor,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const SearchPage()));
                  },
                  child: const SmallText(
                    text: "View All",
                    color: AppColor.quoteColor,
                  ),
                )
              ],
            ),
          ),
          /* ************ Select Cherished Text Ends ***************** */

          /* ************* Starts Cherished services with horizontal scroll ************* */
          SizedBox(
            height: screenHeight * 0.17, //151
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                /// Column is used here for showing the images along with services name
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.123,//110,
                        width: screenWidth * 0.275,//113,

                        // margin: EdgeInsets.only(
                        //     left: Dimensions.width5,
                        //     right: Dimensions.width5,
                        //     top: Dimensions.height10,
                        //     bottom: Dimensions.height10),

                        margin: EdgeInsets.symmetric(horizontal: screenWidth *0.012 /*5*/,vertical: screenHeight *0.011/*10*/),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular( screenHeight* 0.007/*6*/),
                          color: AppColor.imageBgColor,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(images[index].toString()),
                          ),
                        ),
                      ),
                      SmallText(
                        text: imageServiceName[index].toString(),
                        color: AppColor.quoteColor
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          /* ************* Ends Cherished services with horizontal scroll ************* */

          SizedBox(
            height: screenHeight * 0.0112, //10
          ),

          /* ********************** Starts top salon & Popular Button ************** */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.024/*10*/),
                child: BigText(
                  text: "Top Salons Around You",
                  fontSize: screenHeight * 0.02 ,// 18,
                  fontWeightName: FontWeight.bold,
                  color: AppColor.mainBlackColor,
                ),
              ),

              /* ************ Starts Popular Button ************** */
              Container(
                height:  screenHeight *0.027,   /*24*/
                width:  screenWidth * 0.219,   /*90*/
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenHeight * 0.009/*8*/),
                  boxShadow: [
                    BoxShadow(
                        // color: Color(0xffe8e8e8),
                        color: Colors.blueGrey,
                        offset: Offset(0, /*4*/screenHeight * 0.004)),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(screenWidth *0.006 /*2.5*/,0),
                    ),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-screenWidth *0.006/*2.5*/, 0)),
                  ],
                ),
                child: const IconAndTextButton(
                  text: "Popular",
                  iconData: Icons.swap_vert,
                  textColor: AppColor.iconColor,
                ),
              ),
              /* ************ Starts Popular Button ************** */
            ],
          ),
          /* ********************** Ends Popular Button & top salon ************** */

          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            padding: EdgeInsets.only(top: screenHeight * 0.0168 /*15*/,bottom: 0),
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(bottom: screenHeight *0.017 /*15*/),
              child: const ImageContWithStack(
                image: AssetImage("asset/images/salonImage.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class ImageContWithStack extends StatelessWidget {
//   final AssetImage image;
//   const ImageContWithStack({super.key, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           child: Container(
//             height: 180,
//             width: 370,
//             decoration: BoxDecoration(
//               color: Colors.pinkAccent,
//               borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(20),
//                 topLeft: Radius.circular(20),
//               ),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: image,
//                 // image: AssetImage("asset/images/salonImage.jpg"),
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 110,
//             child: Container(
//               height: 70,
//               width: 370,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(20),
//                   topLeft: Radius.circular(20),
//                 ),
//                 color:AppColor.statusBookServiceColor,
//               ),
//         ),
//         ),
//
//         const Positioned(
//           left: 14,
//             top: 110,
//             child: IconColumn()),
//       ],
//     );
//   }
// }