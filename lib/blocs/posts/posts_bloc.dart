import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/post.dart';
import '../../repositories/posts_repository.dart';

part 'posts_event.dart';

part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostInitialState()) {
    on<FetchPostsEvent>(_onPostsLoad);
    on<LoadMorePostsEvent>(_onLoadMorePosts);
    on<AddPostEvent>(_onAddPost);
  }
  int page = 1;
  PostsRepository postsRepository = PostsRepository();


  Future<void> _onPostsLoad(
      FetchPostsEvent event, Emitter<PostsState> emit) async {
    emit(PostLoadingState());
    try {
      var response = await postsRepository.getPosts(page: 1);
      page = page + 1;
      List<Post> posts = (response['data']['items']
          .map<Post>((e) => Post.fromMap(e))).toList();
      emit(PostLoadedState(posts: posts, hasReachedMax: false));
    } catch (e) {
      emit(PostErrorState(error: 'Failed to fetch posts'));
    }
  }

  Future<void> _onLoadMorePosts(
      LoadMorePostsEvent event, Emitter<PostsState> emit) async {
    if (state is PostLoadedState) {
      final currentState = state as PostLoadedState;
      try {
        var response = await postsRepository.getPosts(page: page);
        page = page + 1;
        List<Post> posts = (response['data']['items']
            .map<Post>((e) => Post.fromMap(e))).toList();
        posts.isEmpty
            ? emit(PostLoadedState(
                posts: currentState.posts,
                hasReachedMax: true,
              ))
            : emit(PostLoadedState(
                posts: currentState.posts + posts,
                hasReachedMax: false,
              ));
      } catch (e) {
        emit(PostErrorState(error: 'Failed to load more posts'));
      }
    }
  }

  Future<void> _onAddPost(AddPostEvent event, Emitter<PostsState> emit) async {
    if (state is PostLoadedState) {
      final currentState = state as PostLoadedState;
      try {
        final newPost = await postsRepository.addPost(event.post);

        emit(PostLoadedState(
          posts: [newPost, ...currentState.posts],
          hasReachedMax: currentState.hasReachedMax,
        ));
      } catch (e) {
        emit(PostErrorState(error: 'Failed to add a new post'));
      }
    }
  }

}
