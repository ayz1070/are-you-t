import 'package:are_you_t_flutter/core/widget/common_fab.dart';
import 'package:flutter/material.dart';
import 'package:are_you_t_flutter/core/widget/common_app_bar.dart';
import 'package:are_you_t_flutter/features/post/presentation/widget/post_list_view.dart';
import 'package:go_router/go_router.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "게시판"),
      body: const PostListView(),
      floatingActionButton: CommonFab(
        onPressed: () {
          context.push("/post-create");
        },
      ),
    );
  }
}
