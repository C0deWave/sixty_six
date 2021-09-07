import 'package:flutter/material.dart';
import 'Screen/login_page.dart';
import 'Screen/main_nevigation_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sixty6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
