import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';
import '../Widget/peed_item_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//네비게이션 1번 메인 피드페이지 입니다.

class MainPeedPage extends StatefulWidget {
  const MainPeedPage({Key? key}) : super(key: key);

  @override
  State<MainPeedPage> createState() => _MainPeedPageState();
}

class _MainPeedPageState extends State<MainPeedPage> {
  RefreshController _refreshController = RefreshController();
  int loadingcount = 1;
  bool isEnableBottomIndicator = true;
  var peedList = [
    PeedItemWidget(
      imageurl:
          'https://img.insight.co.kr/static/2020/08/14/700/9x958897t7a9ktzei33h.jpg',
      userName: '훈이',
      content: '나는 오늘도 게임을 한다.',
      isClickThumsUp: false,
      likeNum: 100,
      userImage:
          'https://upload.wikimedia.org/wikipedia/ko/6/6d/%EC%98%A4%EB%A7%88%EC%9D%B4%EA%B1%B8_-_OH_MY_GIRL.jpg',
    ),
    PeedItemWidget(
      imageurl:
          'https://img.insight.co.kr/static/2020/08/14/700/9x958897t7a9ktzei33h.jpg',
      userName: '훈이',
      content: '나는 오늘도 게임을 한다.',
      isClickThumsUp: false,
      likeNum: 100,
      userImage:
          'https://upload.wikimedia.org/wikipedia/ko/6/6d/%EC%98%A4%EB%A7%88%EC%9D%B4%EA%B1%B8_-_OH_MY_GIRL.jpg',
    ),
    PeedItemWidget(
      imageurl:
          'https://img.insight.co.kr/static/2020/08/14/700/9x958897t7a9ktzei33h.jpg',
      userName: '훈이',
      content: '나는 오늘도 게임을 한다.',
      isClickThumsUp: false,
      likeNum: 100,
      userImage:
          'https://upload.wikimedia.org/wikipedia/ko/6/6d/%EC%98%A4%EB%A7%88%EC%9D%B4%EA%B1%B8_-_OH_MY_GIRL.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          // 내 주변
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Text(
              "내 주변",
              style: K_NavigationHeadTextStyle,
            ),
          ),
          // 구분선
          K_DivLine,
          Expanded(
            child: SmartRefresher(
              header: ClassicHeader(),
              footer: ClassicFooter(),
              enablePullUp: isEnableBottomIndicator,
              enablePullDown: true,
              onRefresh: () async {
                //TODO:새로고침 기능이다. 글 불러오기
                await Future.delayed(const Duration(milliseconds: 2000));
                print('Refresh호출');
                setState(() {
                  isEnableBottomIndicator = true;
                  loadingcount = 1;
                  peedList.clear();
                  peedList.add(PeedItemWidget(
                    imageurl:
                        'https://img.insight.co.kr/static/2020/08/14/700/9x958897t7a9ktzei33h.jpg',
                    userName: '훈이',
                    content: '나는 오늘도 게임을 한다.',
                    isClickThumsUp: false,
                    likeNum: 100,
                    userImage:
                        'https://upload.wikimedia.org/wikipedia/ko/6/6d/%EC%98%A4%EB%A7%88%EC%9D%B4%EA%B1%B8_-_OH_MY_GIRL.jpg',
                  ));
                });
                _refreshController.refreshCompleted();
              },
              onLoading: () async {
                //TODO: 하단 로딩 기능 -> 글 추가하기
                await Future.delayed(const Duration(milliseconds: 2000));
                print('Loading호출');
                setState(() {
                  peedList.add(PeedItemWidget(
                    imageurl:
                        'https://img.insight.co.kr/static/2020/08/14/700/9x958897t7a9ktzei33h.jpg',
                    userName: '훈이',
                    content: '나는 오늘도 게임을 한다.',
                    isClickThumsUp: false,
                    likeNum: 100,
                    userImage:
                        'https://upload.wikimedia.org/wikipedia/ko/6/6d/%EC%98%A4%EB%A7%88%EC%9D%B4%EA%B1%B8_-_OH_MY_GIRL.jpg',
                  ));
                  loadingcount++;
                  if (loadingcount >= 12) {
                    //sss
                    print('하단 인디케이터 막힘');
                    isEnableBottomIndicator = false;
                  }
                });
                _refreshController.loadComplete();
              },
              controller: _refreshController,
              child: SingleChildScrollView(
                child: Column(
                  children: peedList,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
