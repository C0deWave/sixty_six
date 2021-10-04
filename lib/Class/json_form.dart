class JsonForm {
  //TODO : 나중에 나오는 api 양식 추가 및 uri 추가하기
  static String PostJson() {
    return '';
  }

  // 업데이트 완료
  static String createPostJson({
    required String post_content,
    required String author_id,
    required String post_image,
    required String post_location,
    required String Longitude,
    required String Latitude,
    required String post_like,
  }) {
    return '{'
        '"post_content": "$post_content",'
        ' "author_id": "$author_id", '
        '"post_image": "$post_image",'
        ' "post_location":"$post_location" , '
        '"Longitude":"$Longitude", '
        '"Latitude":"$Latitude", '
        '"post_like": $post_like '
        '}';
  }

  //업데이트 완료
  static String updatePostJson({
    required String post_content,
    required String post_image,
  }) {
    return '{'
        '"post_content": "$post_content",'
        '"post_image": "$post_image"'
        '}';
  }

  //피드 찾기
  static String findPostJson({
    required String location,
    required String total,
  }) {
    return '{'
        '"location": "$location",'
        '"total": "$total"'
        '}';
  }

  //이미지 업로드 하기
  // TODO :  이미지 업로드 부분 API 확인하기
  static String uploadPostImageJson({
    required String location,
    required String code,
  }) {
    return '{'
        '"location": "$location",'
        '"total": "$code"'
        '}';
  }

  //좋아요 수 변경하기
  static String changePostLikeJson({
    required String post_like,
  }) {
    return '{'
        '"post_like": "$post_like"'
        '}';
  }

  // 업데이트 완료
  static String UpdateUserJson(
      {required String user_name,
      required String user_image,
      required String user_intro}) {
    return '{'
        '"user_name": "$user_name",'
        '"user_image": "$user_image",'
        '"user_intro": "$user_intro"'
        '}';
  }
}
