import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class MainMyWriitePage extends StatefulWidget {
  const MainMyWriitePage({Key? key}) : super(key: key);

  @override
  State<MainMyWriitePage> createState() => _MainMyWriitePageState();
}

class _MainMyWriitePageState extends State<MainMyWriitePage> {
  final ImagePicker _picker = ImagePicker();
  _MainMyWriitePageState() {
    //TODO: 유저 API를 먼저 호출한다.
    print('내 게시글 화면 호출');
  }

  bool isFabVisible = false;
  bool isUserWritePage = false;
  int isBeforeWriten = 0;
  List<XFile> pickedFileList = [];
  List<Image> imageList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: isFabVisible
            ? FloatingActionButton(
                onPressed: () {
                  //TODO: 이미지 저장을 먼저 진행을 한 다음에 글을 업로드 구현을 한다.
                  print('저장버튼입니다.');
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: Icon(Icons.send),
              )
            : null,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            isUserWritePage
                // 글을 쓴 경우 화면
                ? Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1 / 1,
                            child: (isBeforeWriten == 0)
                                ? ImageSlideshow(
                                    width: double.infinity,
                                    height: double.infinity,
                                    initialPage: 0,
                                    indicatorColor: Colors.deepOrangeAccent,
                                    indicatorBackgroundColor: Colors.grey,
                                    onPageChanged: (value) {
                                      debugPrint('Page changed: $value');
                                    },
                                    autoPlayInterval: 0,
                                    isLoop: false,
                                    children: imageList,
                                  )
                                : Image.network(''),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "유저 이름",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              onTap: () {
                                setState(() {
                                  isFabVisible = true;
                                });
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                //글을 안 쓴 경우 화면
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () async {
                          print('사진을 선택합니다.');
                          pickedFileList = (await _picker.pickMultiImage())!;

                          for (var imagedata in await pickedFileList) {
                            try {
                              imageList.add(Image.file(
                                File(imagedata.path),
                                fit: BoxFit.fill,
                              ));
                            } catch (e) {
                              print(e);
                            }
                          }

                          setState(() {
                            isUserWritePage = true;
                          });
                        },
                        child: DottedBorder(
                          dashPattern: [18, 12],
                          strokeWidth: 5,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          padding: EdgeInsets.all(6),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.add_a_photo_rounded,
                                      size: 60,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '사진을 선택해 주세요.',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
