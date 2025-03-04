import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignInWithSocialAccountUseCase {
  final AuthRepository authRepository;

  SignInWithSocialAccountUseCase(this.authRepository);

  /// 소셜 계정으로 로그인
  Future<UserEntity?> call() async {
    // UserEntity 내부의 provider 사용
    return await authRepository.signInWithSocialAccount();
  }
}