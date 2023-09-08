part of 'to_dos_cubit.dart';

@immutable
sealed class ToDosState {}

final class ToDosInitial extends ToDosState {}

final class ToDosLaoding extends ToDosState {}

final class ToDosSuccess extends ToDosState {
  final List<ModelEnitityToDos> myToDos;

  ToDosSuccess(this.myToDos);
}

final class ToDosFauiler extends ToDosState {
  final String EM;

  ToDosFauiler(this.EM);
}
