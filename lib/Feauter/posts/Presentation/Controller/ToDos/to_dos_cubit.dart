import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityToDos.dart';
import 'package:testpro/Feauter/posts/Domain/UseCase/GetPostsUseCaes.dart';

part 'to_dos_state.dart';

class ToDosCubit extends Cubit<ToDosState> {
  ToDosCubit(this.getToDosUseCaes) : super(ToDosInitial());
  GetToDosUseCaes getToDosUseCaes;
  Future getTodos() async {
    emit(ToDosLaoding());
    emit(
      ToDosSuccess(
        await getToDosUseCaes.call(),
      ),
    );
  }

}
