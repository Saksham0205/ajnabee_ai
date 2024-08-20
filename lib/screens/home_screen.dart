import 'package:ajnabee_ai/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Pref.showOnBoarnding=false;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "AjnabeeAI",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Image.asset(
            "assets/images/ai_app_logo.png",
            height: 60.h,
            width: 60.w,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0.w),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.brightness_4_rounded,
                  size: 30,
                  color: Colors.green.withOpacity(0.75),
                )),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          HomeCard(),
        ],
      ),
    );
  }
}
