part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLaoding extends PostsState {}

final class PostsSuccess extends PostsState {
  final List<ModelEnitityPosts> myposts;

  PostsSuccess(this.myposts);
}

final class PostsFauiler extends PostsState {
  final String EM;

  PostsFauiler(this.EM);
}
