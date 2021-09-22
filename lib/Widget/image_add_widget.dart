// ignore: file_names
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageAddWidget extends StatelessWidget {
  ImageAddWidget({required this.updateImageList});

  Function(List<Widget>) updateImageList;

  @override
  Widget build(BuildContext context) {
    List<XFile> pickedFileList = [];
    final ImagePicker picker = ImagePicker();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () async {
          List<Widget> imageList = [];
          pickedFileList = (await picker.pickMultiImage(
              maxHeight: double.infinity, maxWidth: double.infinity))!;
          imageList = [];
          for (var imageData in pickedFileList) {
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
