import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/message.dart';

class ChatController extends GetxController{
  final chatText = TextEditingController();
  final list =<Message>[].obs;

  void askQuestion(){
    if(chatText.text.trim().isNotEmpty){
      list.add(Message(msg: chatText.text, msgType: MessageType.user));
      list.add(Message(msg: "I receives your message", msgType: MessageType.bot));
      chatText.text='';
    }
  }
}