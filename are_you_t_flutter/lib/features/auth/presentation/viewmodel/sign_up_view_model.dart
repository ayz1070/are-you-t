import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/user_entity.dart';
import '../../domain/usecase/sign_up_use_case.dart';
import '../state/sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpViewModel(this._signUpUseCase) : super(SignUpState());

  Future<void> signUp() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      UserEntity user = await _signUpUseCase.execute(
        email: state.email,
        password: state.password,
        nickname: state.nickname,
        mbti: state.mbti,
        profileImageUrl: state.profileImage,
      );
      state = state.copyWith(isLoading: false);
      // 회원 가입 성공 후 다음 화면으로 이동 로직 추가 가능
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  void updateEmail(String email) => state = state.copyWith(email: email);
  void updatePassword(String password) => state = state.copyWith(password: password);
  void updateNickname(String nickname) => state = state.copyWith(nickname: nickname);
  void updateMbti(String mbti) => state = state.copyWith(mbti: mbti);
  void updateProfileImageUrl(String url) => state = state.copyWith(profileImageUrl: url);
}