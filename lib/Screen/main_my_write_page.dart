import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:sixty_six/Screen/exist_my_write_page.dart';
import 'package:sixty_six/Screen/not_exist_my_write_page.dart';
import 'package:sixty_six/Widget/image_add_widget.dart';
import 'package:sixty_six/constant.dart';

class MainMyWriitePage extends StatefulWidget {
  const MainMyWriitePage({Key? key}) : super(key: key);

  @override
  State<MainMyWriitePage> createState() => _MainMyWriitePageState();
}

class _MainMyWriitePageState extends State<MainMyWriitePage> {
  List<Widget> imageList = [];
  bool isFabVisible = false;
  bool isUserWritePage = false;
  int isBeforeWriten = 0;
  bool isLoading = false;

  _MainMyWriitePageState() {
    //TODO: 유저 API를 먼저 호출한다.
    print('내 게시글 화면 호출');
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> mainPage = [
      //제목
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            '내 게시글',
            style: K_NavigationHeadTextStyle,
          ),
        ),
      ),

      //구분선
      // 글을 안쓴 경우에만 보여준다.
      isUserWritePage ? Container() : K_DivLine,

      //본문 : 글을 쓴 경우와 안쓴 경우를 구분해야 한다.
      // 처음에 유저 테이블을 호출하고 오늘 글을 썼는지 확인을 한 다음에 화면을 보여준다.
      // 글을 쓰지 않을 경우 나오는 화면
      Expanded(
        child: LoadingOverlay(
          isLoading: false,
          child: isUserWritePage
              // 글을 쓴 경우 화면
              ? ExistWriteData(
                  isBeforeWriten: isBeforeWriten,
                  showFab: () => setState(() {
                        isFabVisible = true;
                      }),
                  imageList: imageList,
                  changeWritePage: () => setState(() {
                        print('사진 선택전 페이지로 이동합니다.');
                        isUserWritePage = false;
                      }))
              //글을 안 쓴 경우 화면
              : NotExistWriteData(
                  changeWriteModeFunction: () => setState(() {
                    print('이미지를 업데이트 합니다.');
                    isUserWritePage = true;
                  }),
                  updateImageList: (data) {
                    setState(() {
                      imageList.addAll(data);
                      imageList.add(ImageAddWidget(updateImageList: (data2) {
                        setState(() {
                          var temp = imageList.last;
                          imageList.remove(imageList.last);
                          imageList.addAll(data2);
                          imageList.add(temp);
                        });
                      }));
                    });
                  },
                ),
        ),
      ),
    ];

    return SafeArea(
      child: Scaffold(
        floatingActionButton: isFabVisible
            ? FloatingActionButton(
                onPressed: () {
                  //TODO: 이미지 저장을 먼저 진행을 한 다음에 글을 업로드 구현을 한다.
                  print('저장버튼입니다.');
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    isLoading = true;
                  });
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: Icon(Icons.send),
              )
            : null,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: mainPage,
        ),
      ),
    );
  }
}
