import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageController extends GetxController{
  final imageprompt = TextEditingController();

  Future<void> askQuestion() async {
    if(imageprompt.text.trim().isNotEmpty){
      imageprompt.text="";
    }
  }
}