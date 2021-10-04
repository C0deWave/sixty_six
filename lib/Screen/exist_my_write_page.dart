import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'dart:io' show Platform;

class ExistWriteData extends StatefulWidget {
  List<Widget> imageList;
  ExistWriteData(
      {required this.showFab,
      required this.isBeforeWriten,
      required this.imageList});
  Function showFab;
  final int isBeforeWriten;

  @override
  State<ExistWriteData> createState() =>
      _ExistWriteDataState(showFab: showFab, imageList: imageList);
}

class _ExistWriteDataState extends State<ExistWriteData> {
  _ExistWriteDataState({required this.showFab, required this.imageList});
  Function showFab;
  void deleteCurrentImage() {
    setState(() {
      imageList.remove(imageList[currentPage]);
    });
  }

  int currentPage = 0;
  List<Widget> imageList;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: (widget.isBeforeWriten == 0)
                ? ImageSlideshow(
                    width: double.infinity,
                    height: double.infinity,
                    initialPage: 0,
                    indicatorColor: Colors.deepOrangeAccent,
                    indicatorBackgroundColor: Colors.grey,
                    onPageChanged: (value) {
                      debugPrint('Page changed: $value');
                      currentPage = value;
                    },
                    autoPlayInterval: 0,
                    isLoop: false,
                    children: imageList,
                  )
                //TODO: 네트워크 이미지 가져오기 부분 개선
                : Image.network(''),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                width: 20,
                height: 1,
              ),
              Text(
                "유저 이름",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              TextButton(
                  onPressed: () async {
                    if (Platform.isIOS) {
                      // if (true) {
                      //TODO: Alert 리팩토링 하기
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false, // user must tap button!
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Text('이미지 삭제'),
                            content: Text('이미지를 삭제하시겠습니까?'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: Text('Yes'),
                                onPressed: () {
                                  deleteCurrentImage();
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (Platform.isAndroid) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('AlertDialog Title'),
                          content: const Text('AlertDialog description'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text('해당 이미지 삭제')),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              onTap: () {
                showFab();
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
          TextButton(
              onPressed: () {
                //TODO: 게시글 삭제 구현
              },
              child: Text('게시글 삭제')),
        ],
      ),
    );
  }
}
