import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maaly_alkhayr_test_project/UI/widgets/posts_widget.dart';

import '../../blocs/posts/posts_bloc.dart';
import '../../models/post.dart';

class PostsScreen extends StatefulWidget {
  static String routName = "posts_screen";

  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final ScrollController scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    context.read<PostsBloc>().add(PostsLoad(page));
    scrollController.addListener(_scrollListener);
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
          return const Scaffold(
            body: Center(
              child: Text('No Posts'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('All Posts'),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        'Add Post',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PostsWidget(scrollController, posts),
            ),
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

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page=page+1;
      context.read<PostsBloc>().add(PostsLoad(page));
    }
  }
}
