import 'package:are_you_t_flutter/features/post/domain/entity/post_entity.dart';
import 'package:are_you_t_flutter/features/post/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository{
  @override
  Future<void> createPost(PostEntity post) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(String id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<PostEntity?> fetchPostById(String id) {
    // TODO: implement fetchPostById
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> fetchPosts() {
    // TODO: implement fetchPosts
    throw UnimplementedError();
  }

  @override
  Future<void> likePost(String postId) {
    // TODO: implement likePost
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(PostEntity post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}