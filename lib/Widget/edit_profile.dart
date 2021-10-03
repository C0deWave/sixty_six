import 'package:flutter/material.dart';

class EditUserProfile extends StatefulWidget {
  EditUserProfile({required this.intro, required this.userImageUrl});

  String intro;
  String userImageUrl;

  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("계정정보 변경"),
      ),
      body: Container(),
    );
  }
}
