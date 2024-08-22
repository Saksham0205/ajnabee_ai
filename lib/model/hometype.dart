import 'package:ajnabee_ai/screens/functions/imageai_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/functions/chatbot_feature.dart';
import '../screens/functions/translator_function.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  //title
  String get title => switch (this) {
    HomeType.aiChatBot => 'AI ChatBot',
    HomeType.aiImage => 'AI Image Creator',
    HomeType.aiTranslator => 'Language Translator',
  };

  //lottie
  String get lottie => switch (this) {
    HomeType.aiChatBot => 'chatai.json',
    HomeType.aiImage => 'photoai.json',
    HomeType.aiTranslator => 'language.json',
  };

  //for alignment
  bool get leftAlign => switch (this) {
    HomeType.aiChatBot => true,
    HomeType.aiImage => false,
    HomeType.aiTranslator => true,
  };

  //for padding
  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage => const EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
  };


  //for navigation
  VoidCallback get onTap => switch (this) {
    HomeType.aiChatBot => () => Get.to(() => const ChatbotFeature()),
    HomeType.aiImage => () => Get.to(() => const ImageAiFeature()),
    HomeType.aiTranslator => () => Get.to(() => const TranslatorFeature()),
  };
}