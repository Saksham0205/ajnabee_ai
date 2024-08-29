import 'dart:convert';
import 'dart:developer';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart';

import '../helper/api.dart';

class APIs {
  //get answer from google gemini ai
  static Future<String> getAnswer(String question) async {
    try {
      log('api key: $apiKey');

      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
      );

      final content = [Content.text(question)];
      final res = await model.generateContent(content, safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
      ]);

      log('res: ${res.text}');

      return res.text!;
    } catch (e) {
      log('getAnswerGeminiE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }


  // static Future<String> googleTranslate(
  //     {required String from, required String to, required String text}) async {
  //   try {
  //     final res = await GoogleTranslator().translate(text, from: from, to: to);
  //
  //     return res.text;
  //   } catch (e) {
  //     log('googleTranslateE: $e ');
  //     return 'Something went wrong!';
  //   }
  // }
}