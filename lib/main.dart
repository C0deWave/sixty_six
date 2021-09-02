import 'package:flutter/material.dart';
import 'Screen/login_page.dart';
import 'Screen/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/main',
      routes: {
        '/login': (context) => LoginPage(),
        '/main': (context) => MainPage(),
      },
    );
  }
}
