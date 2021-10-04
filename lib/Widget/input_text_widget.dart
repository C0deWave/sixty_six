import 'package:flutter/material.dart';

class inputTextWidget extends StatelessWidget {
  inputTextWidget(
      {Key? key, required this.messageList, required this.sendCallback})
      : super(key: key);

  final textController = TextEditingController();
  final List<Widget> messageList;
  final Function(String data) sendCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 3), blurRadius: 5, color: Colors.grey)
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.attach_file, color: Colors.blueAccent),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          hintText: "",
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.blueAccent),
                    onPressed: () {
                      sendCallback(textController.text);
                      textController.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
