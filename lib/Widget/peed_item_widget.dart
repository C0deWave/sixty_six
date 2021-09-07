import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';
import 'like_widget.dart';

class PeedItemWidget extends StatelessWidget {
  PeedItemWidget(
      {required this.imageurl,
      required this.content,
      required this.userName,
      required this.isClickThumsUp,
      required this.likeNum});

  final String imageurl;
  final String content;
  final String userName;
  bool isClickThumsUp;
  int likeNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                imageurl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Row(
              children: [
                Text(
                  userName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Expanded(child: Container()),
                LikeWidget(
                  isClick: isClickThumsUp,
                  likeNum: likeNum,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(content),
          ),
          K_DivLine,
        ],
      ),
    );
  }
}
