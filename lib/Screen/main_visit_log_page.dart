import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';

class MainVisitLogPage extends StatelessWidget {
  const MainVisitLogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Column(
        children: [
          // 내 주변
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "방문록",
              style: K_NavigationHeadTextStyle,
            ),
          ),
          // 구분선
          K_DivLine,
        ],
      ),
    ));
  }
}
