class SignUpState {
  final String email;
  final String password;
  final String nickname;
  final String mbti;
  final String profileImage;
  final bool isLoading;
  final String? errorMessage;

  SignUpState({
    this.email = '',
    this.password = '',
    this.nickname = '',
    this.mbti = '',
    this.profileImage = '',
    this.isLoading = false,
    this.errorMessage,
  });

  // copyWith 메서드: 불변 객체처럼 사용
  SignUpState copyWith({
    String? email,
    String? password,
    String? nickname,
    String? mbti,
    String? profileImageUrl,
    bool? isLoading,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      nickname: nickname ?? this.nickname,
      mbti: mbti ?? this.mbti,
      profileImage: profileImage ?? this.profileImage,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}