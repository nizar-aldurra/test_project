import 'package:flutter/cupertino.dart';
import 'package:maaly_alkhayr_test_project/UI/widgets/post_widget.dart';
import 'package:maaly_alkhayr_test_project/models/post.dart';

Widget PostsWidget(List<Post> posts){
  return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostWidget(posts,index);
      });
}