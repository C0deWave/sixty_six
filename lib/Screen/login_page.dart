import 'package:flutter/material.dart';
import 'package:sixty_six/Class/data_shared_preference.dart';
import 'package:sixty_six/Class/oauth_login.dart';
import '../Widget/sign_in_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'main_nevigation_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  OauthLogin oauthLogin = OauthLogin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('초기화');
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 200),
          Center(
            child: Text(
              '66',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 10),
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
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: 400,
              height: 2,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: googleButton(
              function: () async {
                print('구글 버튼클릭');
                var data = await oauthLogin.googleLogin();
                SharedPreferenceData.setUserData("userToken", data);
                goMainPage();
              },
            ),
          )
        ],
      ),
    );
  }

  void checkLogin() async {
    var _data = await SharedPreferenceData.getUserData(key: "userToken");
    if (_data != "") goMainPage();
  }

  void goMainPage() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }
}
