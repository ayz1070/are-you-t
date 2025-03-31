import 'package:logger/logger.dart';

import '../entity/post_entity.dart';
import '../repository/post_repository.dart';

class FetchPostByIdUseCase {
  final PostRepository repository;
  final logger = Logger();

  FetchPostByIdUseCase({required this.repository});

  Future<PostEntity?> call(int postId) async {
    logger.i("[UseCase] 호출됨: postId=$postId");
    final post = await repository.fetchPostById(postId);
    logger.d("[UseCase] PostEntity 결과: ${post?.title}");
    return post;
  }
}