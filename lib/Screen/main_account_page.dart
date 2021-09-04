import 'package:flutter/material.dart';

class MainAccountPage extends StatelessWidget {
  const MainAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '내계정',
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }
}
