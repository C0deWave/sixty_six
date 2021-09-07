import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';

class PeedItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
                'https://lh3.googleusercontent.com/proxy/f4R3lW0OsNBOLfsb63M8a__xew0q4rLHwWJqWArQFnCxubr5DuMI7fI9DxI4xNCwy9R3YWLx8ms7xdtTmInZBwb6l_dHw5w3S1CCLZwgmGhWxseHAw'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Row(
              children: [
                Text(
                  '유저이름',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Expanded(child: Container()),
                thumsUpWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text('고양이는 정말 귀여워 \n그렇지 않니?'),
          ),
          K_DivLine,
        ],
      ),
    );
  }
}

class thumsUpWidget extends StatefulWidget {
  @override
  State<thumsUpWidget> createState() => _thumsUpWidgetState();
}

class _thumsUpWidgetState extends State<thumsUpWidget> {
  bool isClick = false;
  int likeNum = 100;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (isClick) {
                likeNum--;
                isClick = !isClick;
              } else {
                likeNum++;
                isClick = !isClick;
              }
            });
          },
          child: Icon(
            isClick ? Icons.run_circle : Icons.run_circle_outlined,
            size: 24,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          likeNum.toString(),
          style: TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
