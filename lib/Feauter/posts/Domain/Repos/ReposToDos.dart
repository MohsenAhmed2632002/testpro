import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityToDos.dart';

abstract class ReposToDos {
  Future<List<ModelEnitityToDos>> getToDos();
}
