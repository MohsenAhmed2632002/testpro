import 'package:testpro/Feauter/posts/Domain/Eintitis/ModelEnitityPosts.dart';

class ModelPosts extends ModelEnitityPosts {
  final int userId;
  final int id;
  final String title;
  final String body;

  ModelPosts({
    required this.body,
    required this.userId,
    required this.id,
    required this.title,
  }) : super(
            userId: userId,
            id: id,
            title: title,
            body: body);
}
