import 'dart:convert';

import 'package:maaly_alkhayr_test_project/models/media.dart';

class Post {
  String? content = "";
  int commentsNum = 0;
  int interactionsNum = 0;
  int shareNum = 0;
  List<Media>? media = [];

  Post({this.content, this.media});

  Post.fromMap(Map<String, dynamic> map) {
    content = map['content'].toString();
    media = map['media'] != null
        ? ((map['media']!.map<Media>((e) => Media.fromMap(e))).toList()
            as List<Media>)
        : media;
    commentsNum = map['comments_count'];
    interactionsNum = map['interactions_count'];
    shareNum = map['shares_count'];
  }
  Map<String, dynamic> toMap() {
    if(media==null){
      return {
        'content': content,
      };
    } else if (content =='' || content == null){
      return {
        'media': jsonEncode(media),
      };
    }
    else{
      return {
        'content': content,
        'media': jsonEncode(media),
      };
    }
  }

  @override
  String toString() {
    return 'Post { content: $content , media : $media';
  }
}
