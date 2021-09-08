import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sixty_six/constant.dart';
import 'dart:math';

class MainVisitLogPage extends StatelessWidget {
  const MainVisitLogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 내 주변
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "방문록",
                  style: K_NavigationHeadTextStyle,
                ),
              ),
            ],
          ),
          // 구분선
          K_DivLine,
          Expanded(
              child: Container(
            child: Stack(
              children: [
                Person(),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  var customdpoint = CustomPoint(x: 300, y: 300);

  //초기 위치값
  double height = 300;
  double width = 300;

  @override
  void initState() {
    super.initState();
    double height = customdpoint.getY();
    double width = customdpoint.getX();
    move();
  }

  void move() async {
    // 자동이동 구현
    for (int i = 1; i > 0; i++) {
      await Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          customdpoint.GetMove(context);
          height = customdpoint.y;
          width = customdpoint.x;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          customdpoint.GetMove(context);
          height = customdpoint.y;
          width = customdpoint.x;
        });
      },
      child: AnimatedContainer(
        alignment: Alignment.bottomLeft,
        height: height,
        width: width,
        duration: Duration(milliseconds: 500),
        child: Image.asset(
          'assets/ball.png',
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

//TODO: 포인트 객체화시키기
class CustomPoint {
  CustomPoint({required this.x, required this.y});
  double x;
  double y;

  var rng = Random.secure();
  double getX() {
    return x;
  }

  double getY() {
    return y;
  }

  void GetMove(BuildContext context) {
    // 0: up 1: down 2: right 3: left
    int result = rng.nextInt(4);
    switch (result) {
      case 0:
        {
          y -= 50;
          if (y < 100) {
            y = 100;
            print('max');
          }
          print('up');
        }
        break;
      case 1:
        {
          y += 50;
          if (y > MediaQuery.of(context).size.height) {
            y = MediaQuery.of(context).size.height;
            print('max');
          }
          print('down');
        }
        break;
      case 2:
        {
          x += 50;
          if (x > MediaQuery.of(context).size.width) {
            x = MediaQuery.of(context).size.width;
            print('max');
          }
          print('right');
        }
        break;
      case 3:
        {
          x -= 50;

          if (x < 100) {
            x = 100;
            print('max');
          }
          print('left');
        }
        break;
    }
  }
}
