import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignInWithSocialAccountUseCase {
  final AuthRepository _authRepository;

  SignInWithSocialAccountUseCase(this._authRepository);

  Future<UserEntity?> call({
    required String email,
    required String password,
  }) async {
    return await _authRepository.signInWithSocialAccount();
  }
}