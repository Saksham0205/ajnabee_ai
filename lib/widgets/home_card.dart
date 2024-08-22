import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../model/hometype.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    return Card(
        color: Colors.green.withOpacity(.2),
        elevation: 0,
        shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: InkWell(
          borderRadius:  BorderRadius.all(Radius.circular(20.r)),
          onTap: homeType.onTap,
          child: homeType.leftAlign
              ? Row(
            children: [
              //lottie
              Container(
                padding: homeType.padding,
                child: Lottie.asset('assets/homecard/${homeType.lottie}',width: 150.w,height: 120.h),
              ),

              const Spacer(),

              //title
              Text(
                homeType.title,
                style:  TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),

              const Spacer(flex: 2),
            ],
          )
              : Row(
            children: [
              const Spacer(flex: 2),

              //title
              Text(
                homeType.title,
                style:  TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              ),

              const Spacer(),

              //lottie
              Container(
                padding: homeType.padding,
                child: Lottie.asset('assets/homecard/${homeType.lottie}',width: 120.w,height: 90.h),
              ),
            ],
          ),
        )).animate().fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}