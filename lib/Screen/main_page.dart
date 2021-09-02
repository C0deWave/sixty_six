import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            title: Text('피드'),
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            title: Text('내게시글'),
            icon: Icon(Icons.account_balance_wallet),
          ),
          BottomNavigationBarItem(
            title: Text('방문록'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('내계정'),
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List _widgetOptions = [
    Text(
      'Favorites',
      style: TextStyle(
        fontSize: 30,
      ),
    ),
    Text(
      'Music',
      style: TextStyle(
        fontSize: 30,
      ),
    ),
    Text(
      'Places',
      style: TextStyle(
        fontSize: 30,
      ),
    ),
    Text(
      '내계정',
      style: TextStyle(
        fontSize: 30,
      ),
    ),
  ];
}
