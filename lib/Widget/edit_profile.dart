import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sixty_six/Class/http_to_json.dart';
import 'package:sixty_six/Class/json_form.dart';
import 'package:sixty_six/Class/user_info_provider.dart';

class EditUserProfile extends StatefulWidget {
  EditUserProfile(
      {required this.intro, required this.userImageUrl, required this.name});

  String name;
  String intro;
  String userImageUrl;

  @override
  _EditUserProfileState createState() =>
      _EditUserProfileState(imageUri: userImageUrl, intro: intro, name: name);
}

class _EditUserProfileState extends State<EditUserProfile> {
  var imageUri;
  String intro;
  String name;
  late ImageProvider<Object> imageData;
  late TextEditingController _textController;
  late TextEditingController _nameTextController;
  _EditUserProfileState(
      {required this.imageUri, required this.intro, required this.name}) {
    imageData = NetworkImage(imageUri);
    _textController = TextEditingController(text: intro);
    _nameTextController = TextEditingController(text: name);
  }
  XFile? pickedImage;

  @override
  Widget build(BuildContext context) {
    UserInfoProvider UserData =
        Provider.of<UserInfoProvider>(context, listen: false);
    String dataUrl;

    Future imageUpload(var imageData, void function(String data)) async {
      await HttpToJson.makeSingleImagePostRequest(
          "http://ec2-3-37-132-137"
          ".ap-northeast-2.compute.amazonaws"
          ".com:8080/sixtysix/user/image/upload",
          imageData, (value) {
        function(value);
      });

      return "1";
    }

    //TODO : 계정정보 변경되는지 확인하기
    Future<String> changeUserData(String userImageUri) async {
      print('유저 데이터를 변경합니다.');
      // if (pickedImage != null) {
      // /user/update/admin/{id}
      print(userImageUri);
      String url = "http://ec2-3-37-132-137"
          ".ap-northeast-2.compute.amazonaws"
          ".com:8080/sixtysix/user/update/user/${UserData.getUserId()}";
      print(url);
      await HttpToJson.makePutRequest(
              url,
              JsonForm.UpdateUserJson(
                  user_image: userImageUri,
                  user_intro: _textController.text,
                  user_name: _nameTextController.text))
          .toString();
      print('계정정보 변경 완료');
      return "1";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("계정정보 변경"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                '닉네임',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _nameTextController,
              ),
              SizedBox(height: 30),
              Text(
                '이미지',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      print('이미지를 선택합니다.');
                      final ImagePicker picker = ImagePicker();
                      pickedImage =
                          await picker.pickImage(source: ImageSource.gallery);
                      print(pickedImage?.path);
                      if (pickedImage != null) {
                        setState(() {
                          imageData = AssetImage(pickedImage!.path);
                          print('이미지 변경 완료');
                        });
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageData, fit: BoxFit.fill)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '자기소개',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: _textController,
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () async {
                    print('계정정보 저장');
                    dataUrl = await imageUpload(pickedImage, (value) {
                      print('유저 데이터 업데이트');
                      print(value);
                      changeUserData(value);
                    });
                    print("이미지 업로드 완료");
                    // changeUserData(dataUrl.substring(2, 2));
                    //changeProviderData();
                    //Navigator.pop(context);
                  },
                  child: Text("저장"))
            ],
          ),
        ),
      ),
    );
  }
}
