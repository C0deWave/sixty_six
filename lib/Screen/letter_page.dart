import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
  @override
  Widget build(BuildContext context) {
    List<Widget> messageList = [
      chatBubble.getSenderView(
          context,
          Text(
            "보낸이 입니다.",
            style: TextStyle(color: Colors.white),
          )),
      chatBubble.getReceiverView(
          context,
          Text(
            "보낸이 입니다.",
            style: TextStyle(color: Colors.black),
          )),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userId),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
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
                    SizedBox(
                      height: 8,
                    ),
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
            Container(
              margin: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 5,
                              color: Colors.grey)
                        ],
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.attach_file,
                                color: Colors.blueAccent),
                            onPressed: () {},
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "",
                                  hintStyle:
                                      TextStyle(color: Colors.blueAccent),
                                  border: InputBorder.none),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.send, color: Colors.blueAccent),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
