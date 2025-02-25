
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/di/auth_module.dart';

class SignUpPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpViewModelProvider);
    final viewModel = ref.read(signUpViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('회원 가입')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: viewModel.updateEmail,
              decoration: InputDecoration(labelText: '이메일'),
            ),

            TextField(
              onChanged: viewModel.updatePassword,
              decoration: InputDecoration(labelText: '비밀번호'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: state.isLoading ? null : viewModel.signUp,
              child: state.isLoading ? CircularProgressIndicator() : Text('회원 가입'),
            ),
          ],
        ),
      ),
    );
  }
}