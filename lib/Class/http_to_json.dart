import 'dart:convert';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class HttpToJson {
  static Future getData(String url) async {
    final headers = {"Content-type": "application/json"};
    Response response = await get(Uri.parse(url), headers: headers);
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  static void testGetData(String url) async {
    Response response = await get(Uri.parse(url));
    print(response.body);
  }

  static Future makePostRequest(String customUrl, String json) async {
    final url = Uri.parse(customUrl);
    final headers = {"Content-type": "application/json"};
    final response = await post(url, headers: headers, body: json);
    // final response = await post(url, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    return jsonDecode(response.body);
  }

  static Future<String> makeGetRequest(
      String customUrl, Map<String, String> header) async {
    final url = Uri.parse(customUrl);
    Response response = await get(url, headers: header);
    print('Status code: ${response.statusCode}');
    print('Body: ${jsonDecode(utf8.decode(response.bodyBytes))}');
    var result = jsonDecode(response.body);
    return result['documents'][0]['address']['address_name'].toString();
  }

  static Future makePutRequest(String customUrl, String json) async {
    final url = Uri.parse(customUrl);
    final headers = {"Content-type": "application/json"};
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    return jsonDecode(response.body);
  }

  static Future makeDeleteRequest(String customUrl) async {
    final url = Uri.parse(customUrl);
    final response = await delete(url);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }

  static Future makeMultiImagePostRequest(
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

  static Future makeSingleImagePostRequest(
      String customUrl, XFile imageData) async {
    final url = Uri.parse(customUrl);
    var request = MultipartRequest("POST", url);
    print('1');
    request.fields['code'] = 'user';
    request.files.add(await MultipartFile.fromPath(
      'image',
      imageData.path,
    ));

    var requested = await request.send();
    var response = await Response.fromStream(requested);
    print('Status code: ${response.statusCode}');
    print('Stream: ${(response.body)}');
    return response.body.toString();
  }

  static Future makeImagePostRequest(String customUrl, String bodyData) async {
    final url = Uri.parse(customUrl);
    final headers = {"Content-type": "application/json"};
    final response = await post(url, headers: headers, body: bodyData);

    return jsonDecode(response.body);
  }
}
