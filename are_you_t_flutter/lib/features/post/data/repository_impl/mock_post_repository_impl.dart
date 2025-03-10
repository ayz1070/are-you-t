import 'package:logger/logger.dart';

import '../../domain/entity/post_entity.dart';
import '../../domain/entity/post_status.dart';
import '../../domain/repository/post_repository.dart';

class MockPostRepositoryImpl implements PostRepository {
  final logger = Logger();

  final List<PostEntity> _mockPosts = List.generate(
    10,
        (index) => PostEntity(
      id: 'post_$index',
      memberId: 'user_$index',
      title: '제목 $index',
      content: '게시글 내용 $index',
      likes: index * 5,
      status: PostStatus.visible,
      createdAt: DateTime.now().subtract(Duration(days: index)),
      updatedAt: DateTime.now(),
    ),
  );

  @override
  Future<List<PostEntity>> fetchPosts() async {
    await Future.delayed(const Duration(milliseconds: 50)); // 네트워크 요청 시뮬레이션
    return _mockPosts;
  }

  @override
  Future<PostEntity?> fetchPostById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));

    final post = _mockPosts.firstWhere(
          (post) => post.id == id,
      orElse: () {
        logger.w("⚠️ Mock 데이터에서 postId=$id를 찾을 수 없음");
        throw Exception();
      },
    );

    if (post != null) {
      logger.i("✅ Mock 데이터에서 postId=$id 찾음: ${post.content}");
    }

    return post;
  }

  @override
  Future<void> createPost(PostEntity post) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _mockPosts.insert(0, post);
  }

  @override
  Future<void> updatePost(PostEntity post) async {
    final index = _mockPosts.indexWhere((p) => p.id == post.id);
    if (index != -1) {
      _mockPosts[index] = post;
    }
  }

  @override
  Future<void> deletePost(String id) async {
    _mockPosts.removeWhere((post) => post.id == id);
  }

  @override
  Future<void> likePost(String postId) async {
    final index = _mockPosts.indexWhere((post) => post.id == postId);
    if (index != -1) {
      _mockPosts[index] = _mockPosts[index].copyWith(likes: _mockPosts[index].likes + 1);
    }
  }
}