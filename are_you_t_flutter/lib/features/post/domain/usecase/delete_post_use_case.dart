import '../repository/post_repository.dart';

class DeletePostUseCase {
  final PostRepository repository;

  DeletePostUseCase({required this.repository});

  Future<void> call(int id) async {
    await repository.deletePost(id);
  }
}