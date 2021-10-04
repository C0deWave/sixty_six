import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static Future<String> getUserData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString(key) ?? "";
    print("데이터를 반환합니다..");
    print(counter.toString());
    return counter.toString();
  }

  static void setUserData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
    print('데이터 로컬에 저장완료');
  }
}
