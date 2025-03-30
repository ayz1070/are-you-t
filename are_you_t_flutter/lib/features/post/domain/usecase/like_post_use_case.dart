import '../repository/post_repository.dart';

class LikePostUseCase {
  final PostRepository repository;

  LikePostUseCase(this.repository);

  Future<void> call(String postId) async {
    await repository.likePost(postId);
  }
}