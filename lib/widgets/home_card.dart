import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../model/hometype.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({Key? key, required this.homeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: homeType.onTap,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeType.title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Tap to ${homeType.title.toLowerCase()}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Lottie.asset(
                  'assets/homecard/${homeType.lottie}',
                  width: 80.w,
                  height: 80.h,
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fade(duration: 500.milliseconds, curve: Curves.easeIn)
        .scale(duration: 500.milliseconds, curve: Curves.easeOut);
  }
}