import 'package:flutter/material.dart';
import 'main_peed_page.dart';
import 'main_my_write_page.dart';
import 'main_account_page.dart';
import 'main_visit_log_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _selectedIndex = 0;
  Color color = Colors.lightGreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: color,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 12,
        unselectedFontSize: 10,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            color = itemList[index].backgroundColor ?? Colors.grey;
          });
        },
        items: itemList,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List<BottomNavigationBarItem> itemList = const [
    BottomNavigationBarItem(
      label: '내주변',
      backgroundColor: Colors.lightGreen,
      icon: Icon(Icons.location_on),
    ),
    BottomNavigationBarItem(
      label: '내게시글',
      backgroundColor: Colors.deepOrangeAccent,
      icon: Icon(Icons.account_balance_wallet),
    ),
    BottomNavigationBarItem(
      label: '방문록',
      backgroundColor: Colors.purple,
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: '내계정',
      backgroundColor: Colors.indigo,
      icon: Icon(Icons.account_circle),
    ),
  ];

  List _widgetOptions = [
    MainPeedPage(),
    MainMyWriitePage(),
    MainVisitLogPage(),
    MainAccountPage(),
  ];
}
