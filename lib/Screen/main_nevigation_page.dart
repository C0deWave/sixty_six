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
  final List _widgetOptions = [
    MainPeedPage(),
    MainMyWriitePage(),
    MainVisitLogPage(),
    MainAccountPage(),
  ];

  int _selectedIndex = 0;
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    var MyBottomNavigationBar = BottomNavigationBar(
      iconSize: 20,
      type: BottomNavigationBarType.fixed,
      backgroundColor: color,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedLabelStyle: TextStyle(color: Colors.amber),
      // 라벨을 전부 보이지 않게 한다.
      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      currentIndex: _selectedIndex, //현재 선택된 Index
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: itemList,
    );

    return Scaffold(
      bottomNavigationBar: SizedBox(height: 51, child: MyBottomNavigationBar),
      // bottomNavigationBar: MyBottomNavigationBar,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List<BottomNavigationBarItem> itemList = const [
    BottomNavigationBarItem(
      label: '내주변',
      backgroundColor: Colors.white,
      icon: Icon(Icons.location_on),
    ),
    BottomNavigationBarItem(
      label: '내게시글',
      backgroundColor: Colors.white,
      icon: Icon(Icons.account_balance_wallet),
    ),
    BottomNavigationBarItem(
      label: '방문록',
      backgroundColor: Colors.white,
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: '내계정',
      backgroundColor: Colors.white,
      icon: Icon(Icons.account_circle),
    ),
  ];
}
