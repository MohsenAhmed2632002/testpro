import 'package:testpro/Feauter/posts/Data/Datasour/Remote_data_Posts.dart';
import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityPosts.dart';
import 'package:testpro/Feauter/posts/Domain/Repos/ReposPosts.dart';

class PostsReposImpl extends ReposPosts {
  RemoteDataSourPosts remoteDataSourPosts;
  PostsReposImpl(this.remoteDataSourPosts);
  @override
  Future<List<ModelEnitityPosts>> fechPosts() async {
    var posts = await remoteDataSourPosts.fechPosts();
    return posts;
  }
}
