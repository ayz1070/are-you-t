import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:are_you_t_flutter/features/post/presentation/widget/post_item.dart';
import '../../../../core/di/post_module.dart';

class PostListView extends ConsumerWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postListViewModelProvider);
    final viewModel = ref.read(postListViewModelProvider.notifier);

    // ✅ 상태 변경이 필요한 로직은 `build()` 안이 아니라 `addPostFrameCallback()`에서 실행
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.posts.isEmpty && !state.isLoading) {
        viewModel.fetchPosts();
      }
    });

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: state.posts.length,
      itemBuilder: (context, index) {
        final post = state.posts[index];
        return PostItem(
          profileImageUrl: 'https://picsum.photos/200/300',
          nickname: "공감봇",
          mbti: "INTP",
          title: "테스트 제목",
          content: post.content,
          likes: post.likes,
          createdAt: "9시간전",
          comments: 5,
          onTap: () {
            context.push('/post-detail');
          },
        );
      },
    );
  }
}