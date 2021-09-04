import 'package:flutter/material.dart';
import '../Widget/sign_in_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'main_nevigation_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Center(
            child: Text(
              '66',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      RotateAnimatedText('우리',
                          textStyle: TextStyle(color: Colors.black)),
                      RotateAnimatedText('주변의',
                          textStyle: TextStyle(color: Colors.black)),
                      RotateAnimatedText('SNS',
                          textStyle: TextStyle(color: Colors.black)),
                    ],
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 400,
              height: 2,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: googleButton(
              function: () {
                print('버튼클릭');
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
