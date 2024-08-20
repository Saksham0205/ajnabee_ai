import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';

import '../helper/api.dart';

class APIs{
static Future<String> getAnswer(String question) async {
    try {
      log('api key: $apikey');

      //
      final res =
          await post(Uri.parse('https://api.openai.com/v1/chat/completions'),

              //headers
              headers: {
                HttpHeaders.contentTypeHeader: 'application/json',
                HttpHeaders.authorizationHeader: 'Bearer $apikey'
              },

              //body
              body: jsonEncode({
                "model": "gpt-3.5-turbo",
                "max_tokens": 2000,
                "temperature": 0,
                "messages": [
                  {"role": "user", "content": question},
                ]
              }));

      final data = jsonDecode(res.body);

      log('res: $data');
      return data['choices'][0]['message']['content'];
    } catch (e) {
      log('getAnswerGptE: $e');
      return 'Something went wrong (Try again in sometime)';
    }
  }
}