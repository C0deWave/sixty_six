import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';
import '../Widget/person_widget.dart';

// 네비게이션 3번 방문록 페이지 입니다.

class MainVisitLogPage extends StatelessWidget {
  const MainVisitLogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 내 주변
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "방문록",
                  style: K_NavigationHeadTextStyle,
                ),
              ),
            ],
          ),
          // 구분선
          K_DivLine,
          Expanded(
              child: Container(
            width: double.infinity,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Person(),
                Person(),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
