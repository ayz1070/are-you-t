import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/fetch_post_by_id_use_case.dart';
import '../state/post_detail_state.dart';

class PostDetailViewModel extends StateNotifier<PostDetailState> {
  final FetchPostByIdUseCase fetchPostByIdUseCase;

  PostDetailViewModel(this.fetchPostByIdUseCase) : super(PostDetailState());

  Future<void> fetchPostById(String postId) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final post = await fetchPostByIdUseCase.call(postId);
      state = state.copyWith(post: post, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

