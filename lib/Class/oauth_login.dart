import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'data_shared_preference.dart';

class OauthLogin {
  // TODO :: 안드로이드 분기 체크하기
  Future googleLogin() async {
    print(await SharedPreferenceData.getUserData(key: "userToken"));
    final googleClientId =
        '625204130102-cu51pa6i9pb55dqsuefqutcf2l9b3a0k.apps.googleusercontent.com';
    final callbackUrlScheme =
        'com.googleusercontent.apps.625204130102-cu51pa6i9pb55dqsuefqutcf2l9b3a0k';

    final url = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
      'response_type': 'code',
      'client_id': googleClientId,
      'redirect_uri': '$callbackUrlScheme:/',
      'scope': 'email',
    });

    final result = await FlutterWebAuth.authenticate(
        url: url.toString(), callbackUrlScheme: callbackUrlScheme);

    final code = Uri.parse(result).queryParameters['code'];

    final response = await http
        .post(Uri.parse('https://www.googleapis.com/oauth2/v4/token'), body: {
      'client_id': googleClientId,
      'redirect_uri': '$callbackUrlScheme:/',
      'grant_type': 'authorization_code',
      'code': code,
    });

// Get the access token from the response
//                 final accessToken =
//                     jsonDecode(response.body)['access_token'] as String;
    return response.body;
  }
}
