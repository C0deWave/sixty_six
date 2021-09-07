import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';
import '../Widget/peed_item_widget.dart';

class MainPeedPage extends StatefulWidget {
  const MainPeedPage({Key? key}) : super(key: key);

  @override
  State<MainPeedPage> createState() => _MainPeedPageState();
}

class _MainPeedPageState extends State<MainPeedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          // 내 주변
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "내 주변",
              style: K_NavigationHeadTextStyle,
            ),
          ),
          // 구분선
          K_DivLine,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PeedItemWidget(
                    imageurl:
                        'https://img.insight.co.kr/static/2020/08/14/700/9x958897t7a9ktzei33h.jpg',
                    userName: '훈이',
                    content: '나는 오늘도 게임을 한다.',
                    isClickThumsUp: false,
                    likeNum: 100,
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
