import 'package:flutter/material.dart';

class LetterRoomPage extends StatefulWidget {
  @override
  _LetterRoomPageState createState() => _LetterRoomPageState();
}

class _LetterRoomPageState extends State<LetterRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("채팅방 리스트"),
      ),
    );
  }
}
