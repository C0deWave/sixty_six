import 'package:flutter/material.dart';

class LikeWidget extends StatefulWidget {
  LikeWidget({required this.isClick, required this.likeNum});
  bool isClick;
  int likeNum;

  @override
  State<LikeWidget> createState() =>
      _LikeWidgetState(isClick: isClick, likeNum: likeNum);
}

class _LikeWidgetState extends State<LikeWidget> {
  _LikeWidgetState({required this.isClick, required this.likeNum});
  bool isClick;
  int likeNum;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (isClick) {
                //TODO: 좋아요--기능 네트워킹
                likeNum--;
                isClick = !isClick;
              } else {
                //TODO: 좋아요++기능 네트워킹
                likeNum++;
                isClick = !isClick;
              }
            });
          },
          child: Icon(
            isClick ? Icons.run_circle : Icons.run_circle_outlined,
            size: 30,
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          likeNum.toString(),
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
