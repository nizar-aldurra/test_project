part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
}
class PostsLoad extends PostsEvent {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
