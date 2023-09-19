part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();
  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {
}
class PostsLoading extends PostsState {
}

class PostsSuccess extends PostsState {
  List<Post> posts;
  PostsSuccess(this.posts);
}

class PostsFailure extends PostsState {
  String error;
  PostsFailure(this.error);
}
