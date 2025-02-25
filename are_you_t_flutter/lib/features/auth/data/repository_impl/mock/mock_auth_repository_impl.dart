import 'dart:math';

import '../../../domain/entity/user_entity.dart';
import '../../../domain/repository/auth_repository.dart';

class MockAuthRepositoryImpl implements AuthRepository {
  // Mock Data 저장소
  final List<UserEntity> _mockUserDatabase = [];

  @override
  Future<UserEntity> signUpWithEmail(String email, String password, UserEntity userEntity) async {
    // 이메일 중복 체크
    final existingUser = _mockUserDatabase.firstWhere(
          (user) => user.email == email,
      orElse: () => UserEntity(
        userId: '',
        email: '',
        nickname: '',
        mbti: '',
        profileImageUrl: '',
      ),
    );

    if (existingUser.userId.isNotEmpty) {
      throw Exception('이미 사용 중인 이메일입니다.');
    }

    // Mock userId 생성
    String newUserId = 'user_${Random().nextInt(1000)}';
    final newUser = userEntity.copyWith(userId: newUserId);

    // Mock Database에 저장
    _mockUserDatabase.add(newUser);

    return newUser;
  }

  @override
  Future<UserEntity> signInWithEmail(String email, String password) async {
    // 이메일로 사용자 조회
    final user = _mockUserDatabase.firstWhere(
          (user) => user.email == email,
      orElse: () => UserEntity(
        userId: '',
        email: '',
        nickname: '',
        mbti: '',
        profileImageUrl: '',
      ),
    );

    if (user.userId.isEmpty) {
      throw Exception('이메일 또는 비밀번호가 일치하지 않습니다.');
    }

    return user;
  }
}