import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';


class SignUpWithSocialAccountUseCase {
  final AuthRepository authRepository;

  SignUpWithSocialAccountUseCase(this.authRepository);

  /// 소셜 계정으로 회원가입
  Future<UserEntity?> call({
    required UserEntity userEntity,
  }) async {
    return await authRepository.signUpWithSocialAccount(
      userEntity: userEntity,
    );
  }
}