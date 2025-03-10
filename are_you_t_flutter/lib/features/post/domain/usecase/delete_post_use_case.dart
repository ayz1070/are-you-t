import '../repository/post_repository.dart';

class DeletePostUseCase {
  final PostRepository repository;

  DeletePostUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.deletePost(id);
  }
}