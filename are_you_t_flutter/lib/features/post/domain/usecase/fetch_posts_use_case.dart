import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class FetchPostsUseCase {
  final PostRepository repository;

  FetchPostsUseCase(this.repository);

  Future<List<PostEntity>> call() async {
    return await repository.fetchPosts();
  }
}