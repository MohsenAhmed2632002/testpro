import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityPosts.dart';
import 'package:testpro/Feauter/posts/Domain/Repos/ReposPosts.dart';

class FechPostsUseCaes {
  ReposPosts reposPosts;
  FechPostsUseCaes(this.reposPosts);
  Future<List<ModelEnitityPosts>> call() async {

    return await reposPosts.fechPosts();
  }
}
