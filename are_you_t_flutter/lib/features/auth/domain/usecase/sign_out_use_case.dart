import '../../../../core/constants/social_provider.dart';
import '../repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  /// 소셜 계정 로그아웃
  Future<void> call({
    required SocialProvider provider,
  }) async {
    switch (provider) {
      case SocialProvider.google:
        await authRepository.signOut(provider: SocialProvider.google);
        break;
      case SocialProvider.kakao:
        await authRepository.signOut(provider: SocialProvider.kakao);
        break;
      case SocialProvider.apple:
        await authRepository.signOut(provider: SocialProvider.apple);
        break;
    }
  }
}