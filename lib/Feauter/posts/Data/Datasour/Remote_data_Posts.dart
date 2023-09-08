import 'package:dio/dio.dart';
import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityPosts.dart';
import 'package:testpro/Servesies.dart';

abstract class DataSourPosts {
  Future<List<ModelEnitityPosts>> fechPosts();
}

class RemoteDataSourPosts extends DataSourPosts {
  final ApiServices apiServices;
  final String url = "https://jsonplaceholder.typicode.com/users/1/posts";

  RemoteDataSourPosts(this.apiServices);
  @override
  Future<List<ModelEnitityPosts>> fechPosts() async {
    var dataList = (await apiServices.get(url: url)) ;

    List<ModelEnitityPosts> postsList = [];
    for (var item in dataList) {
      int id = item["id"];
      String title = item["title"];
      String body = item["body"];
      int userId = item["userId"];
      ModelEnitityPosts post = ModelEnitityPosts(
        id: id,
        title: title,
        body: body,
        userId: userId,
      );
      postsList.add(post);
    }

    return postsList;
  }
}
