import 'package:ajnabee_ai/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat with AjnabeeAI",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(14.w),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _c.chatText,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  hintText: "Ask me anything",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w,),
            CircleAvatar(
              backgroundColor: Colors.green,
                child: IconButton(
              onPressed: _c.askQuestion,
              icon: Icon(
                Icons.rocket_launch_rounded,
                color: Colors.white,
              ),
            ))
          ],
        ),
      ),
      body: ListView(
        children: _c.list.map((e)  =>Text(e.msg)).toList(),
      ),
    );
  }
}
