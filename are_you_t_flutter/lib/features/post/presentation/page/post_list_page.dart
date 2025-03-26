import 'package:are_you_t_flutter/core/widget/common_fab.dart';
import 'package:flutter/material.dart';
import 'package:are_you_t_flutter/core/widget/common_app_bar.dart';
import 'package:are_you_t_flutter/features/post/presentation/widget/post_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/post_module.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CommonAppBar(title: "게시판"),
      body: const PostListView(),
      floatingActionButton: CommonFab(
        onPressed: () async {
          final result = await context.push("/post-create");

          if (result == true) {
            // PostListViewModel 리프레시
            ref.read(postListViewModelProvider.notifier).fetchPosts(0, 10);
          }
        },
      ),
    );
  }
}