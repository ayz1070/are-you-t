
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sign_in_page.dart';
import '../../features/auth/presentation/pages/sign_up_page.dart';

import '../../features/post/presentation/page/post_create_page.dart';
import '../../features/post/presentation/page/post_detail_page.dart';
import '../../features/post/presentation/page/post_list_page.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => PostListPage(),
    ),

    GoRoute(
      path: '/sign-up',
      builder: (context, state) => SignUpPage(),
    ),

    GoRoute(
      path: '/sign-in',
      builder: (context, state) => SignInPage(),
    ),

    GoRoute(
      path: '/posts',
      builder: (context, state) => PostListPage(),
    ),

    GoRoute(
      path: '/post-create',
      builder: (context, state) => PostCreatePage(),
    ),

    GoRoute(
      path: '/post-detail',
      builder: (context, state) {
        //final postId = state.extra as String?; // extra를 통해 전달받기
        return PostDetailPage();
      },
    ),
  ],
);