import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../Widget/image_add_widget.dart';

class NotExistWriteData extends StatefulWidget {
  Function changeWriteModeFunction;
  Function(List<Widget>) updateImageList;

  NotExistWriteData(
      {required this.changeWriteModeFunction, required this.updateImageList});

  @override
  State<NotExistWriteData> createState() => _NotExistWriteDataState(
      changeWriteModeFunction: changeWriteModeFunction,
      updateImageList: updateImageList);
}

class _NotExistWriteDataState extends State<NotExistWriteData> {
  _NotExistWriteDataState(
      {required this.changeWriteModeFunction, required this.updateImageList});
  Function changeWriteModeFunction;
  Function(List<Widget>) updateImageList;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ImageAddWidget(
      updateImageList: (List<Widget> data) {
        print('이미지 업데이트');
        updateImageList(data);
        changeWriteModeFunction();
      },
    ));
  }
}
