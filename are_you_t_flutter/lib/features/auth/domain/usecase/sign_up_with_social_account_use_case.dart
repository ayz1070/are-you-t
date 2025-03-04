import '../../../../core/constants/social_provider.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignUpWithSocialAccountUseCase {
  final AuthRepository authRepository;

  SignUpWithSocialAccountUseCase(this.authRepository);

  /// 소셜 계정으로 회원가입 (비즈니스 로직 수행)
  Future<UserEntity?> call({
    required String nickname,
    required String mbti,
    required String profileImage,
  }) async {
    // UserEntity 생성 (비즈니스 로직이 UseCase에 있음)
    final userEntity = UserEntity(
      id: '', // ID는 백엔드에서 생성됨
      email: '', // 이메일 로그인 X (소셜 로그인 기반)
      nickname: nickname,
      mbti: mbti,
      profileImage: profileImage,
      provider: SocialProvider.google, // 예시로 Google로 설정 (추후 동적 처리 가능)
    );

    return await authRepository.signUpWithSocialAccount(
      userEntity: userEntity,
    );
  }
}
