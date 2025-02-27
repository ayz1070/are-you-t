
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  Future<UserEntity> execute({
    required String email,
    required String password,
    required String nickname,
    required String mbti,
    required String profileImageUrl,
  }) async {
    // 회원 가입 요청
    UserEntity userEntity = UserEntity(
      userId: '',
      email: email,
      nickname: nickname,
      mbti: mbti,
      profileImage: profileImageUrl,
    );
    return await _authRepository.signUpWithEmail(email, password, userEntity);
  }
}