import 'dart:developer';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../helper/api.dart';

class APIs {
  static final model = GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: apiKey,
  );

  static Future<String> getAnswer(String question) async {
    try {
      final content = [Content.text(question)];
      final res = await model.generateContent(content, safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.none),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.none),
      ]);

      return res.text ?? 'No response';
    } catch (e) {
      log('getAnswerGeminiE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }

  static Future<String> detectLanguage(String text) async {
    try {
      final prompt = "Detect the language of the following text and respond with only the language name: $text";
      final content = [Content.text(prompt)];
      final res = await model.generateContent(content);
      return res.text?.trim() ?? 'Unknown';
    } catch (e) {
      log('detectLanguageE: $e');
      return 'Unknown';
    }
  }

  static Future<String> translateWithGemini({
    required String from,
    required String to,
    required String text,
  }) async {
    try {
      final prompt = "Translate the following text from $from to $to: $text";
      final content = [Content.text(prompt)];
      final res = await model.generateContent(content);
      return res.text ?? 'Translation failed';
    } catch (e) {
      log('translateWithGeminiE: $e');
      return 'Translation failed. Please try again.';
    }
  }
}