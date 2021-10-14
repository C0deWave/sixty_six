import 'package:flutter/material.dart';
import 'dart:math';
import '../Class/custom_point.dart';

//방문록 페이지에 나오는 사람하나의 객체입니다.

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  //초기 위치값

  //** 변수 **
  late CustomPoint _customdpoint; // 위치 객체
  double _height = Random.secure().nextInt(10) * 100 + 100; // 랜덤 x값
  double _width = Random.secure().nextInt(10) * 100 + 100; // 랜덤 y값
  bool _isMove = true; // 화면 변환시 해제를 위함

  @override
  void initState() {
    super.initState();
    _customdpoint = CustomPoint(x: _width, y: _height);
    _height = _customdpoint.y;
    _width = _customdpoint.x;
    move();
  }

  // 화면전환시 객체가 더이상 움직이지 않게합니다.
  @override
  void dispose() {
    super.dispose();
    _isMove = false;
  }

  //무한반복으로 객체를 랜덤하게 움직입니다.
  void move() async {
    // 자동이동 구현
    for (int i = 1; i > 0; i++) {
      if (_isMove) {
        await Future.delayed(Duration(seconds: Random.secure().nextInt(6) + 1),
            () {
          setState(() {
            _customdpoint.GetMove(context);
            _height = _customdpoint.y;
            _width = _customdpoint.x;
          });
        });
      } else {
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 터치시에도 움직이도록 할당했습니다.
    return GestureDetector(
      onTap: () {
        setState(() {
          _customdpoint.GetMove(context);
          _height = _customdpoint.y;
          _width = _customdpoint.x;
        });
      },
      // 움직이는 핵심 코드
      // 컨테이너의 크기를 조절하는 방식으로 움직임을 구현했습니다.
      child: AnimatedContainer(
        alignment: Alignment.bottomRight,
        height: _height,
        width: _width,
        duration: Duration(milliseconds: 700),
        child: Image.asset(
          //TODO: 사람이미지로 교체
          'assets/ball.png',
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
