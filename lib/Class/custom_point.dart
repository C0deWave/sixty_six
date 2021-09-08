import 'dart:math';
import 'package:flutter/material.dart';

//Person 객체의 위치를 정하는 것을 도와주는 CustomPoint 객체입니다.

class CustomPoint {
  // 초기 위치값을 받아옵니다.
  CustomPoint({required this.x, required this.y});

  //추후에 사용할 랜덤객체입니다.
  // 시드가 자동으로 할당이 됩니다.
  var rng = Random.secure();
  double x;
  double y;

  //어느 방향으로 움직일지를 정합니다.
  void GetMove(BuildContext context) {
    // 0: up 1: down 2: right 3: left
    int result = rng.nextInt(4);
    switch (result) {
      case 0:
        {
          y -= 50;
          if (y < 100) {
            y = 100;
          }
        }
        break;
      case 1:
        {
          y += 50;
          if (y > MediaQuery.of(context).size.height) {
            y = MediaQuery.of(context).size.height;
          }
        }
        break;
      case 2:
        {
          x += 50;
          if (x > MediaQuery.of(context).size.width) {
            x = MediaQuery.of(context).size.width;
          }
        }
        break;
      case 3:
        {
          x -= 50;
          if (x < 100) {
            x = 100;
          }
        }
        break;
    }
  }
}
