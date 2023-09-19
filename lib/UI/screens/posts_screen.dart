import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/posts/posts_bloc.dart';
import '../../models/post.dart';

class PostsScreen extends StatefulWidget {
  static String routName = "posts_screen";

  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    context.read<PostsBloc>().add(PostsLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
      if (state is PostsInitial || state is PostsLoading) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is PostsSuccess) {
        List<Post> posts = state.posts;
        if (posts.isEmpty) {
          return const Center(
            child: Text('No Posts'),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(
                      posts[index].content,
                    ),
                  );
                }),
          );
        }
      } else if (state is PostsFailure) {
        return Scaffold(
          body: Center(
            child: Text(state.error),
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: Text('something went wrong'),
          ),
        );
      }
    });
  }
}
