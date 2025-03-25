import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/fetch_posts_use_case.dart';
import '../state/post_list_state.dart';

class PostListViewModel extends StateNotifier<PostListState> {
  final FetchPostsUseCase fetchPostsUseCase;

  PostListViewModel(this.fetchPostsUseCase) : super(PostListState());

  Future<void> fetchPosts(int page, int size) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final posts = await fetchPostsUseCase.call(page, size);
      state = state.copyWith(posts: posts, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

