import '../entity/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts(int page, int size);
  Future<PostEntity?> fetchPostById(int id);
  Future<PostEntity> createPost(PostEntity post);
  Future<void> updatePost(PostEntity post);
  Future<void> deletePost(int postId);
  //Future<void> likePost(int postId);
}