import 'package:flutter/material.dart';
import 'package:sixty_six/Class/data_shared_preference.dart';
import 'package:sixty_six/Screen/login_page.dart';
import 'package:sixty_six/Widget/edit_profile.dart';
import 'package:sixty_six/constant.dart';

class MainAccountPage extends StatelessWidget {
  List<Widget> gridImageList = [
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
    Image.network(
        'https://pbs.twimg.com/profile_images/1193899336398073856/mzTWz7DN.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // 내계
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "내 계정",
                      style: K_NavigationHeadTextStyle,
                    ),
                  ),
                  // 구분선
                  K_DivLine,
                  //여백
                  SizedBox(
                    height: 10,
                  ),

                  // Circle image 부분
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://googleflutter.com/sample_image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),

                  //아이디
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      '아이디',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),

                  //자기소개
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      '안녕하세요 테스트용 텍스트 입니다. 모두 힘찬 하루 화이팅!!!!!!',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // 프로필 편집
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0))),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          context: context,
                          builder: (context) => Container(
                              height: MediaQuery.of(context).size.height - 40,
                              child: EditUserProfile(
                                userImageUrl: "",
                                intro: "",
                              )));
                    },
                    child: Text('프로필 편집'),
                  ),

                  //구분선
                  K_DivLine,

                  //갤러리 텍스트
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text('내 게시글'),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                        physics: new NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            childAspectRatio: 1 / 1,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                        itemCount: gridImageList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            child: gridImageList[index],
                          );
                        }),
                  ),

                  // 프로필 편집
                  TextButton(
                    onPressed: () {
                      SharedPreferenceData.setUserData("userToken", "");
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                      print("로그아웃 구현");
                    },
                    child: Text('로그아웃'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
