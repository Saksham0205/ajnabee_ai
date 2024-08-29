import 'package:ajnabee_ai/apis/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/message.dart';

class ChatController extends GetxController{
  final chatText = TextEditingController();
  final list =<Message>[
    Message(msg: "Hello, how can I help you?", msgType: MessageType.bot)
  ].obs;

  Future<void> askQuestion() async {
    if(chatText.text.trim().isNotEmpty){
      list.add(Message(msg: chatText.text, msgType: MessageType.user));
      list.add(Message(msg: '', msgType: MessageType.bot));

      final res = await APIs.getAnswer(chatText.text);
      list.removeLast();

      list.add(Message(msg: res, msgType: MessageType.bot));
      chatText.text="";
    }
  }
}