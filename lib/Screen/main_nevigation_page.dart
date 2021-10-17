import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sixty_six/Class/data_shared_preference.dart';
import 'package:sixty_six/Class/http_to_json.dart';
import 'package:sixty_six/Class/user_info_provider.dart';
import 'main_peed_page.dart';
import 'main_my_write_page.dart';
import 'main_account_page.dart';
import 'main_visit_log_page.dart';

class MainPage extends StatefulWidget {
  MainPage({required this.UserData});
  final UserData;
  @override
  _MainPage createState() => _MainPage(UserData: UserData);
}

class _MainPage extends State<MainPage> {
  _MainPage({required this.UserData});
  final UserData;

  @override
  void initState() {
    super.initState();
    getUserData(UserData);
  }

  final List _widgetOptions = [
    MainPeedPage(),
    MainMyWriitePage(),
    MainVisitLogPage(),
    MainAccountPage(),
  ];

  void getUserData(UserInfoProvider UserData) async {
    Map<String, dynamic> userData = await HttpToJson.getData(
        "http://ec2-3-37-132-137.ap-northeast-2.compute.amazonaws.com:8080/sixtysix/user/search/1");
    print(userData['id']);
    SharedPreferenceData.setUserData("userId", userData['id'].toString());

    // Provider에 데이터를 저장합니다.
    UserData.setUserName(userData['user_name'].toString());
    UserData.setUserId(userData['id'].toString());
    UserData.setUserEmail(userData['user_email'].toString());
    UserData.setUserImage(userData['user_image'].toString());
    UserData.setUserRole(userData['role'].toString());
    UserData.setUserLike(userData['user_like'].toString());
    UserData.setUserIntro(userData['user_intro'].toString());
    UserData.setUserWrite(userData['user_write'].toString());
    UserData.CallNotify();
    print('provider 저장 완료');
  }

  int _selectedIndex = 0;
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    var MyBottomNavigationBar = BottomNavigationBar(
      iconSize: 20,
      type: BottomNavigationBarType.fixed,
      backgroundColor: color,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedLabelStyle: TextStyle(color: Colors.orange),
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
