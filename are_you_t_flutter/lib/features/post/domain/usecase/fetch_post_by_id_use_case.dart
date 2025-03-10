import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class FetchPostByIdUseCase {
  final PostRepository repository;

  FetchPostByIdUseCase(this.repository);

  Future<PostEntity?> call(String id) async {
    return await repository.fetchPostById(id);
  }
}