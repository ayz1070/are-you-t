import '../../domain/entity/post_entity.dart';
import '../../domain/entity/post_status.dart';
import '../../domain/repository/post_repository.dart';

class MockPostRepositoryImpl implements PostRepository {
  final List<PostEntity> _mockPosts = List.generate(
    10,
        (index) => PostEntity(
      id: 'post_$index',
      memberId: 'user_$index',
      content: '게시글 내용 $index',
      likes: index * 5,
      status: PostStatus.visible,
      createdAt: DateTime.now().subtract(Duration(days: index)),
      updatedAt: DateTime.now(),
    ),
  );

  @override
  Future<List<PostEntity>> fetchPosts() async {
    await Future.delayed(const Duration(milliseconds: 500)); // 네트워크 요청 시뮬레이션
    return _mockPosts;
  }

  @override
  Future<PostEntity?> fetchPostById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockPosts.firstWhere((post) => post.id == id);
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