import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/post_module.dart';

class PostListPage extends ConsumerWidget {
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

    return Scaffold(
      appBar: AppBar(title: const Text('게시판 목록')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          final post = state.posts[index];
          return ListTile(
            title: Text(post.content),
            subtitle: Text('❤️ ${post.likes}'),
            onTap: () {
              context.push('/post-detail', extra: post.id);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/post-create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}