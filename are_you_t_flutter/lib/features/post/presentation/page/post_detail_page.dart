import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/post_module.dart';

import 'package:logger/logger.dart';


class PostDetailPage extends ConsumerWidget {
  final String? postId;
  final logger = Logger();

  PostDetailPage({Key? key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postDetailViewModelProvider);
    final viewModel = ref.read(postDetailViewModelProvider.notifier);

    // ✅ 상태 변화 감지 후 fetchPostById 실행 여부 확인
    ref.listen(postDetailViewModelProvider, (previous, next) {
      if (next.post == null && !next.isLoading) {
        if (postId != null) {
          logger.i("📢 fetchPostById 실행: postId=$postId");
          viewModel.fetchPostById(postId!);
        } else {
          logger.e("🚨 postId가 null입니다!");
        }
      }
    });

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
              state.post!.content, // 제목 필드
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              state.post!.content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '❤️ ${state.post!.likes}',
                  style: const TextStyle(fontSize: 16),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 좋아요 기능 추가 가능
                    // viewModel.likePost(postId);
                  },
                  child: const Text('좋아요'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}