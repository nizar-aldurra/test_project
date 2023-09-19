class Post {
  String content = "";
  dynamic media;
  Post({required this.content,this.media});
  Post.fromMap(Map<String, dynamic> map){
    content= map['content'].toString();
    media= map['media'];
  }
}