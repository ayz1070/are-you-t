import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<UserEntity> execute({
    required String email,
    required String password,
  }) async {
    return await _authRepository.signInWithEmail(email, password);
  }
}