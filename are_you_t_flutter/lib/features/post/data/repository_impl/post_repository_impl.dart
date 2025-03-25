import 'package:are_you_t_flutter/core/di/post_module.dart';
import 'package:are_you_t_flutter/features/post/data/data_source/post_data_source.dart';
import 'package:are_you_t_flutter/features/post/data/dto/create_post_request_dto.dart';
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
  Future<void> createPost(PostEntity post) async{
    final request = CreatePostRequestDto(title: post.title, content: post.content);
    await dataSource.createPost(request, post.memberId);
  }

  @override
  Future<void> deletePost(int id) {

  }

  @override
  Future<void> likePost(int postId) {

  }

  @override
  Future<void> updatePost(PostEntity post) {

  }
}