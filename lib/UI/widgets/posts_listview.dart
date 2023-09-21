import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maaly_alkhayr_test_project/UI/widgets/post_card.dart';
import 'package:maaly_alkhayr_test_project/blocs/posts/posts_bloc.dart';
import 'package:maaly_alkhayr_test_project/models/post.dart';

Widget PostsListView(ScrollController scrollController,List<Post> posts,PostsState state){
  return ListView.builder(
    controller: scrollController,
      itemCount: posts.length+1,
      itemBuilder: (BuildContext context, int index) {
      if (index<posts.length) {
        return PostCard(posts,index);
      }else if(state is PostLoadedState && state.hasReachedMax!=true){
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        );
      }else{
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: Text('you have seen all the posts')),
        );
      }

      });
}