import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class FetchPostByIdUseCase {
  final PostRepository repository;

  FetchPostByIdUseCase({required this.repository});

  Future<PostEntity?> call(int id) async {
    return await repository.fetchPostById(id);
  }
}