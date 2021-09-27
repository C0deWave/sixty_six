import 'dart:convert';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class HttpToJson {
  Future getData(String url) async {
    Response response = await get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  void testGetData(String url) async {
    Response response = await get(Uri.parse(url));
    print(response.body);
  }

  Future<void> makePostRequest(String customUrl, String json) async {
    final url = Uri.parse(customUrl);
    final headers = {"Content-type": "application/json"};
    final response = await post(url, headers: headers, body: json);
    // final response = await post(url, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    return jsonDecode(response.body);
  }

  Future<void> makeGetRequest(String customUrl) async {
    final url = Uri.parse(customUrl);
    Response response = await get(url);
    print('Status code: ${response.statusCode}');
    print('Body: ${jsonDecode(utf8.decode(response.bodyBytes))}');
    return jsonDecode(response.body);
  }

  Future<void> makePutRequest(String customUrl, String json) async {
    final url = Uri.parse(customUrl);
    final headers = {"Content-type": "application/json"};
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    return jsonDecode(response.body);
  }

  Future<void> makeDeleteRequest(String customUrl) async {
    final url = Uri.parse(customUrl);
    final response = await delete(url);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }

  Future<void> makeImagePostRequest(
      String customUrl, List<XFile> imageList) async {
    final url = Uri.parse(customUrl);
    var request = MultipartRequest("POST", url);

    for (var imageFile in imageList) {
      request.files.add(await MultipartFile.fromPath(
        'images',
        imageFile.path,
      ));
    }

    var requested = await request.send();
    var response = await Response.fromStream(requested);
    print('Status code: ${response.statusCode}');
    print('Stream: ${(response.body)}');
    return jsonDecode(response.body);
  }
}
