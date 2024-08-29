import 'package:ajnabee_ai/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c = TranslatorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Multi Language Translator",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 15.h),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 150.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.green)),
                alignment: Alignment.center,
                child: const Text("Auto"),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
              Container(
                height: 50.h,
                width: 150.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.green)),
                alignment: Alignment.center,
                child: const Text("Auto"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _c.textC,
              maxLines: null,
              minLines: 5,
              decoration: InputDecoration(
                hintText: "Translate Anything you want.....",
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
          if(_c.resultC.text.isNotEmpty)
          TextFormField(
            controller: _c.textC,
            textAlign: TextAlign.center,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Translate Anything you want.....",
              hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          SizedBox(height: 10.h,),
          Align(
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                backgroundColor: Colors.green.shade400,
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 40.w),
              ),
              child: Text(
                "Translate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
