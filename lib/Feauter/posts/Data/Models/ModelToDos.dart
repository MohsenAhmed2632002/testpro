
import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityToDos.dart';

class ModelPosts extends ModelEnitityToDos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ModelPosts({
    required this.completed,
    required this.userId,
    required this.id,
    required this.title,
  }) : super(
            userId: userId,
            id: id,
            title: title,
            completed: completed);
}
