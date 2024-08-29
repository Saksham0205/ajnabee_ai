import 'package:ajnabee_ai/model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageCard extends StatelessWidget {
  final Message message;
  const MessageCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUser = message.msgType == MessageType.user;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) _buildAvatar(),
          SizedBox(width: 8.w),
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: 280.w),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue[100] : Colors.grey[200],
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: _buildMessageContent(message.msg),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          if (isUser) _buildAvatar(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 16.r,
      backgroundColor:
          message.msgType == MessageType.user ? Colors.blue : Colors.white,
      child: message.msgType == MessageType.user
          ? Icon(Icons.person, size: 20.r, color: Colors.white)
          : Image.asset("assets/images/ai_app_logo.png", fit: BoxFit.cover),
    );
  }

  Widget _buildMessageContent(String content) {
    if (message.msg.isEmpty) {
      return AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            "Please wait...",
            speed: Duration(milliseconds: 100),
          ),
        ],
        repeatForever: true,
      );
    }
    final codeBlockRegex = RegExp(r'```[\s\S]*?```');
    final matches = codeBlockRegex.allMatches(content);

    if (matches.isEmpty) {
      return Text(
        content,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16.sp,
        ),
      );
    }

    final children = <Widget>[];
    int lastIndex = 0;

    for (final match in matches) {
      if (match.start > lastIndex) {
        children.add(Text(
          content.substring(lastIndex, match.start),
          style: TextStyle(
            color: Colors.black87,
            fontSize: 16.sp,
          ),
        ));
      }

      children.add(_buildCodeBlock(match.group(0)!));
      lastIndex = match.end;
    }

    if (lastIndex < content.length) {
      children.add(Text(
        content.substring(lastIndex),
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16.sp,
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildCodeBlock(String code) {
    // Remove the ``` at the start and end
    final cleanCode = code.substring(3, code.length - 3).trim();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
              cleanCode,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Courier',
              ),
            ),
    );
  }
}
