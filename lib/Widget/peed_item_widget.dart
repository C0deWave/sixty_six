import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';
import 'like_widget.dart';

class PeedItemWidget extends StatelessWidget {
  PeedItemWidget(
      {required this.imageurl,
      required this.content,
      required this.userName,
      required this.isClickThumsUp,
      required this.likeNum,
      required this.userImage});

  final String userImage;
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
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(userImage), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  userName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    print('댓글 날리기');
                  },
                  child: Icon(
                    Icons.email,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
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
