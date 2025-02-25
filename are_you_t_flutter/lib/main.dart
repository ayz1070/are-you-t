import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/navigation/app_router.dart';

void main() {
  runApp(
    // ProviderScope를 최상단에 추가
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'MBTI 커뮤니티',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}