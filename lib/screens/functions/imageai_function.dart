import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../../helper/api.dart';

class ImageAiFeature extends StatefulWidget {
  const ImageAiFeature({super.key});

  @override
  State<ImageAiFeature> createState() => _ImageAiFeatureState();
}

class _ImageAiFeatureState extends State<ImageAiFeature> {
  final TextEditingController _promptController = TextEditingController();
  bool _isGenerating = false;
  String? _generatedImageUrl;

  Future<void> _generateImage() async {
    setState(() {
      _isGenerating = true;
      _generatedImageUrl = null;
    });

    try {
      final originalPrompt = _promptController.text;
      print('Original prompt: $originalPrompt');

      final enhancedPrompt = await _enhancePrompt(originalPrompt);
      print('Enhanced prompt: $enhancedPrompt');

      final imageUrls = await searchAiImages(enhancedPrompt);

      if (imageUrls.isNotEmpty) {
        print('Generated image URL: ${imageUrls.first}');
        setState(() {
          _generatedImageUrl = imageUrls.first;
          _isGenerating = false;
        });
      } else {
        throw Exception('No images found');
      }
    } catch (e) {
      print('Error generating image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
      setState(() {
        _isGenerating = false;
      });
    }
  }


  Future<String> _enhancePrompt(String prompt) async {
    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: apiKey,
    );

    final content = [Content.text(
        "Generate a detailed, single-paragraph description for an AI image generator based on this prompt. Focus only on visual elements and be very specific about the subject. Prompt: $prompt"
    )];
    final res = await model.generateContent(content);

    print('Enhanced prompt: ${res.text}');
    return res.text ?? prompt;
  }

  static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final encodedPrompt = Uri.encodeComponent(prompt);
      final url = 'https://lexica.art/api/v1/search?q=$encodedPrompt';
      print('Searching images with URL: $url');
      final res = await http.get(Uri.parse(url));
      final data = jsonDecode(res.body);
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      print('searchAiImagesE: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue.shade100, Colors.green.shade100],
            ),
          ),
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "AjnabeeAI Image Generator",
                  style: TextStyle(color: Colors.green.shade700, fontWeight: FontWeight.w700),
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    children: [
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: TextFormField(
                            controller: _promptController,
                            textAlign: TextAlign.center,
                            maxLines: null,
                            minLines: 3,
                            decoration: InputDecoration(
                              hintText: "Describe your imagination here...",
                              hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        height: 300.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: _isGenerating
                              ? Lottie.asset(
                            "assets/loading/image_loading.json",
                            fit: BoxFit.cover,
                          )
                              : _generatedImageUrl != null
                              ? Image.network(
                            _generatedImageUrl!,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(child: CircularProgressIndicator());
                            },
                          )
                              : Lottie.asset(
                            "assets/homecard/photoai.json",
                            height: 200.h,
                            width: 50.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: ElevatedButton(
                  onPressed: _isGenerating ? null : _generateImage,
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    backgroundColor: Colors.green.shade400,
                    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 40.w),
                  ),
                  child: Text(
                    _isGenerating ? "Generating..." : "Generate Image",
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
        ),
      ),
    );
  }
}