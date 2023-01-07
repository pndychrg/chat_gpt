import 'package:chat_gpt/constants.dart';
import 'package:chat_gpt/screens/chat_screen_components/text_message.dart';
import 'package:flutter/material.dart';

class ChatMessageBox extends StatefulWidget {
  const ChatMessageBox(
      {Key? key, required this.message, required this.isSender})
      : super(key: key);
  final String message;
  final bool isSender;
  @override
  State<ChatMessageBox> createState() => _ChatMessageBoxState();
}

class _ChatMessageBoxState extends State<ChatMessageBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!widget.isSender) ...[
          CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(
            width: kDefaultPadding / 2,
          )
        ],
        TextMessage(message: widget.message, isSender: widget.isSender)
      ],
    );
  }
}
