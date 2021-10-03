import 'package:flutter/material.dart';
import 'Screen/login_page.dart';
import 'Screen/main_nevigation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _data = "";
  //TODO : 자동 로그인 리팩토링
  _MyAppState() {
    getUserData();
    print(_data);
  }
  void getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = await prefs.getString('userToken') ?? "";
    _data = counter;
    print('data ${_data}');
  }

  void setUserData(String userToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', userToken);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sixty6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: unrelated_type_equality_checks
      initialRoute: _data == "" ? '/main' : '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/main': (context) => MainPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
