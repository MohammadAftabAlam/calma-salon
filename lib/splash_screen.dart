import 'dart:async';

import 'package:calma/pages/home/main_home_screen.dart';
import 'package:calma/pages/validation/login_screen.dart';
import 'package:calma/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  late Animation<Offset> animation;
  late Animation<double> _opacityAnimation;
  late Animation<Color?> _colorAnimation;


  // SharedPreferencesDataStoring sharedPreferencesDataStoring = new SharedPreferencesDataStoring();

  bool? isLoggedIn;
 sharedPreference() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isLoggedIn = sp.getBool('isLogin');
  }


  @override
  void initState() {
    super.initState();
    // sharedPreferencesDataStoring.sharedPreferences();
    const SharedPreferencesDataStoring();
    sharedPreference();

    // Define the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Define the animation
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0), // Start from left
      end: const Offset(8.9, 0), // Move to right
    ).animate(_animationController);

    animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(8.9, 0),
    ).animate(_animationController);

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.75, 1.0), // Fade out at the end
    ));

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.pink,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>const  DevelopersImage()));

        Timer(const Duration(seconds: 2), () {

          if(isLoggedIn == true) {
            debugPrint(isLoggedIn.toString());
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainHomeScreen()));
          }else{
            debugPrint(isLoggedIn.toString());

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: _colorAnimation.value,
      body: Stack(
        children: [
          // Background image
          // Positioned.fill(
          //   left: 40,
          //   top: MediaQuery.of(context).size.height / 2 ,
          //   child: SlideTransition(
          //     position: _offsetAnimation,
          //     child:  Image.asset(
          //     'asset/images/calmaLogo.png', // Replace with your image path
          //     fit: BoxFit.cover,
          //     height: 5,
          //     width: 5,
          //   ),
          //   ),
          // ),
          // Pink circle animation
          Positioned(
            left: 20, // Initial left position of the circle
            top: MediaQuery.of(context).size.height / 2 -
                20, // Center vertically
            child: SlideTransition(
              position: animation,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink,
                ),
              ),
            ),
          ),
          Positioned(
            left: 40, // Initial left position of the circle
            top: MediaQuery.of(context).size.height / 2, // Center vertically
            child: SlideTransition(
              position: _offsetAnimation,
              child: Container(
                width: 80,
                height: 60,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('asset/images/scissor.png'),
                  fit: BoxFit.fill,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DevelopersImage extends StatelessWidget {
  const DevelopersImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFDC3C1),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 55,
            child: Image(
              width: 300,
              height: 200,
              image: AssetImage("asset/images/calmaLogo.png"),
            ),
          ),

          Positioned(
            top: 370,
            left: 20,
            child: Text(
              "Project Supervisor",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600),
            ),
          ),
          // ImageWithNames(image: "asset/images/aftab.jpg", name: "Aftab", leftWidth: 5,top: 420,),
          // ImageWithNames(image: "asset/images/azam.jpg", name: "Azam", leftWidth: 100,top: 420,),

          ImageWithNames(
            image: "asset/images/sunil-sir.jpg",
            name: "Dr. Sunil Rawat",
            leftWidth: 15,
            top: 420,
            height: 150,
          ),

          Positioned(
            top: 590,
            left: 20,
            child: Text(
              "Project Members",
              style: TextStyle(
                  fontSize: 36,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600),
            ),
          ),
          ImageWithNames(
            image: "asset/images/aftab.jpg",
            name: "Aftab",
            leftWidth: 5,
          ),
          ImageWithNames(
            image: "asset/images/azam.jpg",
            name: "Azam",
            leftWidth: 75,
          ),
          ImageWithNames(
              image: "asset/images/yazdan.jpg", name: "Yazdan", leftWidth: 145,
          ),
          ImageWithNames(
            image: "asset/images/shayan.jpg",
            name: "Shayan",
            leftWidth: 230,
          ),
          ImageWithNames(
              image: "asset/images/zaid.jpg", name: "Zaid", leftWidth: 300),

          // Positioned(
          //   top: 270,
          //   left: 20,
          //   child: Text("Developer",style: TextStyle(fontSize: 36,fontFamily: "Inter",fontWeight: FontWeight.w600),),
          // ),
          // ImageWithNames(image: "asset/images/aftab.jpg", name: "Aftab", leftWidth: 5,top: 320,),
          // ImageWithNames(image: "asset/images/azam.jpg", name: "Azam", leftWidth: 100,top: 320,),
          //
          // Positioned(
          //   top: 450,
          //   left: 20,
          //   child: Text("Ui/Ux Designer",style: TextStyle(fontSize: 36,fontFamily: "Inter",fontWeight: FontWeight.w600),),
          // ),
          // ImageWithNames(image: "asset/images/yazdan.jpg", name: "Yazdan", leftWidth: 5,top: 500),
          //
          // Positioned(
          //   top: 620,
          //   left: 20,
          //   child: Text("Documenter",style: TextStyle(fontSize: 36,fontFamily: "Inter",fontWeight: FontWeight.w600),),
          // ),
          // ImageWithNames(image: "asset/images/shayan.jpg", name: "Shayan", leftWidth: 5,top: 680,),
          // ImageWithNames(image: "asset/images/zaid.jpg", name: "Zaid", leftWidth: 105,top: 680,),
        ],
      ),
    );
  }
}

class ImageWithNames extends StatelessWidget {
  final String image;
  final String name;
  final double leftWidth, top, height;
  const ImageWithNames(
      {super.key,
      required this.image,
      required this.name,
      required this.leftWidth,
      this.top = 650,
      this.height = 103});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: leftWidth,
      child: Column(
        children: [
          Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(name),
        ],
      ),
    );
  }
}

/*  My splash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{


  // void isLogin() async{
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //    bool login = sharedPreferences.getBool('isLogin') ?? false;
  //   if(login){
  //     Timer(const Duration(seconds: 3),(){
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
  //     });
  //
  //   }else{
  //     Timer(const Duration(seconds: 3),(){
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
  //     }
  //     );
  //   }
  // }

  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isLogin();


    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // scaleAnimation = Tween<double>(begin: 1, end: 20).animate(controller);
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();
    controller.addListener(() {
      if(controller.isCompleted){
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: const Color(0xff177888),
      body:  SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: ScaleTransition(
                // alignment: Alignment.centerRight,
                scale:scaleAnimation,
                child: Container(
                  // height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                  // color: Color(0xffFDC3C1),
                    image: DecorationImage(image: AssetImage("asset/images/calmaLogo.png"))
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: scaleAnimation,
              builder: (context,child)=>CustomPaint(
                size: Size(MediaQuery.sizeOf(context).width,MediaQuery.sizeOf(context).height-50),
                painter: BallWithScissor(scaleAnimation.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/

class BallWithScissor extends CustomPainter {
  late double animationValue;
  BallWithScissor(this.animationValue) : super();

  @override
  void paint(Canvas canvas, Size size) {
    print(animationValue.toString());
    canvas.drawCircle(Offset((size.width * animationValue), size.height / 2),
        20, Paint()..color = Colors.pink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //throw UnimplementedError();
    return true;
  }
}

/*
        // Center(
          //   child: ScaleTransition(
          //     // alignment: Alignment.centerRight,
          //     scale:scaleAnimation,
          //     child: Container(
          //       height: 50,
          //       width: 50,
          //       decoration: BoxDecoration(
          //       color: Color(0xffFDC3C1),
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //   ),
          // ),
*/

/*
import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) => CustomPaint(
                size: const Size(500, 600),
                painter: BouncingBallPainter(animation.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BouncingBallPainter extends CustomPainter {
  final double animationValue;
  BouncingBallPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height - (size.height * animationValue)),
      20,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

*/
