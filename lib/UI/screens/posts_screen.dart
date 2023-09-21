import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maaly_alkhayr_test_project/UI/screens/add_post_screen.dart';
import 'package:maaly_alkhayr_test_project/UI/widgets/posts_listview.dart';

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

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
      if (state is PostInitialState || state is PostLoadingState) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      } else if (state is PostLoadedState) {
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddPostScreen.routName);
                  },
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
              child: PostsListView(scrollController, posts,state),
            ),
          );
        }
      } else if (state is PostErrorState) {
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
      context.read<PostsBloc>().add(LoadMorePostsEvent());
    }
  }
}
