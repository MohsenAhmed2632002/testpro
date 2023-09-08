import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityPosts.dart';
import 'package:testpro/Feauter/posts/Domain/UseCase/FechPostsUseCaes.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.fechPostsUseCaes) : super(PostsInitial());
  FechPostsUseCaes fechPostsUseCaes;
  Future fechPosts() async {
    emit(PostsLaoding());
    emit(
      PostsSuccess(
        (await fechPostsUseCaes.call()),
      ),
    );
  }
}
