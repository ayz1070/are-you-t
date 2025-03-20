import 'dart:math';
import '../../../../../core/constants/social_provider.dart';
import '../../../domain/entity/user_entity.dart';
import '../../../domain/repository/auth_repository.dart';

class MockAuthRepositoryImpl implements MemberRepository {
  // Mock Data 저장소 (회원 정보 리스트)
  final List<UserEntity> _mockUserDatabase = [];

  @override
  Future<UserEntity?> signUpWithSocialAccount({
    required UserEntity userEntity,
  }) async {
    // 동일한 providerId를 가진 사용자가 이미 존재하는지 확인
    final existingUser = _mockUserDatabase.firstWhere(
          (user) =>
      user.provider == userEntity.provider &&
          user.providerId == userEntity.providerId,
      orElse: () => UserEntity(
        id: '',
        email: '',
        nickname: '',
        mbti: '',
        profileImage: '',
        provider: userEntity.provider,
        providerId: userEntity.providerId,
      ),
    );

    if (existingUser.id.isNotEmpty) {
      throw Exception('이미 가입된 소셜 계정입니다.');
    }

    // Mock userId 생성
    String newUserId = 'user_${Random().nextInt(1000)}';
    final newUser = userEntity.copyWith(id: newUserId);

    // Mock Database에 저장
    _mockUserDatabase.add(newUser);

    return newUser;
  }

  @override
  Future<UserEntity?> signInWithSocialAccount() async {
    // 현재 로그인된 사용자 정보가 필요하지만, Mock에서는 랜덤으로 가져옴
    if (_mockUserDatabase.isEmpty) return null;

    // 랜덤 사용자 선택 (테스트용)
    return _mockUserDatabase[Random().nextInt(_mockUserDatabase.length)];
  }

  @override
  Future<void> signOut({required SocialProvider provider}) async {
    // 로그아웃 로직 (Mock에서는 단순히 실행 로그 출력)
    print('[$provider] 로그아웃 완료');
  }
}