import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class UpdatePostUseCase {
  final PostRepository repository;

  UpdatePostUseCase(this.repository);

  Future<void> call(PostEntity post) async {
    await repository.updatePost(post);
  }
}