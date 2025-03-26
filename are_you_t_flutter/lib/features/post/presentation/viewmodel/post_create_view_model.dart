import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/post_entity.dart';
import '../../domain/entity/post_status.dart';
import '../../domain/usecase/create_post_use_case.dart';
import '../state/post_create_state.dart';

class PostCreateViewModel extends StateNotifier<PostCreateState> {
  final CreatePostUseCase createPostUseCase;

  PostCreateViewModel({required this.createPostUseCase}) : super(PostCreateState());

  Future<PostEntity?> createPost(PostEntity post) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final createdPost = await createPostUseCase.call(post);
      state = state.copyWith(isLoading: false);
      return createdPost;
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return null;
    }
  }

  Future<PostEntity?> submitPost({
    required String title,
    required String content,
    required int memberId,
  }) async {
    if (title.isEmpty || content.isEmpty) {
      throw Exception("제목과 내용을 입력해주세요");
    }

    final newPost = PostEntity(
      id: 0,
      memberId: memberId,
      title: title,
      content: content,
      likes: 0,
      status: PostStatus.VISIBLE,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    return await createPost(newPost);
  }
}

