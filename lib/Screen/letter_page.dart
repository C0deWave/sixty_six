import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sixty_six/Widget/input_text_widget.dart';
import '../Widget/chat_bubble.dart';

class LetterPage extends StatefulWidget {
  LetterPage(
      {required this.imageUri, required this.content, required this.userId});
  String imageUri;
  String content;
  String userId;

  @override
  State<LetterPage> createState() => _LetterPageState();
}

class _LetterPageState extends State<LetterPage> {
  List<Widget> messageList = [
    reciverViewWithUserImage(
      senderName: "훈이",
      senderImageUri:
          "https://img.sbs.co.kr/newimg/news/20201102/201486580_1280.jpg",
      child: const Text("상대가 보낸 첫번째 글입니다.."),
    ),
    reciverMessage(child: Text("상대가 보낸 두번째 글입니다..")),
  ];

  @override
  Widget build(BuildContext context) {
    var singleChildScrollViewController = ScrollController();
    void addMessage(String text) {
      setState(() {
        messageList.add(senderMessage(
            child: Text(
          text,
          style: TextStyle(color: Colors.white),
        )));
      });
      print(messageList.length);
      singleChildScrollViewController.animateTo(
          singleChildScrollViewController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("채팅방"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: singleChildScrollViewController,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: NetworkImage(widget.imageUri),
                              width: 100,
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            widget.content,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      children: messageList,
                    )
                  ],
                ),
              ),
            ),
            inputTextWidget(
              messageList: messageList,
              sendCallback: (String text) {
                addMessage(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
