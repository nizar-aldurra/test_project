import 'package:maaly_alkhayr_test_project/models/media.dart';

class Post {
  String content = "";
  List<Media>? media;
  Post({required this.content,this.media});
  Post.fromMap(Map<String, dynamic> map){
    content= map['content'].toString();
    print((map['media'].map<Media>((e) => Media.fromMap(e))).toList());
    media= map['media']==null? ((map['media']!.map<Media>((e) => Media.fromMap(e))).toList() as List<Media>) : media;
  }

  @override
  String toString() {
    return 'Post { content: $content , media : $media';
  }
}