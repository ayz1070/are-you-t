import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class FetchPostsUseCase {
  final PostRepository repository;

  FetchPostsUseCase({required this.repository});

  Future<List<PostEntity>> call(int page, int size) async {
    return await repository.fetchPosts(page,size);
  }
}