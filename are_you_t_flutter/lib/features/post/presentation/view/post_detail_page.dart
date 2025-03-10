import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/post_module.dart';

class PostDetailPage extends ConsumerWidget {
  final String postId;

  const PostDetailPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailViewModelProvider);
    final viewModel = ref.read(postDetailViewModelProvider.notifier);

    // 게시글 데이터 로드
    if (state.post == null && !state.isLoading) {
      viewModel.fetchPostById(postId);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('게시글 상세')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.post == null
          ? Center(child: Text(state.errorMessage ?? '게시글을 불러올 수 없습니다.'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.post!.content,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Text('❤️ ${state.post!.likes}'),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () {
                //viewModel.likePost(postId);
              },
              child: const Text('좋아요'),
            ),
          ],
        ),
      ),
    );
  }
}