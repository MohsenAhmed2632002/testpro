
import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityToDos.dart';
import 'package:testpro/Feauter/posts/Domain/Repos/ReposToDos.dart';

class GetToDosUseCaes {
  ReposToDos reposToDos;
  GetToDosUseCaes(this.reposToDos);
  Future<List<ModelEnitityToDos>> call() async {
    return await reposToDos.getToDos();
  }
}
