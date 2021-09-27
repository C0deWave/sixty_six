class JsonForm {
  //TODO : 나중에 나오는 api 양식 추가 및 uri 추가하기
  String PostJson() {
    return '';
  }

  String createWriteJson({
    required String content,
    required String name,
    required String imageUrl,
    required String location,
    required String longitude,
    required String latitude,
    required String likePost,
  }) {
    return '{'
        '"content": "$content",'
        ' "author": "$name", '
        '"image": "$imageUrl",'
        ' "location":"$location" , '
        '"longitude":"$longitude", '
        '"latitude":"$latitude", '
        '"likePost": $likePost '
        '}';
  }

  String updateWriteJson({required String content, required String imageUrl}) {
    return '{'
        '"content": "$content",'
        '"image": "$imageUrl"'
        '}';
  }

  String UserJson() {
    return '';
  }

  String ReportJson() {
    return '';
  }

  String LetterJson() {
    return '';
  }
}
