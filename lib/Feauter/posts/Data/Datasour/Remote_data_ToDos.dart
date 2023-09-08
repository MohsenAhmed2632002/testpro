import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityToDos.dart';
import 'package:testpro/Servesies.dart';

abstract class DataSourToDos {
  Future<List<ModelEnitityToDos>> getToDos();
}

class DataRemoteSourToDos extends DataSourToDos {
  final ApiServices apiServices;
  DataRemoteSourToDos(this.apiServices);
  @override
  final String url = "https://jsonplaceholder.typicode.com/users/1/posts";

  // @override
  Future<List<ModelEnitityToDos>> getToDos() async {
    var dataList = (await apiServices.get(url: url));

    List<ModelEnitityToDos> toDosList = [];
    for (var item in dataList) {
      int id = item["id"];
      String title = item["title"];
      bool completed = item["completed"]??false;
      int userId = item["userId"];
      ModelEnitityToDos post = ModelEnitityToDos(
        id: id,
        title: title,
        completed: completed,
        userId: userId,
      );
      toDosList.add(post);
    }

    return toDosList;
  }
}
