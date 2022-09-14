part of 'get_posts_bloc.dart';

abstract class GetPostsState extends Equatable {
  const GetPostsState();
  
  @override
  List<Object> get props => [];
}

class GetPostsLoading extends GetPostsState {}

class GetPostsLoaded extends GetPostsState {
  final List<PostModel> posts;

  const GetPostsLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class GetPostsError extends GetPostsState {
  final String message;

  const GetPostsError({required this.message});

  @override
  List<Object> get props => [message];
}
