import '../../../../core/constants/social_provider.dart';
import '../entity/user_entity.dart';

abstract class AuthRepository {
  /// 소셜 계정으로 회원가입
  Future<UserEntity?> signUpWithSocialAccount({
    required UserEntity userEntity,
  });

  /// 소셜 계정으로 로그인
  Future<UserEntity?> signInWithSocialAccount();

  /// 소셜 계정 로그아웃
  Future<void> signOut({
    required SocialProvider provider,
  });
}