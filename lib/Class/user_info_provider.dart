import 'package:flutter/cupertino.dart';

class UserInfoProvider extends ChangeNotifier {
  String _user_token = "";
  String _id = "";
  String _user_email = "";
  String _user_name = "";
  String _user_image = "";
  String _user_intro = "";
  String _user_write = "";
  String _user_like = "";
  String _role = "";

  String getUserId() => _id.toString();
  String getUserEmail() => _user_email.toString();
  String getUserName() => _user_name.toString();
  String getUserImage() => _user_image.toString();
  String getUserIntro() => _user_intro.toString();
  String getUserWrite() => _user_write.toString();
  String getUserLike() => _user_like.toString();
  String getUserRole() => _role.toString();
  String getUserToken() => _user_token.toString();

  // 내부가 변경될 경우 아래와 같이 함수를 구현한다.
  void setUserToken(String UserToken) {
    print('UserToken: ' + UserToken.toString());
    _user_token = UserToken;
  }

  void setUserId(String UserId) {
    print('UserId: ' + UserId.toString());
    _id = UserId;
  }

  void setUserEmail(String UserEmail) {
    print('UserEmail: ' + UserEmail.toString());
    _user_email = UserEmail;
  }

  void setUserName(String UserName) {
    print('UserName: ' + UserName.toString());
    _user_name = UserName;
  }

  void setUserImage(String UserImage) {
    print('UserImage: ' + UserImage.toString());
    _user_image = UserImage;
  }

  void setUserIntro(String UserIntro) {
    print('UserIntro: ' + UserIntro.toString());
    _user_intro = UserIntro;
  }

  void setUserWrite(String UserWrite) {
    print('UserWrite: ' + UserWrite.toString());
    _user_write = UserWrite;
  }

  void setUserLike(String UserLike) {
    print('UserLike: ' + UserLike.toString());
    _user_like = UserLike;
  }

  void setUserRole(String UserRole) {
    print('UserRole: ' + UserRole.toString());
    _role = UserRole;
  }

  void CallNotify() {
    notifyListeners();
  }
}
