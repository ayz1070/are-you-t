import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class CreatePostUseCase {
  final PostRepository repository;

  CreatePostUseCase({required this.repository});

  Future<PostEntity> call(PostEntity post) async {
    return await repository.createPost(post);
  }
}