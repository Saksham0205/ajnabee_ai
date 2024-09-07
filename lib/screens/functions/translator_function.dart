import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ajnabee_ai/controller/language_controller.dart';
import 'package:ajnabee_ai/widgets/language_sheet.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({Key? key}) : super(key: key);

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final TranslatorController _c = Get.put(TranslatorController());

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
      body: Obx(() => ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 15.h),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLanguageSelector(_c.from, "From"),
              IconButton(
                onPressed: _c.swapLanguages,
                icon: const Icon(Icons.swap_horiz),
              ),
              _buildLanguageSelector(_c.to, "To"),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0.w),
            child: TextFormField(
              controller: _c.textC,
              maxLines: null,
              minLines: 5,
              decoration: InputDecoration(
                hintText: "Translate Anything you want.....",
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
          if (_c.resultC.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: TextFormField(
                controller: _c.resultC,
                readOnly: true,
                maxLines: null,
                minLines: 5,
                decoration: InputDecoration(
                  hintText: "Translation will appear here",
                  hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ),
          SizedBox(height: 10.h),
          Align(
            child: ElevatedButton(
              onPressed: _c.isLoading.value ? null : _c.translate,
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                backgroundColor: Colors.green.shade400,
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 40.w),
              ),
              child: _c.isLoading.value
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(
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
      )),
    );
  }

  Widget _buildLanguageSelector(RxString language, String defaultText) {
    return InkWell(
      onTap: () => Get.bottomSheet(LanguageSheet(c: _c, s: language)),
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        height: 50.h,
        width: 150.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.green),
        ),
        alignment: Alignment.center,
        child: Text(language.isEmpty ? defaultText : language.value),
      ),
    );
  }
}