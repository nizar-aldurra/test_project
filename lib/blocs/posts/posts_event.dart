part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {}

class FetchPostsEvent extends PostsEvent {
  FetchPostsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadMorePostsEvent extends PostsEvent {
  @override
  List<Object?> get props => [];
}

class AddPostEvent extends PostsEvent {
  final Post post;

  AddPostEvent({required this.post});

  @override
  List<Object> get props => [post];
}
