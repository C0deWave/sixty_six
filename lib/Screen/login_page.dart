import 'dart:convert';

import 'package:flutter/material.dart';
import '../Widget/sign_in_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    Future<String> getUserData() async {
      final prefs = await SharedPreferences.getInstance();
      final counter = prefs.getString('userToken') ?? "";
      return counter.toString();
    }

    void setUserData(String userToken) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('userToken', userToken);
      print('저장완료');
    }

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
              function: () async {
                print('버튼클릭');
                print(await getUserData());
// App specific variables
                final googleClientId =
                    '625204130102-cu51pa6i9pb55dqsuefqutcf2l9b3a0k.apps.googleusercontent.com';
                final callbackUrlScheme =
                    'com.googleusercontent.apps.625204130102-cu51pa6i9pb55dqsuefqutcf2l9b3a0k';

// Construct the url
                final url =
                    Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
                  'response_type': 'code',
                  'client_id': googleClientId,
                  'redirect_uri': '$callbackUrlScheme:/',
                  'scope': 'email',
                });

// Present the dialog to the user
                final result = await FlutterWebAuth.authenticate(
                    url: url.toString(), callbackUrlScheme: callbackUrlScheme);

// Extract code from resulting url
                final code = Uri.parse(result).queryParameters['code'];

// Use this code to get an access token
                final response = await http.post(
                    Uri.parse('https://www.googleapis.com/oauth2/v4/token'),
                    body: {
                      'client_id': googleClientId,
                      'redirect_uri': '$callbackUrlScheme:/',
                      'grant_type': 'authorization_code',
                      'code': code,
                    });

// Get the access token from the response
//                 final accessToken =
//                     jsonDecode(response.body)['access_token'] as String;
                final accessToken = response.body;
                setUserData(response.body);
                print(accessToken);
                // Navigator.pop(context);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => MainPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
