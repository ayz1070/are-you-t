import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/auth_module.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInViewModelProvider);
    final viewModel = ref.read(signInViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: Color(0xFFB7C9BC),
      body: Stack(
        children: [
          // ✅ 배경 이미지 추가
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/bg_login.png',
              fit: BoxFit.fitWidth, // 화면을 꽉 채우도록 설정
            ),
          ),

          // ✅ UI 요소
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              InkWell(
                onTap: () {
                  context.push('/sign-up');
                },
                borderRadius: BorderRadius.circular(10), // 터치 효과 반경
                child: Ink(
                  child: Image.asset(
                    'lib/assets/images/btn_kakao.png',
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}