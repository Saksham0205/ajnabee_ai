import 'package:ajnabee_ai/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguageSheet extends StatefulWidget {
  final TranslatorController c;
  final RxString s;
  LanguageSheet({super.key, required this.c, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final search = "".obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
            child: TextFormField(
              onChanged: (s) => search.value = s.toLowerCase(),
              onTapOutside: (e) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.translate_rounded,
                  color: Colors.green,
                ),
                hintText: "Search Language..",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              final List<String> list = search.isEmpty
                  ? widget.c.lang
                  : widget.c.lang.where((e) => e.toLowerCase().contains(search.value)).toList();
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: 15.h, left: 15.w, bottom: 10.h),
                    child: InkWell(
                        onTap: (){
                          widget.s.value =list[index];
                          Get.back();
                        },
                        child: Text(list[index])),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
