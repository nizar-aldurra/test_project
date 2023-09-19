import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/post.dart';
import '../../repositories/posts_repository.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsLoad>(_onPostsLoad);
  }

  late List _posts;
  PostsRepository postsRepository = PostsRepository();

  Future<void> _onPostsLoad(PostsLoad event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
     var response = await postsRepository.getPosts();
     // try{
      print('failed response : ${(response['data']['items'].map<Post>((e) => Post.fromMap(e)))}');
      List<Post> posts = (response['data']['items'].map<Post>((e) => Post.fromMap(e))).toList();
      emit(PostsSuccess(posts));
    // } catch(e) {
    //   print('failed response : ${response['data']['items'][0]} \n $e');
    //   emit(PostsFailure('something went wrong : $e'));
    // }
    }
}
