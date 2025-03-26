import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../domain/usecase/fetch_post_by_id_use_case.dart';
import '../state/post_detail_state.dart';

class PostDetailViewModel extends StateNotifier<PostDetailState> {
  final FetchPostByIdUseCase fetchPostByIdUseCase;
  final logger = Logger();

  PostDetailViewModel(this.fetchPostByIdUseCase) : super(PostDetailState());

  Future<void> fetchPostById(int postId) async {
    logger.i("🔍 fetchPostById 호출됨: postId=$postId"); // postId 값 확인

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final post = await fetchPostByIdUseCase.call(postId);
      if (post != null) {
        logger.i("게시글 가져오기 성공: ${post.content}");
        state = state.copyWith(post: post, isLoading: false);
      } else {
        logger.w("⚠fetchPostByIdUseCase가 null을 반환했습니다.");
        state = state.copyWith(isLoading: false, errorMessage: "게시글을 불러올 수 없습니다.");
      }
    } catch (e) {
      logger.e("게시글 가져오기 실패: $e");
      state = state.copyWith(isLoading: false, errorMessage: "게시글을 불러올 수 없습니다.");
    }
  }
}