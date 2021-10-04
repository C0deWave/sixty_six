import 'package:flutter/cupertino.dart';

class UserInfoProvider extends ChangeNotifier {
  String userToken = "";
  String userName = "";
  String userImageUri = "";
  String userIntro = "";

  void setUserToken(String userToken) => this.userToken = userToken;
  void setUserName(String userName) => this.userName = userName;
  void setImageUri(String userImageUri) => this.userImageUri = userImageUri;
  void setUserIntro(String userIntro) => this.userIntro = userIntro;
}
