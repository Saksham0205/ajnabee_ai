import 'package:ajnabee_ai/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const CustomCard(lottiePath: "assets/homecard/chatai.json", text: "Chat with Ajnabee"),
        SizedBox(height: 20.h,),
        const CustomCard(lottiePath: "assets/homecard/language.json", text: "Language Translator",),
        SizedBox(height: 20.h,),
        const CustomCard(lottiePath: "assets/homecard/photoai.json", text: "AI Image Creator"),
      ],
    );
  }
}
