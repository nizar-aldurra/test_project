part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostInitialState extends PostsState {
}
class PostLoadingState extends PostsState {
}

class PostLoadedState extends PostsState {
  final List<Post> posts;
  final bool hasReachedMax;
  PostLoadedState({required this.posts,required this.hasReachedMax});

  @override
  List<Object> get props => [posts,hasReachedMax];
}

class PostErrorState extends PostsState {
  final String error;
  PostErrorState({required this.error});
}
