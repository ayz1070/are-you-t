
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/view/pages/sign_in_page.dart';
import '../../features/auth/presentation/view/pages/sign_up_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => SignUpPage(),
    ),
  ],
);