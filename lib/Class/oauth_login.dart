import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'data_shared_preference.dart';
import 'dart:io' show Platform;

class OauthLogin {
  Future googleLogin() async {
    final iosGoogleClientId =
        '625204130102-cu51pa6i9pb55dqsuefqutcf2l9b3a0k.apps.googleusercontent.com';
    final iosCallbackUrlScheme =
        'com.googleusercontent.apps.625204130102-cu51pa6i9pb55dqsuefqutcf2l9b3a0k';
    final androidGoogleClientId =
        "625204130102-fafjfcsta0cbs2dqbj7tahnr1d8dd39n.apps.googleusercontent.com";
    final androidCallbackUrlScheme =
        "com.googleusercontent.apps.625204130102-fafjfcsta0cbs2dqbj7tahnr1d8dd39n";

    Uri url = Uri();
    if (Platform.isIOS) {
      url = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
        'response_type': 'code',
        'client_id': iosGoogleClientId,
        'redirect_uri': '$iosCallbackUrlScheme:/',
        'scope': 'email',
      });
    } else if (Platform.isAndroid) {
      url = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
        'response_type': 'code',
        'client_id': androidGoogleClientId,
        'redirect_uri': '$androidCallbackUrlScheme://',
        'scope': 'email',
      });
    }

    String result = "";
    try {
      if (Platform.isIOS) {
        result = await FlutterWebAuth.authenticate(
            url: url.toString(), callbackUrlScheme: iosCallbackUrlScheme);
      } else if (Platform.isAndroid) {
        result = await FlutterWebAuth.authenticate(
            url: url.toString(), callbackUrlScheme: androidCallbackUrlScheme);
      }
    } catch (e) {
      print('에러' + e.toString());
    }

    print('응답' + result);

    final String codes = Uri.parse(result).queryParameters['code'] ?? "";

    print('code');
    print(codes);

    var response;
    if (Platform.isIOS) {
      response = await http
          .post(Uri.parse('https://www.googleapis.com/oauth2/v4/token'), body: {
        'client_id': iosGoogleClientId,
        'redirect_uri': '$iosCallbackUrlScheme:/',
        'grant_type': 'authorization_code',
        'code': codes,
      });
    } else if (Platform.isAndroid) {
      response = await http
          .post(Uri.parse('https://www.googleapis.com/oauth2/v4/token'), body: {
        'client_id': androidGoogleClientId,
        'redirect_uri': '$androidCallbackUrlScheme://',
        'grant_type': 'authorization_code',
        'code': codes,
      });
    }

// Get the access token from the response
//                 final accessToken =
//                     jsonDecode(response.body)['access_token'] as String;
    print('response');
    print(response.body);
    return response.body;
  }
}
