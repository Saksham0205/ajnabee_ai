import 'package:ajnabee_ai/controller/chat_controller.dart';
import 'package:ajnabee_ai/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({Key? key}) : super(key: key);

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ever(_c.list, (_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat with AjnabeeAI",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
            children: [
              Expanded(
                child: Obx(() => ListView.builder(
                  controller: _scrollController,
                  itemCount: _c.list.length,
                  padding: EdgeInsets.only(bottom: 80.h),
                  itemBuilder: (context, index) => MessageCard(message: _c.list[index]),
                )),
              ),
              _buildInputArea(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: EdgeInsets.all(8.w),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _c.chatText,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          CircleAvatar(
            backgroundColor: Colors.green,
            child: IconButton(
              onPressed: _c.askQuestion,
              icon: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
