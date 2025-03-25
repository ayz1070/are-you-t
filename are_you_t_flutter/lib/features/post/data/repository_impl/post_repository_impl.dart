import 'package:are_you_t_flutter/features/post/data/data_source/post_data_source.dart';
import 'package:are_you_t_flutter/features/post/data/dto/post_list_response_dto.dart';
import 'package:are_you_t_flutter/features/post/domain/entity/post_entity.dart';
import 'package:are_you_t_flutter/features/post/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource dataSource;

  PostRepositoryImpl({required this.dataSource});

  @override
  Future<List<PostEntity>> fetchPosts(int page, int size) async {
    final dtoList = await dataSource.fetchPosts(page: page, size: size);
    return dtoList.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<PostEntity?> fetchPostById(String id) async {
    final dto = await dataSource.fetchPostDetail(int.parse(id));
    return dto.toEntity();
  }

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