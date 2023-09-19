import 'package:maaly_alkhayr_test_project/models/media.dart';

class Post {
  String content = "";
  int commentsNum = 0;
  int interactionsNum = 0;
  int shareNum = 0;
  List<Media>? media;

  Post({required this.content, this.media});

  Post.fromMap(Map<String, dynamic> map) {
    content = map['content'].toString();
    media = map['media'] == null
        ? ((map['media']!.map<Media>((e) => Media.fromMap(e))).toList()
            as List<Media>)
        : media;
    commentsNum = map['comments_count'];
    interactionsNum = map['interactions_count'];
    shareNum = map['shares_count'];
  }

  @override
  String toString() {
    return 'Post { content: $content , media : $media';
  }
}
