import 'package:ajnabee_ai/model/onBoarding.dart';
import 'package:ajnabee_ai/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c= PageController();

    final list = [
      onBoarding(
          text:
              "Welcome to AjnabeeAI—where smart conversations, seamless translations, and creative image generation come together effortlessly!",
          lottie: "boarding 01"),
      onBoarding(
          text:
              "You're all set! Dive into AjnabeeAI and start creating, translating, and exploring like never before. Let’s get started!",
          lottie: "boarding02")
    ];
    return Scaffold(
        body: PageView.builder(
          controller: c,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Lottie.asset("assets/loading/${list[index].lottie}.json",width: index==list.length-1? 350.w:null ,height:  index==list.length-1? 390.h:null),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      list[index].text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Wrap(
                    spacing: 10.w,
                    children: List.generate(
                      list.length,
                      (i) => Container(
                        width: i == index ? 30.w : 20.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                            color: i == index
                                ? Colors.green
                                : Colors.green.shade400,
                            borderRadius: BorderRadius.circular(5.r)),
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () {
                        if(index==list.length-1){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
                        }else{
                          c.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.green.shade400),
                      child:
                          Text(index==list.length-1?"Finish":"Next", style: const TextStyle(color: Colors.white))),
                  const Spacer(flex: 2),
                ],
              );
            }));
  }
}
