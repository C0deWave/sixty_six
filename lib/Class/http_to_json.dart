import 'dart:convert';
import 'package:http/http.dart';

class HttpToJson {
  Future getData(String url) async {
    Response response = await get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  void testGetData(String url) async {
    Response response = await get(Uri.parse(url));
    print(response.body);
  }
}
