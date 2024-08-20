import 'package:ajnabee_ai/screens/boarding_screen.dart';
import 'package:ajnabee_ai/screens/home_screen.dart';
import 'package:ajnabee_ai/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>BoardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          child: Image.asset("assets/images/ai_app_logo.png",height: 100.h,width:100.w ,),
        ),
      ),
    );
  }
}
