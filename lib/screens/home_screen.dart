import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/pref.dart';
import '../model/hometype.dart';
import '../widgets/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnBoarding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "AjnabeeAI",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Image.asset(
            "assets/images/ai_app_logo.png",
            height: 40.h,
            width: 40.w,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.brightness_4_rounded,
              size: 28.sp,
              color: Colors.green.withOpacity(0.75),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: ListView(
            children: [
              Text(
                "What would you like to do?",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.h),
              ...HomeType.values.map((e) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: HomeCard(homeType: e),
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}