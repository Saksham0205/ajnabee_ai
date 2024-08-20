import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomCard extends StatelessWidget {
  final String lottiePath;
  final String text;
  final Color color;
  final double lottieHeight;
  final double lottieWidth;
  final bool isLottieOnRight;

  const CustomCard({
    Key? key,
    required this.lottiePath,
    required this.text,
    this.color = Colors.white,
    this.lottieHeight = 120.0,
    this.lottieWidth = 150.0,
    this.isLottieOnRight = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          if (!isLottieOnRight)
            Lottie.asset(lottiePath, height: lottieHeight.h, width: lottieWidth.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                letterSpacing: 1,
              ),
            ),
          ),
          if (isLottieOnRight)
            Lottie.asset(lottiePath, height: lottieHeight.h, width: lottieWidth.w),
        ],
      ),
    );
  }
}
