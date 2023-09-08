import 'package:testpro/Feauter/posts/Data/Datasour/Remote_data_ToDos.dart';
import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityToDos.dart';
import 'package:testpro/Feauter/posts/Domain/Repos/ReposToDos.dart';

class ToDosReposImpl extends ReposToDos {
  DataRemoteSourToDos dataRemoteSourToDos;
  ToDosReposImpl(this.dataRemoteSourToDos);
 
  @override
  Future<List<ModelEnitityToDos>> getToDos() async {
    var todo = await dataRemoteSourToDos.getToDos();
    return todo;
  }
}
