import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageAddWidget extends StatelessWidget {
  ImageAddWidget({required this.updateImageList});

  Function(List<Widget>) updateImageList;

  @override
  Widget build(BuildContext context) {
    List<XFile>? pickedFileList = [];
    final ImagePicker picker = ImagePicker();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () async {
          List<Widget> imageList = [];
          print('이미지 선택');
          pickedFileList = (await picker.pickMultiImage(
              maxHeight: double.infinity, maxWidth: double.infinity));
          print('이미지 출력');
          print(pickedFileList);

          //TODO : 이미지 업로드를 테스트 한다.
          // HttpToJson httpToJson = HttpToJson();
          // httpToJson.makeImagePostRequest("", pickedFileList ?? []);

          imageList = [];
          for (var imageData in pickedFileList ?? []) {
            try {
              print('이미지 리스트 추가');
              imageList.add(Image.file(
                File(imageData.path),
                fit: BoxFit.fill,
              ));
            } catch (e) {
              print(e);
            }
          }
          if (imageList.length > 0 && imageList.length < 7) {
            updateImageList(imageList);
          } else if (imageList.length > 7) {
            print('이미지 개수가 많아서 뒤의 나머지를 자릅니다.');
            //TODO : 이미지 추가하거나 자를때 로딩 화면 보여주기
            while (imageList.length > 7) {
              imageList.remove(imageList.last);
            }
            updateImageList(imageList);
          } else {
            print('이미지 개수가 적습니다.');
          }
        },
        child: DottedBorder(
          dashPattern: [18, 12],
          strokeWidth: 5,
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add_a_photo_rounded,
                      color: Colors.deepOrangeAccent,
                      size: 60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '사진을 선택해 주세요.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
