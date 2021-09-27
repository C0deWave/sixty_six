// ignore: file_names
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import 'package:sixty_six/Class/http_to_json.dart';

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
              imageList.add(Image.file(
                File(imageData.path),
                fit: BoxFit.fill,
              ));
            } catch (e) {
              // ignore: avoid_print
              print(e);
            }
          }
          updateImageList(imageList);
        },
        child: DottedBorder(
          dashPattern: [18, 12],
          strokeWidth: 5,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          padding: const EdgeInsets.all(6),
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
