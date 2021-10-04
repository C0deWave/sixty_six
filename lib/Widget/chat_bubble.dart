import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';

class senderMessage extends StatelessWidget {
  senderMessage({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return ChatBubble(
      clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(top: 8),
      backGroundColor: Colors.blue,
      child: Container(
          padding: EdgeInsets.only(right: 2),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: child),
    );
    ;
  }
}

class reciverMessage extends StatelessWidget {
  reciverMessage({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 45),
        ChatBubble(
          clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
          backGroundColor: Color(0xffE7E7ED),
          margin: EdgeInsets.only(top: 8, left: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 여기 개선
              Container(
                padding: EdgeInsets.only(left: 2),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: child,
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}

class reciverViewWithUserImage extends StatelessWidget {
  reciverViewWithUserImage({
    Key? key,
    required this.senderName,
    required this.senderImageUri,
    required this.child,
  }) : super(key: key);
  String senderImageUri;
  String senderName;
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(senderImageUri), fit: BoxFit.fill)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 유저 이름 표시
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 8),
              child: Text(
                senderName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
              backGroundColor: Color(0xffE7E7ED),
              margin: EdgeInsets.only(top: 0, left: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 여기 개선
                  Container(
                    padding: EdgeInsets.only(left: 2),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: child,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
    ;
  }
}
