import '../entity/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts(int page, int size);
  Future<PostEntity?> fetchPostById(String id);
  Future<void> createPost(PostEntity post);
  Future<void> updatePost(PostEntity post);
  Future<void> deletePost(String id);
  Future<void> likePost(String postId);
}