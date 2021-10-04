import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixty_six/Class/data_shared_preference.dart';
import 'package:sixty_six/Class/user_info_provider.dart';
import 'Screen/login_page.dart';
import 'Screen/main_nevigation_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserInfoProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String route = "/login";
  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sixty6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: route,
      routes: {
        '/login': (context) => LoginPage(),
        '/main': (context) => MainPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
